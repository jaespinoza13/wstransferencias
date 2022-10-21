using MediatR;

using Domain.Entities;

using System.Reflection;

using Application.Common.Models;
using Application.Transferencias.DTO;
using Application.Common.Interfaces;
using Application.Transferencias.InterfazDat;
using Application.Common.Converting;
using Application.Common.Functions;
using Application.Transferencias.Externas.Validaciones;


namespace Application.Transferencias.Externas.Registro;

public record AddTransferenciaExternaCommand(ReqAddTransferencia ReqAddTransferencia) : IRequest<ResAddTransferencia>;

public class AddTransferenciaExternaHandler : RequestHandler<AddTransferenciaExternaCommand, ResAddTransferencia>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IWsOtp _wsOtp;
    private readonly ITransferenciasExternasDat _externasDat;
    private readonly IValidacionesPagoDirecto _validacionesPagoDirecto;

    public AddTransferenciaExternaHandler(ILogs logs, IWsOtp wsOtp, ITransferenciasExternasDat externasDat, IValidacionesPagoDirecto validacionesPagoDirecto)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _wsOtp = wsOtp;
        _externasDat = externasDat;
        _validacionesPagoDirecto = validacionesPagoDirecto;
    }

    protected override ResAddTransferencia Handle(AddTransferenciaExternaCommand request)
    {
        var reqAddTransferencia = request.ReqAddTransferencia;
        string operacion = "ADD_TRANSFERENCIA_INTERBANCARIAS";
        ResAddTransferencia respuesta = new();
        RespuestaTransaccion res_tran = new();
        ValidacionTransaccion datos_validados = new();

        try
        {
            respuesta = new ResAddTransferencia();
            respuesta.LlenarResHeader( reqAddTransferencia );
            _logs.SaveHeaderLogs( reqAddTransferencia, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

            var bl_requiere_otp = false;
            res_tran = _externasDat.ValidaOtpTransferenciaInternbancaria( reqAddTransferencia );
            if (res_tran.diccionario["str_requiere_otp"].Equals( "1009" ))
                bl_requiere_otp = true;
            else if (res_tran.diccionario["str_requiere_otp"].Equals( "1006" ))
                bl_requiere_otp = false;
            else
            {
                respuesta.str_res_codigo = res_tran.diccionario["str_requiere_otp"];
                respuesta.str_res_info_adicional = "Proceso no configurado";
                _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
                throw new ArgumentException( "Proceso no configurado" );

            }

            if (bl_requiere_otp)
            {
                res_tran = _wsOtp.ValidaOtp( reqAddTransferencia ).Result;
                if (res_tran.codigo.Equals( "000" ))
                {
                    res_tran = _externasDat.AddTransferenciaInternbancaria( reqAddTransferencia );
                }
                else
                {
                    respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["ERROR"];
                }
            }
            else
            {
                res_tran = _externasDat.AddTransferenciaInternbancaria( reqAddTransferencia );
            }

            if (res_tran.codigo.Equals( "000" ))
            {

                datos_validados = Conversions.ConvertConjuntoDatosToClass<ValidacionTransaccion>( (ConjuntoDatos)res_tran.cuerpo )!;

                //Se debe tratar de enviar por banred
                if (datos_validados.int_enviar_banred == 1 && datos_validados.int_estado == 4)
                {
                    
                    var cabecera = Functions.LlenarCabeceraSolicitud( reqAddTransferencia );
                    var res_pago_directo = ejecutar_pago_directo( datos_validados, cabecera, respuesta.str_id_transaccion );
                    //respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];
                }
                else
                {
                    respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                    //respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];
                }
            }
            else
            {
                respuesta.str_res_info_adicional = res_tran.diccionario.ContainsKey( "str_error" ) ? res_tran.diccionario["str_error"] : res_tran.diccionario["ERROR"];
            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.objAddTransferencia = respuesta.str_res_codigo.Equals( "000" ) ? Conversions.ConvertConjuntoDatosToClass<ResAddTransferencia.AddTransferencia>( (ConjuntoDatos)res_tran.cuerpo )! : null!;
            _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            _logs.SaveExceptionLogs( respuesta!, operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }
    }


    public RespuestaTransaccion ejecutar_pago_directo(ValidacionTransaccion datos_validados, Cabecera cabecera, String str_id_transaccion)
    {
        RespuestaTransaccion respuesta = new RespuestaTransaccion();
        try
        {
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
                //Cuenta Corriente
                case "3":
                    datos_para_validacion_banred.str_tipo_cuenta_receptor = "04";
                    datos_para_validacion_banred.str_tipo_tran = "TRCO";
                    break;
                //Cuenta de Ahorros
                case "4":
                    datos_para_validacion_banred.str_tipo_cuenta_receptor = "05";
                    datos_para_validacion_banred.str_tipo_tran = "TRAH";
                    break;
                //Tarjeta de Crédito
                case "83":
                    datos_para_validacion_banred.str_tipo_cuenta_receptor = "02";
                    datos_para_validacion_banred.str_tipo_tran = "TRTC";
                    break;
            }

            datos_para_validacion_banred.str_nom_receptor = String.Empty;
            datos_para_validacion_banred.str_observaciones = String.Empty;
            SolicitudTransaccion sol_tran = new SolicitudTransaccion();
            sol_tran.cuerpo = datos_para_validacion_banred;
            sol_tran.cabecera = cabecera;

            _validacionesPagoDirecto.ProcesarSolicitud( sol_tran, str_id_transaccion );

        }
        catch (Exception ex)
        {
            _logs.SaveHttpErrorLogs( datos_validados, MethodBase.GetCurrentMethod()!.Name, _clase, ex, str_id_transaccion );
            throw new ArgumentException( str_id_transaccion );
        }
        return respuesta;
    }
}