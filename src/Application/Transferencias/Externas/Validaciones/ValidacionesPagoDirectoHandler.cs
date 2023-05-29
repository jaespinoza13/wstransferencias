

using Application.Common.Interfaces;
using Application.Common.Models;
using Domain.Entities;
using Domain.Types;
using Microsoft.Extensions.Options;
using System.Reflection;
using System.Text.Json;

namespace Application.Transferencias.Externas.Validaciones;

public interface IValidacionesPagoDirecto
{
    RespuestaTransaccion ValidaPagoDirecto(ValidacionTransaccion datos_validados, Cabecera cabecera, String str_id_transaccion);
    RespuestaTransaccion ProcesarSolicitud(SolicitudTransaccion sol_tran, string str_id_transaccion);
}

public class ValidacionesPagoDirectoHandler : IValidacionesPagoDirecto
{
    private readonly ApiSettings _settings;
    private readonly IHttpService _httpService;
    private readonly ILogs _logs;
    private readonly string _clase;
    public ValidacionesPagoDirectoHandler(IOptionsMonitor<ApiSettings> options, IHttpService httpService, ILogs logs)
    {
        _settings = options.CurrentValue;
        _httpService = httpService;
        _logs = logs;
        _clase = GetType().Name;
    }

    public RespuestaTransaccion ValidaPagoDirecto(ValidacionTransaccion datos_validados, Cabecera cabecera, String str_id_transaccion)
    {
        try
        {

            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            //Se asigna nuevamente para que no se requiera deserealizarlo en un list TransferenciaDto
            respuesta.cuerpo = datos_validados;

            Transaccion datos_para_validacion_banred = new Transaccion();

            datos_para_validacion_banred.int_secuencial = datos_validados.int_secuencial;

            datos_para_validacion_banred.int_fi_aut = datos_validados.int_fi_aut;
            datos_para_validacion_banred.str_bin_aut = datos_validados.str_bin_aut;

            datos_para_validacion_banred.str_nom_ordenante = datos_validados.str_nombre_ordenante;
            datos_para_validacion_banred.str_cuenta_ordenante = datos_validados.str_num_cta_ordenante;
            datos_para_validacion_banred.str_identificacion_ordenante = datos_validados.str_num_doc_ordenante;

            datos_para_validacion_banred.str_nom_receptor = datos_validados.str_nombre_benef;
            datos_para_validacion_banred.str_cuenta_receptor = datos_validados.str_num_cta_benef;
            datos_para_validacion_banred.str_cuenta_bce = datos_validados.str_cta_bce_ifi_benef;
            datos_para_validacion_banred.str_tipo_cuenta_receptor = datos_validados.str_tipo_cta_benef;

            datos_para_validacion_banred.str_info_adicional = datos_validados.str_info_adicional;
            datos_para_validacion_banred.str_identificacion_receptor = datos_validados.str_num_doc_benef;
            datos_para_validacion_banred.int_secuencial_cobis = datos_validados.int_id_debito;
            datos_para_validacion_banred.dec_monto_tran = datos_validados.dec_monto_tran;
            datos_para_validacion_banred.str_observaciones = datos_validados.str_observaciones;


            switch (datos_validados.str_tipo_cta_benef)
            {
                case "3":   //Cuenta Corriente
                    datos_para_validacion_banred.str_tipo_cuenta_receptor = "04";
                    datos_para_validacion_banred.str_tipo_tran = "CONTR";
                    break;
                case "4":   //Cuenta de Ahorros
                    datos_para_validacion_banred.str_tipo_cuenta_receptor = "05";
                    datos_para_validacion_banred.str_tipo_tran = "CONTR";
                    break;
                case "83":   //Tarjeta de Crédito
                    datos_para_validacion_banred.str_tipo_cuenta_receptor = "02";
                    datos_para_validacion_banred.str_tipo_tran = "CONTC";
                    break;
            }

            datos_para_validacion_banred.str_nom_receptor = String.Empty;
            datos_para_validacion_banred.str_observaciones = String.Empty;
            SolicitudTransaccion sol_tran = new SolicitudTransaccion();
            sol_tran.cuerpo = datos_para_validacion_banred;
            sol_tran.cabecera = cabecera;

           return ProcesarSolicitud( sol_tran, str_id_transaccion );
        }
        catch (Exception)
        {
            throw new ArgumentException( str_id_transaccion );
        }

    }


    public RespuestaTransaccion ProcesarSolicitud(SolicitudTransaccion sol_tran, string str_id_transaccion)
    {
        RespuestaTransaccion respuesta = new RespuestaTransaccion();

        try
        {
            var req_transaccion = JsonSerializer.Deserialize<Transaccion>( JsonSerializer.Serialize( sol_tran.cuerpo ) );
            switch (req_transaccion!.str_tipo_tran)
            {
                case "TRAH":
                case "TRCO":
                case "TRTC":
                    string str_data = JsonSerializer.Serialize( sol_tran );
                    respuesta = _httpService.PostRestServiceDataAsync<RespuestaTransaccion>( str_data, _settings.servicio_ws_banred, String.Empty, _settings.auth_ws_banred, AuthorizationType.BASIC, str_id_transaccion,1 ).Result;
                    break;

                default:
                    string str_data_validar = JsonSerializer.Serialize( sol_tran );
                    respuesta = _httpService.PostRestServiceDataAsync<RespuestaTransaccion>( str_data_validar, _settings.servicio_ws_banred, String.Empty, _settings.auth_ws_banred, AuthorizationType.BASIC, str_id_transaccion,1 ).Result;
                    break;
            }
        }
        catch (Exception exception)
        {
            _logs.SaveHttpErrorLogs( respuesta, MethodBase.GetCurrentMethod()!.Name, _clase, exception, str_id_transaccion );
        }
        return respuesta;
    }
}
