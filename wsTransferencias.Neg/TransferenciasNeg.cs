using Newtonsoft.Json;
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

        public ResTransferencia validar_transferencia(ReqValidacionTransferenciaDto req_validar_transferencia, string str_operacion)
        {
            var respuesta = new ResTransferencia();
            try
            {

                var res_tran = new RespuestaTransaccion();

                switch (req_validar_transferencia.str_nemonico_tipo_transferencia)
                {
                    case "TRN_MIS_CUENTAS_COOPMEGO":
                    case "TRN_OTRAS_CUENTAS_COOPMEGO":
                        //respuesta = validar_transfer_interna(sol_tran);
                        break;

                    case "TRN_EXTERNAS":
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

        public ResTransferencia add_transferencia(ReqTransferencia req_transferencia, string str_operacion)
        {
            //RespuestaTransaccion respuesta = null;
            ResTransferencia respuesta = new ResTransferencia();
            try
            {             

                switch (req_transferencia.str_nemonico_tipo_transferencia)
                {
                    case "TRN_MIS_CUENTAS_COOPMEGO":
                    case "TRN_OTRAS_CUENTAS_COOPMEGO":
                        //respuesta = validar_transfer_interna(sol_tran);
                        break;

                    case "TRN_EXTERNAS":
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
                        //LogServicios.RegistrarTramas("s: validaciones_pago_directo >", sol_tran, ruta_log);
                        respuesta_validaciones_pago_directo = validaciones_pago_directo(respuesta, cabecera);
                        //LogServicios.RegistrarTramas("r:validaciones_pago_directo < ", respuesta_validaciones_pago_directo, ruta_log);

                        if (respuesta_validaciones_pago_directo.codigo == "0000" || respuesta_validaciones_pago_directo.codigo == "000")
                        {
                            return respuesta;
                        }
                        else
                        {
                            RespuestaTransaccion respuesta_cambio_tipo_transfer = new RespuestaTransaccion();
                            //Se actualiza el registro para que la transacción se enviada por SPI
                            //LogServicios.RegistrarTramas("s: set_envio_transf_por_spi >", sol_tran, ruta_log);
                            respuesta_cambio_tipo_transfer = new TransferenciasDat(_serviceSettings).set_envio_transf_por_spi(obj_transferencia);
                            //LogServicios.RegistrarTramas("r:set_envio_transf_por_spi < ", respuesta_cambio_tipo_transfer, ruta_log);

                            if (respuesta_cambio_tipo_transfer.codigo == "000")
                            {
                                //Se actualiza el campo in_enviar_banred para estblecer que la transf. será enviada por SPI.
                                //datos_validados.int_enviar_banred = 0;
                                // respuesta.cuerpo = datos_validados;
                                respuesta.int_enviar_banred = 0;
                            }

                            if (respuesta_validaciones_pago_directo.codigo == _serviceSettings.codigo_error_datos_incorrectos_banred)//ConfigurationManager.AppSettings.Get("codigo_error_datos_incorrectos_banred"))
                            {
                                //RespuestaTransaccion respuesta_error_validacion = new RespuestaTransaccion();

                                //respuesta_error_validacion.codigo = ConfigurationManager.AppSettings.Get("codigo_error_datos_incorrectos_coopmego");
                                //respuesta_error_validacion.diccionario.Add("ERROR", ConfigurationManager.AppSettings.Get("msj_error_validacion"));
                                //return respuesta_error_validacion;

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
                    //Mapear los datos obtenidos a una clase
                    //DataSet ds_datos_respuesta = (DataSet)respuesta.cuerpo;

                    ////Datos de la cuenta
                    //DataTable dt_datos_validados = ds_datos_respuesta.Tables[0];
                    //List<TransferenciaDto> list_datos_validados = new Mapper<TransferenciaDto>().Map(dt_datos_validados);
                    //TransferenciaDto datos_validados = list_datos_validados.First();

                    ////Datos del débito
                    //DataTable dt_datos_debito = ds_datos_respuesta.Tables[1];
                    //List<TransferenciaDto> list_datos_debito = new Mapper<TransferenciaDto>().Map(dt_datos_debito);
                    //TransferenciaDto datos_debito = list_datos_debito.First();

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

                    //int int_enviar_banred = Convert.ToInt32(respuesta.diccionario["str_enviar_banred"]);

                    if (datos_validados.int_enviar_banred == 1 && datos_validados.int_estado == 4) //Se debe tratar de enviar por banred
                    {
                        RespuestaTransaccion respuesta_pago_banred = new RespuestaTransaccion();

                        Cabecera cabecera = llenar_cabecera(req_transferencia);

                        // LogServicios.RegistrarTramas("s: ejecutar_pago_directo >", sol_tran, ruta_log);
                        respuesta_pago_banred = ejecutar_pago_directo(datos_validados, cabecera);
                        // LogServicios.RegistrarTramas("r:ejecutar_pago_directo < ", respuesta_pago_banred, ruta_log);


                        //respuesta.cuerpo = datos_validados;
                        respuesta = datos_validados;
                    }
                    else
                    {
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

                //Enviar a validar con Banred
                //LogServicios.RegistrarTramas("s:> Envio_banred_validar: ", sol_tran, ruta_log);
                //RespuestaTransaccion respuesta_banred = new RespuestaTransaccion();
                respuesta = ProcesarSolicitud(sol_tran, "");
                //LogServicios.RegistrarTramas("r:< Envio_banred_validar: ", respuesta, ruta_log);

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

                string url = _serviceSettings.servicio_banred; //ConfigurationManager.AppSettings["ws_servicio_banred"];
                string content_type = ApplicationContenTypes.JSON_UTF8;

                string str_usuario = _serviceSettings.user_ws_banred; //ConfigurationManager.AppSettings["usuario_servicio_banred"];
                string str_contrasenia = _serviceSettings.pass_ws_banred; //ConfigurationManager.AppSettings["clave_servicio_banred"];

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
                /* 
                LogServicios.RegistrarTramas("s:> validaciones_pago_directo: ", sol_tran, ruta_log);
                TransferenciaDto datos_transferencia = (TransferenciaDto)JsonConvert.DeserializeObject(JsonConvert.SerializeObject(sol_tran.cuerpo), (typeof(TransferenciaDto)));

                PagoDirectoDat pago_dat = new PagoDirectoDat();
                respuesta = pago_dat.validaciones_pago_directo(datos_transferencia, sol_tran.cabecera);
                LogServicios.RegistrarTramas("r:< validaciones_pago_directo: ", respuesta, ruta_log);
                */

                respuesta.cuerpo = datos_validados; //Se asigna nuevamente para que no se requiera deserealizarlo en un list TransferenciaDto

                //  Transaccion datos_para_validacion_banred = new Transaccion();

                //datos_para_validacion_banred.str_tipo_tran = "CON";
                //Revisar la obtención de este campo "int_secuencial"

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

                //Enviar a validar con Banred
               // LogServicios.RegistrarTramas("s:> Envio_banred_validar: ", sol_tran, ruta_log);
                RespuestaTransaccion respuesta_banred = new RespuestaTransaccion();
                respuesta_banred = ProcesarSolicitud(sol_tran, "");
               // LogServicios.RegistrarTramas("r:< Envio_banred_validar: ", respuesta_banred, ruta_log);

            }
            catch (Exception exception)
            {
                throw;
            }
            return respuesta;
        }

        #endregion
    }
}
