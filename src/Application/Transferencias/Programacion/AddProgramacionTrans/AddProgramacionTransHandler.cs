using MediatR;
using Domain.Entities;
using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;
using System.Reflection;
using System.Text.Json;
using Domain.Services.Alfresco;
using System.Text;
using Application.Common.Functions;
using iText.Html2pdf;
using Microsoft.Extensions.Options;

namespace Application.Programacion;

public class AddProgramacionTransHandler : RequestHandler<ReqAddProgramacionTrans, ResAddProgramacionTrans>

{
    private readonly ILogs _logsService;
    private readonly string str_clase;
    private readonly IWsOtp _wsOtp;
    private readonly IProgramacionDat _programacionDat;
    private readonly IWsAlfresco _wsAlfresco;
    private readonly ApiSettings _ApiSettings;
    private const string str_operacion = "ADD_PROGRAMACION_TRANS";


    public AddProgramacionTransHandler(IOptionsMonitor<ApiSettings> option, ILogs logs, IProgramacionDat programacionDat, IWsOtp wsOtp, IWsAlfresco wsAlfresco)
    {
        str_clase = GetType().FullName!;
        _logsService = logs;
        _programacionDat = programacionDat;
        _wsOtp = wsOtp;
        this._wsAlfresco = wsAlfresco;
        this._ApiSettings = option.CurrentValue;


    }

    protected override ResAddProgramacionTrans Handle(ReqAddProgramacionTrans reqAddProgramacionTrans)
    {
        ResAddProgramacionTrans respuesta = new();
        respuesta.LlenarResHeader( reqAddProgramacionTrans );
        var res_tran = new RespuestaTransaccion();
        _logsService.SaveHeaderLogs( reqAddProgramacionTrans, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

        try
        {
            var requiereOtp = _wsOtp.ValidaRequiereOtp( reqAddProgramacionTrans, "ADD_PROGRAMACION_TRANS" ).Result;

            var ejecutarSolicitud = false;
            if (requiereOtp)
            {
                var res_tran_otp = _wsOtp.ValidaOtp( reqAddProgramacionTrans ).Result;
                if (res_tran_otp.codigo.Equals( "000" ))
                    ejecutarSolicitud = true;
                else
                {
                    res_tran.codigo = res_tran_otp.codigo;
                    res_tran.diccionario["str_error"] = res_tran_otp.diccionario["ERROR"];
                }
            }
            else
                ejecutarSolicitud = true;
            if (ejecutarSolicitud)
            {
                var req_get_contrato = JsonSerializer.Deserialize<ReqGetContratoPT>( JsonSerializer.Serialize( reqAddProgramacionTrans ) )!;
                var req_add_contrato_alfresco = JsonSerializer.Deserialize<DocumentoAlfresco>( JsonSerializer.Serialize( reqAddProgramacionTrans ) )!;

                var respuesta_get_contrato = GetContrato( req_get_contrato );
                string str_id_alfresco = "";
                if (respuesta_get_contrato.str_res_codigo.Equals( "000" ))
                {
                    Functions.llenar_datos_alfresco( req_add_contrato_alfresco, reqAddProgramacionTrans );
                    var base64EncodedBytes = Convert.FromBase64String( respuesta_get_contrato.datos_contrato.str_contrato );
                    var memoryStream = new MemoryStream();
                    HtmlConverter.ConvertToPdf( Encoding.UTF8.GetString( base64EncodedBytes ), memoryStream );
                    byte[] bytes = memoryStream.ToArray();
                    var hora = DateTime.Now.ToString( "HHmmssffff" );
                    req_add_contrato_alfresco.file_bytes = bytes;
                    req_add_contrato_alfresco.str_num_identifica = respuesta_get_contrato.datos_contrato.str_num_documento;
                    req_add_contrato_alfresco.int_tipo_identifica = respuesta_get_contrato.datos_contrato.int_tipo_documento;
                    req_add_contrato_alfresco.str_nombre = "TYC_PROGRAMACION_TRANSFERENCIAS_" + hora + ".pdf";
                    req_add_contrato_alfresco.str_referencia = respuesta_get_contrato.datos_contrato.str_num_documento + "_" + hora;
                    req_add_contrato_alfresco.str_observacion = "Contrato de Programción de transferencias";
                    req_add_contrato_alfresco.str_doc_extencion = "application/pdf";
                    req_add_contrato_alfresco.str_tipo_documento = "CONTRATOS";
                    req_add_contrato_alfresco.str_subtipo_documento = reqAddProgramacionTrans.str_nemonico_canal;
                    req_add_contrato_alfresco.int_tipo_identifica = req_add_contrato_alfresco.int_tipo_identifica!;
                    req_add_contrato_alfresco.str_path_repositorio = _ApiSettings.path_archivos_base + req_add_contrato_alfresco.str_num_identifica + "/" + _ApiSettings.path_archivos_contratos + "/";
                    req_add_contrato_alfresco.str_path_repositorio = req_add_contrato_alfresco.str_path_repositorio.Replace( "$CANAL$", respuesta_get_contrato.datos_contrato.str_canal );
                    req_add_contrato_alfresco.str_modelo_doc_alfresco = _ApiSettings.modelo_documento_alfresco;
                    req_add_contrato_alfresco.str_documento_id = "-1";

                    var respuesta_add_alfresco = _wsAlfresco.AddDocumentoAlfresco( req_add_contrato_alfresco, str_operacion, respuesta.str_id_transaccion );

                    if (!respuesta_add_alfresco.int_codigo_resultado.Equals( 1 ))
                    {
                        ejecutarSolicitud = false;
                        respuesta.str_res_codigo = "001";
                        respuesta.str_res_info_adicional = "Error al almacenar el contrato";
                    }
                    else
                    {
                        str_id_alfresco = respuesta_add_alfresco.str_id;
                        reqAddProgramacionTrans.str_id_contrato = str_id_alfresco;
                        res_tran = _programacionDat.AddProgramacionTrans( reqAddProgramacionTrans );

                    }
                }
            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            _logsService.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            _logsService.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }

    }
    public ResGetContratoPT GetContrato(ReqGetContratoPT reqGetContrato)
    {
        var respuesta = new ResGetContratoPT();
        RespuestaTransaccion res_tran = _programacionDat.GetContratoPT( reqGetContrato );

        if (res_tran.codigo.Equals( "000" ))
        {

            respuesta.str_res_estado_transaccion = "OK";
            respuesta.datos_contrato = Conversions.ConvertConjuntoDatosToClass<DatosContrato>( (ConjuntoDatos)res_tran.cuerpo, 0 );

            ResGetDocAlfresco respuesta_alfresco = _wsAlfresco.GetDocumentoAlfresco( respuesta.datos_contrato.str_contrato, str_operacion, reqGetContrato.str_id_transaccion );

            if (respuesta_alfresco.file_bytes != null && respuesta_alfresco.file_bytes.Length > 0)
            {
                var base64EncodedBytes = Convert.FromBase64String( respuesta_alfresco.file_bytes );
                var plantilla_contrato = Encoding.UTF8.GetString( base64EncodedBytes );
                var bytes = Encoding.UTF8.GetBytes( plantilla_contrato );
                respuesta.datos_contrato.str_contrato = Convert.ToBase64String( bytes );
            }
            else
            {
                respuesta.str_res_codigo = "001";
                respuesta.str_res_estado_transaccion = "ERR";
            }
        }
        else
            respuesta.str_res_estado_transaccion = "ERR";
        respuesta.str_res_codigo = res_tran.codigo;
        respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
        return respuesta;
    }
}