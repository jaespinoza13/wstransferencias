using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;
using MediatR;
using System.Reflection;
using Domain.Entities;
using Domain.Parameters;
using System.Text;
using System.Globalization;
using Microsoft.Extensions.Options;

namespace Application.Transferencias.Comprobante;


public class ComprobanteTransferenciaHandler : IRequestHandler<ReqComprobanteTransferencia, ResComprobanteTransferencia>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly ApiSettings _settings;
    private readonly IComprobanteTransferencia _consultaTransferencias;
    private readonly IParametersInMemory _parameters;
    public ComprobanteTransferenciaHandler(IOptionsMonitor<ApiSettings> option, ILogs logs, IComprobanteTransferencia comprobanteTransferencia, IParametersInMemory parameters)
    {
        _settings = option.CurrentValue;
        _logs = logs;
        _clase = GetType().Name;
        _consultaTransferencias = comprobanteTransferencia;
        _parameters = parameters;
    }

    public async Task<ResComprobanteTransferencia> Handle(ReqComprobanteTransferencia reqComprobanteTransferencia, CancellationToken cancellationToken)
    {
        string operacion = "GET_COMPROBANTE_TRANSFERENCIA";
        ResComprobanteTransferencia respuesta = new();
        respuesta.LlenarResHeader( reqComprobanteTransferencia );
        await _logs.SaveHeaderLogs( reqComprobanteTransferencia, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            RespuestaTransaccion res_tran = await _consultaTransferencias.get_comprobante_transferencia( reqComprobanteTransferencia );

            if (res_tran.codigo.Equals( "000" ))
            {
                var comprobante = Conversions.ConvertConjuntoDatosToClass<DatosComprobante>( (ConjuntoDatos)res_tran.cuerpo );
                string template = String.Empty;

                if (comprobante != null)
                {
                    switch (Convert.ToInt32( res_tran.diccionario["int_tipo_transfer"] ))
                    {
                        case 1:
                            template = ComprobanteMisMego( comprobante! );
                            break;
                        case 2:
                        case 3:
                            template = ComprobanteOtrasCtas( comprobante! );
                            break;
                        case 4:
                            template = ComprobantePagoTarjetas( comprobante! );
                            break;
                        default:
                            respuesta.objComprobante = null!;
                            break;
                    }
                }
                else
                {
                    respuesta.objComprobante = null!;
                }

                byte[] plainTextBytes = Encoding.UTF8.GetBytes( template );
                var myBase64ret = Convert.ToBase64String( plainTextBytes );
                respuesta.objComprobante.file_bytes = myBase64ret;
                respuesta.objComprobante.str_doc_extencion = "application/html";
            }

            respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            await _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            await _logs.SaveExceptionLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }
    }

    internal string ComprobanteMisMego(DatosComprobante comprobante)
    {
        string rutaPlantilla = Directory.GetCurrentDirectory() + _settings.transf_mis_cta_mego;
        string str_plantilla = File.ReadAllText( rutaPlantilla, Encoding.Default );

        str_plantilla = str_plantilla.Replace( "$tipo_mov$", comprobante.str_tipo_movimiento );
        str_plantilla = ReplaceDatosGenerales( comprobante, str_plantilla );
        str_plantilla = str_plantilla.Replace( "$nom_beneficiario$", comprobante.str_nombre_beneficiario );
        str_plantilla = str_plantilla.Replace( "$doc_beneficiario$", comprobante.str_documento_beneficiario );
        str_plantilla = str_plantilla.Replace( "$num_cta_beneficiario$", comprobante.str_num_cta_beneficiario );
        str_plantilla = str_plantilla.Replace( "$concepto$", comprobante.str_concepto );

        return str_plantilla;
    }
    internal string ComprobanteOtrasCtas(DatosComprobante comprobante)
    {
        string rutaPlantilla = Directory.GetCurrentDirectory() + _settings.transf_otras_cta;
        string str_plantilla = File.ReadAllText( rutaPlantilla, Encoding.Default );

        str_plantilla = ReplaceDatosGenerales( comprobante, str_plantilla );

        str_plantilla = str_plantilla.Replace( "$tipo_mov$", comprobante.str_tipo_movimiento );
        str_plantilla = str_plantilla.Replace( "$nom_beneficiario$", comprobante.str_nombre_beneficiario );
        str_plantilla = str_plantilla.Replace( "$nom_institicion_beneficiario$", comprobante.str_ifi_beneficiario );
        str_plantilla = str_plantilla.Replace( "$num_cta_beneficiario$", comprobante.str_num_cta_beneficiario );
        str_plantilla = str_plantilla.Replace( "$concepto$", comprobante.str_observacion );

        return str_plantilla;
    }

    internal string ComprobantePagoTarjetas(DatosComprobante comprobante)
    {
        string rutaPlantilla = Directory.GetCurrentDirectory() + _settings.pago_tarjetas;
        string str_plantilla = File.ReadAllText( rutaPlantilla, Encoding.Default );

        str_plantilla = ReplaceDatosGenerales( comprobante, str_plantilla );

        str_plantilla = str_plantilla.Replace( "$nom_beneficiario$", comprobante.str_nombre_beneficiario );
        str_plantilla = str_plantilla.Replace( "$nom_institicion_beneficiario$", comprobante.str_ifi_beneficiario );
        str_plantilla = str_plantilla.Replace( "$num_cta_beneficiario$", comprobante.str_num_cta_beneficiario );
        str_plantilla = str_plantilla.Replace( "$concepto$", comprobante.str_observacion );

        return str_plantilla;
    }

    internal string ReplaceDatosGenerales(DatosComprobante comprobante, string str_plantilla)
    {
        string str_logo = _settings.logos_canales + "logo_" + comprobante.str_canal!.ToLower() + ".svg";
        str_plantilla = ReplaceCabecera( str_plantilla );
        str_plantilla = ReplaceDatosDesde( comprobante, str_plantilla );

        str_plantilla = str_plantilla.Replace( "$descrip_tipo_trans$", comprobante.str_descripcion_tipo_transf );
        str_plantilla = str_plantilla.Replace( "$canal$", str_logo );
        str_plantilla = str_plantilla.Replace( "$fecha$", comprobante.dt_fecha );
        str_plantilla = str_plantilla.Replace( "$hora$", comprobante.dt_hora );
        var str_decrip_tipo_mov = comprobante.str_tipo_movimiento is "NC" ? "acreditado" : "debitado";
        str_plantilla = str_plantilla.Replace( "$descrip_tipo_mov$", str_decrip_tipo_mov );
        str_plantilla = str_plantilla.Replace( "$costo_servicio$", String.Format( "{0:C2}", comprobante.dec_comision.ToString( "C", new CultureInfo( "en-US", false ).NumberFormat ) ) );
        str_plantilla = str_plantilla.Replace( "$monto$", String.Format( "{0:C2}", comprobante.dec_monto.ToString( "C", new CultureInfo( "en-US", false ).NumberFormat ) ) );
        str_plantilla = str_plantilla.Replace( "$referencia$", comprobante.int_referencia.ToString() );

        return str_plantilla;
    }

    internal string ReplaceCabecera(string str_plantilla)
    {
        List<Parametro> lst_cabecera = _parameters.FindParameterName( "DATOS CABECERA COMPROBANTE" );

        str_plantilla = str_plantilla.Replace( "$nom_institucion$", lst_cabecera[1].str_valor_ini );
        str_plantilla = str_plantilla.Replace( "$contribuyente$", lst_cabecera[4].str_valor_ini );
        str_plantilla = str_plantilla.Replace( "$resolucion_key$", lst_cabecera[2].str_valor_ini );
        str_plantilla = str_plantilla.Replace( "$resolucion_value$", lst_cabecera[2].str_valor_fin );
        str_plantilla = str_plantilla.Replace( "$direccion_key$", lst_cabecera[0].str_valor_ini );
        str_plantilla = str_plantilla.Replace( "$direccion_value$", lst_cabecera[0].str_valor_fin );
        str_plantilla = str_plantilla.Replace( "$ruc_key$", lst_cabecera[3].str_valor_ini );
        str_plantilla = str_plantilla.Replace( "$ruc_value$", lst_cabecera[3].str_valor_fin );
        return str_plantilla;
    }

    internal string ReplaceDatosDesde(DatosComprobante comprobante, string str_plantilla)
    {
        str_plantilla = str_plantilla.Replace( "$nom_ordenante$", comprobante.str_nombre_ordenante );
        str_plantilla = str_plantilla.Replace( "$doc_ordenante$", comprobante.str_documento_ordenante );
        str_plantilla = str_plantilla.Replace( "$num_cta_ordenante$", comprobante.str_num_cta_ordenante );

        return str_plantilla;
    }

   
}

