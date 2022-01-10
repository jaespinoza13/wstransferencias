﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Model;
using wsTransferencias.Neg.Utils;

namespace wsTransferencias.Neg
{
    public class TransferenciasNeg
    {

        private readonly ServiceSettings _serviceSettings;
        private readonly string str_clase;

        public TransferenciasNeg(ServiceSettings serviceSettings)
        {
            _serviceSettings = serviceSettings;
            this.str_clase = GetType().FullName!;
            new Utils.ServiceLogs(_serviceSettings);
        }

        public object validar_transferencia(ReqValidacionTransferenciaDto req_validar_transferencia, string str_operacion)
        {
            var respuesta = new object();

            try
            {

                var res_tran = new RespuestaTransaccion();

                switch (req_validar_transferencia.str_nemonico_tipo_transferencia)
                {
                    case "TRN_MIS_CUENTAS_COOPMEGO":
                    case "TRN_OTRAS_CUENTAS_COOPMEGO":
                        respuesta = new ResValidacionTransferencias();
                        respuesta = validar_transfer_interna(req_validar_transferencia,str_operacion);
                        break;

                    case "TRN_EXTERNAS":
                        respuesta = new ResTransferencia();
                        respuesta = get_val_transf_interbancarias(req_validar_transferencia, str_operacion);
                        break;

                    default:
                        break;
                }


            }
            catch (Exception exception)
            {                
                throw;
            }

            return respuesta;
        }

        public object add_transferencia(ReqTransferencia req_transferencia, string str_operacion)
        {
            //RespuestaTransaccion respuesta = null;

            var respuesta = new object();
            try
            {             

                switch (req_transferencia.str_nemonico_tipo_transferencia)
                {
                    case "TRN_MIS_CUENTAS_COOPMEGO":
                    case "TRN_OTRAS_CUENTAS_COOPMEGO":
                        respuesta = new ResAddTransferenciaInterna();
                        respuesta = add_transfer_interna(req_transferencia, str_operacion);
                        break;

                    case "TRN_EXTERNAS":
                        respuesta = new ResTransferencia();
                        respuesta = add_transf_interbancarias(req_transferencia, str_operacion);
                        break;

                    default:
                        break;
                }
            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }

        #region Métodos transferencias interbancarias

        public ResTransferencia get_val_transf_interbancarias(ReqValidacionTransferenciaDto req_validar_transferencia, string str_operacion)
        {
            ResTransferencia respuesta = new ResTransferencia();
            
            try
            {
                respuesta = new ResTransferencia();
                respuesta.LlenarResHeader(req_validar_transferencia);
                req_validar_transferencia.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqValidacionTransferenciaDto>(req_validar_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
                respuesta.str_id_transaccion = req_validar_transferencia.str_id_transaccion;

                var res_tran = new TransferenciasDat(_serviceSettings).get_val_transf_interbancarias(req_validar_transferencia);
                
                if (res_tran.codigo.Equals("000"))
                {
                    respuesta = Utils.Utils.ConvertConjuntoDatosToClass<ResTransferencia>((ConjuntoDatos)res_tran.cuerpo);

                    if (respuesta.int_enviar_banred == 1) //Se debe tratar de enviar por banred
                    {
                        RespuestaTransaccion respuesta_validaciones_pago_directo = null;

                        //ReqTransferencia req_cabecera = (ReqTransferencia)req_validar_transferencia.;
                        ReqTransferencia obj_transferencia = JsonConvert.DeserializeObject<ReqTransferencia>(JsonConvert.SerializeObject(req_validar_transferencia));

                        Cabecera cabecera = llenar_cabecera(obj_transferencia);                       
                        respuesta_validaciones_pago_directo = validaciones_pago_directo(respuesta, cabecera);
                      
                        if (respuesta_validaciones_pago_directo.codigo == "0000" || respuesta_validaciones_pago_directo.codigo == "000")
                        {
                            return respuesta;
                        }
                        else
                        {
                            RespuestaTransaccion respuesta_cambio_tipo_transfer = new RespuestaTransaccion();
                            //Se actualiza el registro para que la transacción se enviada por SPI                            
                            respuesta_cambio_tipo_transfer = new TransferenciasDat(_serviceSettings).set_envio_transf_por_spi(obj_transferencia);
                           
                            if (respuesta_cambio_tipo_transfer.codigo == "000")
                            {
                                respuesta.int_enviar_banred = 0;
                            }

                            if (respuesta_validaciones_pago_directo.codigo == _serviceSettings.codigo_error_datos_incorrectos_banred)//ConfigurationManager.AppSettings.Get("codigo_error_datos_incorrectos_banred"))
                            {                               

                                ResTransferencia respuesta_error_validacion = new ResTransferencia();
                                respuesta_error_validacion.str_res_codigo = _serviceSettings.codigo_error_datos_incorrectos_coopmego;
                                respuesta_error_validacion.str_res_info_adicional = _serviceSettings.msj_error_validacion;

                                Utils.ServiceLogs.SaveResponseLogs(respuesta_error_validacion, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
                                return respuesta_error_validacion;
                            }
                        }
                    }
                }

                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals("000") ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch (Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }
            Utils.ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }


        public ResTransferencia add_transf_interbancarias(ReqTransferencia req_transferencia, string str_operacion)
        {
            //RespuestaTransaccion respuesta = null;
            ResTransferencia respuesta = new ResTransferencia();
            try
            {
                respuesta = new ResTransferencia();
                respuesta.LlenarResHeader(req_transferencia);
                req_transferencia.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqTransferencia>(req_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
                respuesta.str_id_transaccion = req_transferencia.str_id_transaccion;


                var res_tran = new TransferenciasDat(_serviceSettings).add_transf_interbancarias(req_transferencia);

                if (res_tran.codigo.Equals("000"))
                {
                    ConjuntoDatos ds_datos_respuesta = (ConjuntoDatos)res_tran.cuerpo;
                    ResTransferencia datos_validados = new ResTransferencia();
                    ResTransferencia datos_debito = new ResTransferencia();
                    foreach (var item in ds_datos_respuesta.lst_tablas[0].lst_filas)
                    {
                        datos_validados = (ResTransferencia)Converting.MapDictToObj(item.nombre_valor, typeof(ResTransferencia));

                    }
                    foreach (var item in ds_datos_respuesta.lst_tablas[1].lst_filas)
                    {
                        datos_debito = (ResTransferencia)Converting.MapDictToObj(item.nombre_valor, typeof(ResTransferencia));
                    }

                    datos_validados.int_num_referencia = datos_debito.int_num_referencia;
                    datos_validados.int_id_debito = datos_debito.int_id_debito;
                    datos_validados.int_id_comision = datos_debito.int_id_comision;
                    datos_validados.int_id_otra_comision = datos_debito.int_id_otra_comision;
                    datos_validados.int_estado = datos_debito.int_estado;
                    datos_validados.str_fecha_transac = datos_debito.str_fecha_transac;

                    respuesta = datos_validados;
                                      

                    if (datos_validados.int_enviar_banred == 1 && datos_validados.int_estado == 4) //Se debe tratar de enviar por banred
                    {
                        RespuestaTransaccion respuesta_pago_banred = new RespuestaTransaccion();

                        Cabecera cabecera = llenar_cabecera(req_transferencia);
                        
                        respuesta_pago_banred = ejecutar_pago_directo(datos_validados, cabecera);                      

                        //respuesta.cuerpo = datos_validados;
                        respuesta = datos_validados;
                    }
                    else
                    {
                        respuesta.str_res_estado_transaccion = res_tran.codigo.Equals("000") ? "OK" : "ERR";
                        respuesta.str_res_codigo = res_tran.codigo;
                        respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                        return respuesta;
                    }
                }
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals("000") ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }

        #endregion

        public ResGetTransferencias get_consulta_transferencias(ReqGetTransferencias req_get_tranferencias, string str_operacion)
        {
            var respuesta = new ResGetTransferencias();
            respuesta.LlenarResHeader(req_get_tranferencias);
            req_get_tranferencias.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqGetTransferencias>(req_get_tranferencias, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            respuesta.str_id_transaccion = req_get_tranferencias.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new TransferenciasDat(_serviceSettings).get_consulta_transferencias(req_get_tranferencias);

                respuesta.lst_tranferencias = Utils.Utils.ConvertConjuntoDatosToListClass<Transferencias>((ConjuntoDatos)res_tran.cuerpo);

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals("000")) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch (Exception exception)
            {
                ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }

            ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }

        #region Métodos pago directo

        public RespuestaTransaccion ProcesarSolicitud(SolicitudTransaccion sol_tran, string str_operacion)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            //JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();

            try
            {
                Transaccion req_transaccion = (Transaccion)JsonConvert.DeserializeObject(JsonConvert.SerializeObject(sol_tran.cuerpo), (typeof(Transaccion)));
                //Model.BV.DatosRecibidos datos_recibidos = (Model.BV.DatosRecibidos)jsonSerializer.Deserialize(sol_tran.cuerpo.ToString(), (typeof(Model.BV.DatosRecibidos)));
                switch (req_transaccion.str_tipo_tran)
                {
                    case "TRAH":
                    case "TRCO":
                    case "TRTC":
                        //case "VERI":
                        respuesta = pagar(sol_tran);
                        break;
                    default:
                        respuesta = validar(sol_tran);
                        break;
                }
            }
            catch (Exception exception)
            {
               throw;
            }
            return respuesta;
        }

        /// <summary>
        /// Validar los datos para la transferencia
        /// </summary>
        /// <param name="sol_tran"></param>
        /// <param name="str_operacion"></param>
        /// <returns></returns>
        public RespuestaTransaccion validar(SolicitudTransaccion sol_tran)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {                
                respuesta = conectar_banred(sol_tran);

            }
            catch (Exception exception)
            {               
                throw;
            }
            return respuesta;
        }

        /// <summary>
        /// Transferir
        /// </summary>
        /// <param name="sol_tran"></param>
        /// <param name="str_operacion"></param>
        /// <returns></returns>
        public RespuestaTransaccion pagar(SolicitudTransaccion sol_tran)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                Transaccion req_transaccion = (Transaccion)JsonConvert.DeserializeObject(JsonConvert.SerializeObject(sol_tran.cuerpo), (typeof(Transaccion)));

                respuesta = conectar_banred(sol_tran);
          
            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }


        public RespuestaTransaccion validaciones_pago_directo(ResTransferencia datos_validados, Cabecera cabecera)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                respuesta.cuerpo = datos_validados; //Se asigna nuevamente para que no se requiera deserealizarlo en un list TransferenciaDto

                Transaccion datos_para_validacion_banred = new Transaccion();

                //datos_para_validacion_banred.str_tipo_tran = "CON";
                //Revisar la obtención de este campo "int_secuencial"

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

                datos_para_validacion_banred.str_nom_receptor = "";
                datos_para_validacion_banred.str_observaciones = "";
                SolicitudTransaccion sol_tran = new SolicitudTransaccion();
                sol_tran.cuerpo = datos_para_validacion_banred;
                sol_tran.cabecera = cabecera;

                respuesta = ProcesarSolicitud(sol_tran, "");
               
            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }


        public RespuestaTransaccion conectar_banred(SolicitudTransaccion sol_tran)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                string url = _serviceSettings.servicio_banred; 
                string content_type = ApplicationContenTypes.JSON_UTF8;

                string str_usuario = _serviceSettings.user_ws_banred; 
                string str_contrasenia = _serviceSettings.pass_ws_banred; 

                RestClient rest_client = new RestClient(url, content_type, str_usuario, str_contrasenia);

                var obj = rest_client.post_string_content(sol_tran);
                respuesta = JsonConvert.DeserializeObject<RespuestaTransaccion>(obj.ToString());

            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }

        public Cabecera llenar_cabecera(ReqTransferencia obj)
        {
            Cabecera cabecera = new Cabecera();
            cabecera.int_sistema = Convert.ToInt32(obj.str_id_sistema);
            cabecera.str_usuario = obj.str_login;
            cabecera.int_perfil = Convert.ToInt32(obj.str_id_oficina);
            cabecera.int_oficina = Convert.ToInt32(obj.str_id_oficina);
            cabecera.str_nemonico_canal = obj.str_nemonico_canal;
            cabecera.str_ip = obj.str_ip_dispositivo;
            cabecera.str_session = obj.str_sesion;
            cabecera.str_mac = obj.str_ip_dispositivo;

            return cabecera;
        }

        public RespuestaTransaccion ejecutar_pago_directo(ResTransferencia datos_validados, Cabecera cabecera)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
               

                respuesta.cuerpo = datos_validados; //Se asigna nuevamente para que no se requiera deserealizarlo en un list TransferenciaDto

             
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
                //datos_para_validacion_banred.int_secuencial_cobis = 0;

                switch (datos_validados.str_tipo_cta_benef)
                {
                    case "3":   //Cuenta Corriente
                        datos_para_validacion_banred.str_tipo_cuenta_receptor = "04";
                        datos_para_validacion_banred.str_tipo_tran = "TRCO";
                        break;
                    case "4":   //Cuenta de Ahorros
                        datos_para_validacion_banred.str_tipo_cuenta_receptor = "05";
                        datos_para_validacion_banred.str_tipo_tran = "TRAH";
                        break;
                    case "83":   //Tarjeta de Crédito
                        datos_para_validacion_banred.str_tipo_cuenta_receptor = "02";
                        datos_para_validacion_banred.str_tipo_tran = "TRTC";
                        break;
                }

                datos_para_validacion_banred.str_nom_receptor = "";
                datos_para_validacion_banred.str_observaciones = "";
                SolicitudTransaccion sol_tran = new SolicitudTransaccion();
                sol_tran.cuerpo = datos_para_validacion_banred;
                sol_tran.cabecera = cabecera;
                               
                RespuestaTransaccion respuesta_banred = new RespuestaTransaccion();
                respuesta_banred = ProcesarSolicitud(sol_tran, "");              

            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }

        #endregion

        #region "Transferencias internas"
        public ResValTransferenciaInterna validar_transfer_interna(ReqValidacionTransferenciaDto req_validar_transferencia, string str_operacion)
        {
            var respuesta = new ResValTransferenciaInterna();
            respuesta.LlenarResHeader(req_validar_transferencia);
            req_validar_transferencia.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqValidacionTransferenciaDto>(req_validar_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            respuesta.str_id_transaccion = req_validar_transferencia.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new TransferenciasDat(_serviceSettings).validar_transfer_interna(req_validar_transferencia);

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals("000")) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch (Exception exception)
            {
                ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }

            ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }

        public ResAddTransferenciaInterna add_transfer_interna(ReqTransferencia req_add_transferencia, string str_operacion)
        {
            var respuesta = new ResAddTransferenciaInterna();
            respuesta.LlenarResHeader(req_add_transferencia);
            req_add_transferencia.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqTransferencia>(req_add_transferencia, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            respuesta.str_id_transaccion = req_add_transferencia.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new TransferenciasDat(_serviceSettings).add_transferencia_interna(req_add_transferencia);

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals("000")) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch (Exception exception)
            {
                ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }

            ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }

        #endregion

    }
}
