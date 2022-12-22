
using MediatR;
using Application.Common.Models;
using Application.Common.Interfaces;
using Application.Transferencias.InterfazDat;
using System.Reflection;
using Application.Common.Converting;
using Domain.Entities;
using Application.Common.Functions;
using System.Text.Json;
using Microsoft.Extensions.Options;
using Application.Transferencias.DTO;

namespace Application.Transferencias.Externas.Validaciones;

public record ValidaTransferenciaExternaCommand(ReqValidaTransferencia ReqValidaTransferencia) : IRequest<ResValidaTransferencia>;

public class ValidaTransferenciaExternaHandler : RequestHandler<ValidaTransferenciaExternaCommand, ResValidaTransferencia>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly ITransferenciasExternasDat _externasDat;
    private readonly IValidacionesPagoDirecto _validacionesPagoDirecto;
    private readonly ApiSettings _settings;
    private readonly IParametersInMemory _parametersInMemory;



    public ValidaTransferenciaExternaHandler(ILogs logs,
                                            ITransferenciasExternasDat externasDat,
                                            IValidacionesPagoDirecto validacionesPagoDirecto,
                                            IOptionsMonitor<ApiSettings> option,
                                            IParametersInMemory parametersInMemory
                                            )
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _externasDat = externasDat;
        _validacionesPagoDirecto = validacionesPagoDirecto;
        _settings = option.CurrentValue;
        _parametersInMemory = parametersInMemory;
    }

    protected override ResValidaTransferencia Handle(ValidaTransferenciaExternaCommand request)
    {

        var validaTransferenciaExterna = request.ReqValidaTransferencia;
        string operacion = "VALIDA_TRANSFERENCIA_EXTERNA";
        ResValidaTransferencia respuesta = new();
        respuesta.LlenarResHeader( validaTransferenciaExterna );

        _logs.SaveHeaderLogs( validaTransferenciaExterna, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = _externasDat.ValidaTransferenciaInterbancaria( validaTransferenciaExterna );
            respuesta.str_res_codigo = res_tran.codigo;

            if (res_tran.codigo.Equals( "000" ))
            {
                respuesta.int_solicitud = Convert.ToInt32( res_tran.diccionario["int_id_solicitud"] );
                
                var reqAddTransferencia = JsonSerializer.Deserialize<ReqAddTransferencia>( JsonSerializer.Serialize( validaTransferenciaExterna ) )!;
                reqAddTransferencia.int_solicitud = Convert.ToInt32( res_tran.diccionario["int_id_solicitud"] );
                _logs.SaveHeaderLogs( reqAddTransferencia, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

                var res_tran_otp = _externasDat.ValidaOtpTransferenciaInternbancaria( reqAddTransferencia );

                if (res_tran_otp.diccionario["str_requiere_otp"].Equals( "1009" ))
                    respuesta.bl_requiere_otp = true;
                else if (res_tran_otp.diccionario["str_requiere_otp"].Equals( "1006" ))
                    respuesta.bl_requiere_otp = false;
                else {
                    respuesta.str_res_codigo = res_tran.diccionario["str_requiere_otp"];
                    respuesta.str_res_info_adicional = "Proceso no configurado";
                    _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
                    throw new ArgumentException( "Proceso no configurado" );

                }
                respuesta.objValidacionTransferencia = Conversions.ConvertConjuntoDatosToClass<ValidacionTransferencia>( (ConjuntoDatos)res_tran.cuerpo )!;

                if (respuesta.objValidacionTransferencia.int_enviar_banred == 1)
                {
                    var res_validacion_transferencia = Conversions.ConvertConjuntoDatosToClass<ValidacionTransaccion>( (ConjuntoDatos)res_tran.cuerpo )!;
                    Cabecera cabecera = Functions.LlenarCabeceraSolicitud( validaTransferenciaExterna! );

                    RespuestaTransaccion respuesta_validaciones_pago_directo = _validacionesPagoDirecto.ValidaPagoDirecto( res_validacion_transferencia, cabecera, respuesta.str_id_transaccion );

                    if (respuesta_validaciones_pago_directo.codigo == "0000")
                    {
                        respuesta.str_res_codigo = "000";
                        respuesta.str_res_estado_transaccion = "OK";
                        respuesta.str_res_info_adicional = respuesta_validaciones_pago_directo.diccionario["ERROR"].ToString();
                    }
                    else
                    {
                        //Se actualiza el registro para que la transacción se enviada por SPI                            
                        var obj_transferencia = JsonSerializer.Deserialize<ReqTransferencia>( JsonSerializer.Serialize( validaTransferenciaExterna ) )!;
                        obj_transferencia.int_id_comprobar_transfer = Convert.ToInt32( res_tran.diccionario["int_id_solicitud"]);
                        RespuestaTransaccion respuesta_cambio_tipo_transfer = _externasDat.SetEnvioTransferenciaSPI( obj_transferencia! );

                        if (respuesta_cambio_tipo_transfer.codigo == "000")
                        {
                            // Se actualiza el costo de la comisión cuando se envia por spi
                            decimal dec_comision = Convert.ToDecimal( respuesta_cambio_tipo_transfer.diccionario["dec_comision"] );
                            respuesta.objValidacionTransferencia.dec_comision = dec_comision;
                            respuesta.objValidacionTransferencia.int_enviar_banred = 0;
                        }

                        if (respuesta_validaciones_pago_directo.codigo == _settings.codigo_error_datos_incorrectos_banred)
                        {
                            ResTransferencia respuesta_error_validacion = new ResTransferencia();
                            respuesta_error_validacion.str_res_codigo = _settings.codigo_error_datos_incorrectos_coopmego;
                        }
                        respuesta.str_res_info_adicional = _parametersInMemory.FindErrorCode( "1033" ).str_descripcion;

                    }
                }

            }
            else
            {
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];
            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";

            _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

            return respuesta;
        }
        catch (Exception exception)
        {
            _logs.SaveExceptionLogs( respuesta!, operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }
    }
}
