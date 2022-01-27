﻿using System.Reflection;
using System.Text.Json;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Model;
using wsTransferencias.Neg.Utils;

namespace wsTransferencias.Neg
{
    public class TransferenciasNeg
    {

        private readonly SettingsApi _settingsApi;
        private readonly string str_clase;

        public TransferenciasNeg ( SettingsApi settingsApi )
        {
            _settingsApi = settingsApi;
            this.str_clase = GetType().FullName!;
            ServiceLogs.Init( _settingsApi );
        }


        #region Métodos transferencias interbancarias

        public ResValidacionTransferencias validar_transferencia_interbancaria ( ReqValidacionTransferencia req_validar_transferencia, string str_operacion )
        {
            var respuesta = new ResValidacionTransferencias();
            respuesta.LlenarResHeader( req_validar_transferencia );
            req_validar_transferencia.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqValidacionTransferencia>( req_validar_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_validar_transferencia.str_id_transaccion;

            try
            {
                var res_tran = new TransferenciasDat( _settingsApi ).val_transf_interbancarias( req_validar_transferencia );

                if(res_tran.codigo.Equals( "000" ))
                {
                    respuesta.objValidacionTransferencia = Utils.Utils.ConvertConjuntoDatosToClass<ResValidacionTransferencias.ValidacionTransferencia>( (ConjuntoDatos) res_tran.cuerpo )!;

                    if(respuesta!.objValidacionTransferencia.int_enviar_banred == 1)
                    {
                        string str_req_validar_transferencia = JsonSerializer.Serialize( req_validar_transferencia );
                        var obj_transferencia = JsonSerializer.Deserialize<ReqTransferencia>( str_req_validar_transferencia );

                        Cabecera cabecera = Utils.Utils.llenar_cabecera( req_validar_transferencia! );
                        RespuestaTransaccion respuesta_validaciones_pago_directo = validaciones_pago_directo( respuesta, cabecera );

                        if(respuesta_validaciones_pago_directo.codigo == "0000")
                        {
                            return respuesta;
                        }
                        else
                        {
                            //Se actualiza el registro para que la transacción se enviada por SPI                            
                            RespuestaTransaccion respuesta_cambio_tipo_transfer = new TransferenciasDat( _settingsApi ).set_envio_transf_por_spi( obj_transferencia! );

                            if(respuesta_cambio_tipo_transfer.codigo == "000")
                            {
                                respuesta.objValidacionTransferencia.int_enviar_banred = 0;
                            }

                            if(respuesta_validaciones_pago_directo.codigo == _settingsApi.codigo_error_datos_incorrectos_banred)
                            {

                                ResTransferencia respuesta_error_validacion = new ResTransferencia();
                                respuesta_error_validacion.str_res_codigo = _settingsApi.codigo_error_datos_incorrectos_coopmego;
                                respuesta_error_validacion.str_res_info_adicional = _settingsApi.msj_error_validacion;

                                Utils.ServiceLogs.SaveResponseLogs( respuesta_error_validacion, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                            }
                        }
                    }
                }

                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta!, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }
            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }


        public ResTransferencia add_transf_interbancarias ( ReqAddTransferencia req_add_transferencia, string str_operacion )
        {
            ResTransferencia respuesta = new ResTransferencia();
            try
            {
                respuesta = new ResTransferencia();
                respuesta.LlenarResHeader( req_add_transferencia );
                req_add_transferencia.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqAddTransferencia>( req_add_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                respuesta.str_id_transaccion = req_add_transferencia.str_id_transaccion;


                var res_tran = new TransferenciasDat( _settingsApi ).add_transf_interbancarias( req_add_transferencia );

                if(res_tran.codigo.Equals( "000" ))
                {
                    ConjuntoDatos ds_datos_respuesta = (ConjuntoDatos) res_tran.cuerpo;
                    ResTransferencia datos_validados = new ResTransferencia();
                    ResTransferencia datos_debito = new ResTransferencia();
                    foreach(var item in ds_datos_respuesta.lst_tablas[0].lst_filas)
                    {
                        datos_validados = (ResTransferencia) Converting.MapDictToObj( item.nombre_valor, typeof( ResTransferencia ) );

                    }
                    foreach(var item in ds_datos_respuesta.lst_tablas[1].lst_filas)
                    {
                        datos_debito = (ResTransferencia) Converting.MapDictToObj( item.nombre_valor, typeof( ResTransferencia ) );
                    }

                    datos_validados.int_num_referencia = datos_debito.int_num_referencia;
                    datos_validados.int_id_debito = datos_debito.int_id_debito;
                    datos_validados.int_id_comision = datos_debito.int_id_comision;
                    datos_validados.int_id_otra_comision = datos_debito.int_id_otra_comision;
                    datos_validados.int_estado = datos_debito.int_estado;
                    datos_validados.str_fecha_transac = datos_debito.str_fecha_transac;

                    respuesta = datos_validados;

                    //Se debe tratar de enviar por banred
                    if(datos_validados.int_enviar_banred == 1 && datos_validados.int_estado == 4)
                    {
                        var cabecera = Utils.Utils.llenar_cabecera( req_add_transferencia );
                        ejecutar_pago_directo( datos_validados, cabecera );
                        respuesta = datos_validados;
                    }
                    else
                    {
                        respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                        respuesta.str_res_codigo = res_tran.codigo;
                        respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                        return respuesta;
                    }
                }
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta;
        }

        #endregion

        public ResGetTransferencias get_consulta_transferencias ( ReqGetTransferencias req_get_tranferencias, string str_operacion )
        {
            var respuesta = new ResGetTransferencias();
            respuesta.LlenarResHeader( req_get_tranferencias );
            req_get_tranferencias.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqGetTransferencias>( req_get_tranferencias, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_get_tranferencias.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new TransferenciasDat( _settingsApi ).get_consulta_transferencias( req_get_tranferencias );

                respuesta.lst_tranferencias = Utils.Utils.ConvertConjuntoDatosToListClass<Transferencias>( (ConjuntoDatos) res_tran.cuerpo );

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }

        public RespuestaTransaccion ProcesarSolicitud ( SolicitudTransaccion sol_tran, string str_operacion )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                var req_transaccion = JsonSerializer.Deserialize<Transaccion>( JsonSerializer.Serialize( sol_tran.cuerpo ) );
                switch(req_transaccion!.str_tipo_tran)
                {
                    case "TRAH":
                    case "TRCO":
                    case "TRTC":
                        //case "VERI":
                        respuesta = pagar( sol_tran );
                        break;
                    default:
                        respuesta = validar( sol_tran );
                        break;
                }
            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta;
        }

        /// <summary>
        /// Validar los datos para la transferencia
        /// </summary>
        /// <param name="sol_tran"></param>
        /// <param name="str_operacion"></param>
        /// <returns></returns>
        public RespuestaTransaccion validar ( SolicitudTransaccion sol_tran )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                respuesta = conectar_banred( sol_tran );

            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta;
        }

        /// <summary>
        /// Transferir
        /// </summary>
        /// <param name="sol_tran"></param>
        /// <param name="str_operacion"></param>
        /// <returns></returns>
        public RespuestaTransaccion pagar ( SolicitudTransaccion sol_tran )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                respuesta = conectar_banred( sol_tran );

            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta;
        }


        public RespuestaTransaccion validaciones_pago_directo ( dynamic datos_validados, Cabecera cabecera )
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


                switch(datos_validados.str_tipo_cta_benef)
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

                datos_para_validacion_banred.str_nom_receptor = "";
                datos_para_validacion_banred.str_observaciones = "";
                SolicitudTransaccion sol_tran = new SolicitudTransaccion();
                sol_tran.cuerpo = datos_para_validacion_banred;
                sol_tran.cabecera = cabecera;

                respuesta = ProcesarSolicitud( sol_tran, "" );

            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta;
        }


        public RespuestaTransaccion conectar_banred ( SolicitudTransaccion sol_tran )
        {
            var respuesta = new RespuestaTransaccion();
            try
            {

                string url = _settingsApi.servicio_ws_banred;
                string content_type = ApplicationContenTypes.JSON_UTF8;

                string str_usuario = _settingsApi.user_ws_banred;
                string str_contrasenia = _settingsApi.pass_ws_banred;

                RestClient rest_client = new RestClient( url, content_type, str_usuario, str_contrasenia );

                var obj = rest_client.post_string_content( sol_tran );
                respuesta = JsonSerializer.Deserialize<RespuestaTransaccion>( obj.ToString()! );

            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta!;
        }

       
        public RespuestaTransaccion ejecutar_pago_directo ( ResTransferencia datos_validados, Cabecera cabecera )
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


                switch(datos_validados.str_tipo_cta_benef)
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

                datos_para_validacion_banred.str_nom_receptor = "";
                datos_para_validacion_banred.str_observaciones = "";
                SolicitudTransaccion sol_tran = new SolicitudTransaccion();
                sol_tran.cuerpo = datos_para_validacion_banred;
                sol_tran.cabecera = cabecera;

                ProcesarSolicitud( sol_tran, "" );

            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
            return respuesta;
        }


        #region "Transferencias internas"
        public ResValidacionTransferencias validar_transfer_interna ( ReqValidacionTransferencia req_validar_transferencia, string str_operacion )
        {
            var respuesta = new ResValidacionTransferencias();
            respuesta.LlenarResHeader( req_validar_transferencia );
            req_validar_transferencia.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqValidacionTransferencia>( req_validar_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_validar_transferencia.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new TransferenciasDat( _settingsApi ).validar_transfer_interna( req_validar_transferencia );

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
                respuesta.bl_requiere_otp = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_validar_transferencia, str_operacion ).Result.codigo.Equals( "1009" );

                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;
        }

        public ResComun add_transferencia_interna ( ReqAddTransferencia req_add_transferencia, string str_operacion )
        {
            var respuesta = new ResComun();
            respuesta.LlenarResHeader( req_add_transferencia );
            req_add_transferencia.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqAddTransferencia>( req_add_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_add_transferencia.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new TransferenciasDat( _settingsApi ).add_transferencia_interna( req_add_transferencia );

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;

        }

        #endregion

    }
}
