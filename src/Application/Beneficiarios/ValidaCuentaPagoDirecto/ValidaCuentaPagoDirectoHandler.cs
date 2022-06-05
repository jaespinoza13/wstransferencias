

using Application.Beneficiarios.InterfazBeneficiariosDat;
using Application.Common.Converting;
using Application.Common.Functions;
using Application.Common.Interfaces;
using Application.Common.Models;
using Domain.Entities;
using Domain.Types;
using MediatR;
using Microsoft.Extensions.Options;
using System.Reflection;
using System.Text.Json;

namespace Application.Beneficiarios.ValidaCuentaPagoDirecto;


public class ValidaCuentaPagoDirectoHandler : RequestHandler<ReqValidaCuentaPagoDirecto, ResValidaCuentaPagoDirecto>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsOtp _wsOtp;
    private readonly IHttpService _httpService;
    private readonly ApiSettings _settings;
    private readonly IParametersInMemory _parametersInMemory;


    public ValidaCuentaPagoDirectoHandler(ILogs logs,
                                            IBeneficiariosDat beneficiariosDat,
                                            IWsOtp wsOtp,
                                            IHttpService httpService,
                                            IOptionsMonitor<ApiSettings> options,
                                            IParametersInMemory parametersInMemory
                                         )
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _wsOtp = wsOtp;
        _httpService = httpService;
        _settings = options.CurrentValue;
        _parametersInMemory = parametersInMemory;
    }


    protected override ResValidaCuentaPagoDirecto Handle(ReqValidaCuentaPagoDirecto reqValidaCuentaPagoDirecto)
    {
        string operacion = "VALIDA_CUENTA_PD";
        ResValidaCuentaPagoDirecto respuesta = new();
        respuesta.LlenarResHeader( reqValidaCuentaPagoDirecto );
        _logs.SaveHeaderLogs( reqValidaCuentaPagoDirecto, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_obtiene_datos = _beneficiariosDat.GetDatosPagoDirecto( reqValidaCuentaPagoDirecto );
            respuesta.str_res_codigo = res_obtiene_datos.codigo;

            if (res_obtiene_datos.codigo.Equals( "000" ))
            {

                var datosValidaCuenta = Conversions.ConvertConjuntoDatosToClass<Transaccion>( (ConjuntoDatos)res_obtiene_datos.cuerpo );

                datosValidaCuenta!.str_tipo_tran = "CON";
                datosValidaCuenta.int_secuencial = Convert.ToInt32( DateTime.Now.ToString( "HHmm" ) );
                datosValidaCuenta.dec_monto_tran = 0;
                datosValidaCuenta.str_cuenta_receptor = reqValidaCuentaPagoDirecto.str_num_cuenta;
                datosValidaCuenta.str_nom_receptor = String.Empty;
                datosValidaCuenta.str_observaciones = String.Empty;
                datosValidaCuenta.int_secuencial_cobis = 0;
                datosValidaCuenta.str_identificacion_receptor = Convert.ToString( datosValidaCuenta.int_fi_aut );

                var cabecera = Functions.LlenarCabeceraSolicitud( reqValidaCuentaPagoDirecto );

                var sol_tran = new SolicitudTransaccion
                {
                    cabecera = cabecera,
                    cuerpo = datosValidaCuenta
                };

                string str_data = JsonSerializer.Serialize( sol_tran );
                RespuestaTransaccion res_banred = _httpService.PostRestServiceDataAsync<RespuestaTransaccion>
                                                                    ( str_data,
                                                                        _settings.servicio_ws_banred,
                                                                        String.Empty,
                                                                        _settings.auth_ws_banred,
                                                                        AuthorizationType.BASIC,
                                                                        reqValidaCuentaPagoDirecto.str_id_transaccion
                                                                     ).Result;

                if (res_banred.codigo.Equals( "000" ) || res_banred.codigo.Equals( "0000" ))
                {

                    respuesta.str_nombre = (string)res_banred.cuerpo;
                }
                else
                {
                    if (_settings.pago_directo_pruebas == 1)
                    {
                        res_banred.codigo = "000";
                        //Solo para pruebas
                        respuesta.str_nombre = "USUARIO MEGONLINE";
                        respuesta.str_res_info_adicional = "TRANSACCIÓN EXITOSA";
                    }
                    else
                    {
                        //La cuenta no se validó en pago directo
                        res_banred.codigo = "1033";
                        respuesta.str_res_codigo = res_banred.codigo;
                        respuesta.str_res_info_adicional = _parametersInMemory.FindErrorCode( "1033" ).str_descripcion;
                    }
                }
                respuesta.str_res_codigo = res_banred.codigo;
                respuesta.str_res_estado_transaccion = res_banred.codigo.Equals( "000" ) ? "OK" : "ERR";
            }

            _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            _logs.SaveExceptionLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw;
        }
    }
}