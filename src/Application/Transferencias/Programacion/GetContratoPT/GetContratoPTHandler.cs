using System.Reflection;

using Application.Common.Models;
using Application.Common.Interfaces;
using MediatR;
using Application.Common.Functions;
using Application.Common.Converting;
using System.Text.Json;
using Domain.Services.Alfresco;
using Domain.Entities;

namespace Application.Programacion;

public class GetContratoPTHandler : RequestHandler<ReqGetContratoPT, ResGetContratoPT>
{
    private readonly IProgramacionDat _contratoService;
    private readonly ILogs _logsService;
    private readonly string str_clase;
    private readonly IParametersInMemory _parameters;
    private readonly IWsAlfresco _wsAlfresco;





    public GetContratoPTHandler(IProgramacionDat programacionService, ILogs logsService, IParametersInMemory parameters, IWsAlfresco wsAlfresco)
    {
        this._contratoService = programacionService;
        this._logsService = logsService;
        this.str_clase = GetType().FullName!;
        _parameters = parameters;
        _wsAlfresco = wsAlfresco;
    }

    protected override ResGetContratoPT Handle(ReqGetContratoPT reqGetContratoPT)
    {
        string str_operacion = "GET_CONTRATO_TC";
        var respuesta = new ResGetContratoPT();
        respuesta.LlenarResHeader( reqGetContratoPT );
        _logsService.SaveHeaderLogs( reqGetContratoPT, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
        try
        {

            RespuestaTransaccion res_tran = _contratoService.GetContratoPT( reqGetContratoPT );
            string contrato = "";
            if (res_tran.codigo.Equals( "000" ))
            {

                respuesta.datos_contrato = Conversions.ConvertConjuntoDatosToClass<Contrato>( (ConjuntoDatos)res_tran.cuerpo );
                if (respuesta.datos_contrato.str_contrato != "" && respuesta.datos_contrato.str_contrato != " ")
                {
                    ResGetDocAlfresco resGetDocAlfresco = _wsAlfresco.GetDocumentoAlfresco( respuesta.datos_contrato.str_contrato, str_operacion, reqGetContratoPT.str_id_transaccion );
                    if (resGetDocAlfresco != null && resGetDocAlfresco.int_codigo_resultado == 0)
                        contrato = resGetDocAlfresco.file_bytes;
                    else
                    {
                        res_tran.codigo = "001";
                        res_tran.diccionario["str_error"] = _parameters.FindErrorCode( "001" )!.str_valor_ini;
                    }
                }

            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            _logsService.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.datos_contrato.str_contrato = contrato;
            return respuesta;
        }
        catch (Exception exception)
        {
            _logsService.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
            throw new ArgumentException( reqGetContratoPT.str_id_transaccion )!;
        }
    }

}