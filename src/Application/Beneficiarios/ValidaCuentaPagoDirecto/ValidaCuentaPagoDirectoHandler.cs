

using Application.Common.Converting;
using Application.Common.Functions;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Transferencias.Externas.Validaciones;
using Domain.Entities;
using Domain.Types;
using MediatR;
using Microsoft.Extensions.Options;
using System.Reflection;
using System.Text.Json;

namespace Application.Beneficiarios;


public class ValidaCuentaPagoDirectoHandler : RequestHandler<ReqValidaCuentaPagoDirecto, ResValidaCuentaPagoDirecto>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsOtp _wsOtp;
    private readonly IHttpService _httpService;
    private readonly ApiSettings _settings;
    private readonly IParametersInMemory _parametersInMemory;
    private readonly IValidacionesPagoDirecto _validacionesPagoDirecto;

    public ValidaCuentaPagoDirectoHandler(ILogs logs,
                                            IBeneficiariosDat beneficiariosDat,
                                            IValidacionesPagoDirecto validacionesPagoDirecto,
                                            IWsOtp wsOtp,
                                            IHttpService httpService,
                                            IOptionsMonitor<ApiSettings> options,
                                            IParametersInMemory parametersInMemory
                                         )
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _validacionesPagoDirecto = validacionesPagoDirecto;
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

                var res_validacion_transferencia = JsonSerializer.Deserialize<ValidacionTransaccion>( JsonSerializer.Serialize( datosValidaCuenta ));

                res_validacion_transferencia!.str_tipo_tran = "CON";
                res_validacion_transferencia.int_secuencial = Convert.ToInt32( DateTime.Now.ToString( "HHmm" ) );
                res_validacion_transferencia.dec_monto_tran = 0;
                res_validacion_transferencia.str_num_cta_benef = reqValidaCuentaPagoDirecto.str_num_cuenta;
                res_validacion_transferencia.str_nombre_benef = String.Empty;
                res_validacion_transferencia.str_observaciones = String.Empty;
                res_validacion_transferencia.int_secuencial_cobis = 0;
                res_validacion_transferencia.str_tipo_cta_benef = reqValidaCuentaPagoDirecto.int_tipo_producto.ToString();
                res_validacion_transferencia.str_num_doc_benef = reqValidaCuentaPagoDirecto.str_num_documento;
                res_validacion_transferencia.str_num_cta_ordenante = String.Empty;
                res_validacion_transferencia.str_num_doc_ordenante = datosValidaCuenta.str_identificacion_ordenante;
                res_validacion_transferencia.str_nombre_ordenante = datosValidaCuenta.str_nom_ordenante;

                var cabecera = Functions.LlenarCabeceraSolicitud( reqValidaCuentaPagoDirecto );
              
                RespuestaTransaccion res_banred = _validacionesPagoDirecto.ValidaPagoDirecto( res_validacion_transferencia, cabecera, respuesta.str_id_transaccion );
               
                if (res_banred.codigo.Equals( "000" ) || res_banred.codigo.Equals( "0000" ))
                {

                    respuesta.str_nombre = JsonSerializer.Deserialize<string>(JsonSerializer.Serialize( res_banred.cuerpo));//(string)res_banred.cuerpo;
                    res_banred.codigo = "000";
                }
                else
                {
                    if (_settings.pago_directo_pruebas == 1)
                    {
                        res_banred.codigo = "000";
                        //Solo para pruebas
                        respuesta.str_nombre = "            ";
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