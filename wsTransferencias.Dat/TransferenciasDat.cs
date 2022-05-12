using AccesoDatosGrpcAse.Neg;
using Grpc.Net.Client;
using System.Reflection;
using wsTransferencias.Dto;
using wsTransferencias.Model;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace wsTransferencias.Dat
{
    public class TransferenciasDat
    {
        private readonly SettingsApi _settings;
        private readonly DALClient objClienteDal;
        private readonly string str_clase;

        public TransferenciasDat ( SettingsApi serviceSettings )
        {
            _settings = serviceSettings;
            this.str_clase = GetType().FullName!;

            var httpHandler = new HttpClientHandler();
            var canal = GrpcChannel.ForAddress( serviceSettings.servicio_grpc_sybase, new GrpcChannelOptions { HttpHandler = httpHandler } );
            objClienteDal = new DALClient( canal );
        }

        public RespuestaTransaccion get_consulta_transferencias ( ReqGetTransferencias req_get_transferencias )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_get_transferencias );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta_ordenante", TipoDato = TipoDato.VarChar, ObjValue = req_get_transferencias.str_num_cta_ordenante.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dt_fecha_ini", TipoDato = TipoDato.VarChar, ObjValue = req_get_transferencias.str_fecha_inicio.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dt_fecha_fin", TipoDato = TipoDato.VarChar, ObjValue = req_get_transferencias.str_fecha_fin.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_filtro", TipoDato = TipoDato.VarChar, ObjValue = req_get_transferencias.str_filtro.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_filtro_nem_canal", TipoDato = TipoDato.VarChar, ObjValue = req_get_transferencias.str_filtro_nem_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ultimos_movimientos", TipoDato = TipoDato.Integer, ObjValue = req_get_transferencias.int_ultimos_movimientos.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_iteracion", TipoDato = TipoDato.Integer, ObjValue = req_get_transferencias.int_iteracion.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_num_registros", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_con_transferencias_v2";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var num_total_pag = lst_valores.Find( x => x.StrNameParameter == "@int_num_registros" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "int_num_registros", num_total_pag.ToString() );

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_get_transferencias, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( req_get_transferencias.str_id_transaccion )!;

            }
            return respuesta;
        }



        /// <summary>
        /// Validación de transferencia interna, previo a la ejecución
        /// </summary>
        /// <param name="str_nemonico_tipo_transferencia"></param>
        /// <param name="int_id_cuenta_origen"></param>
        /// <param name="int_id_cuenta_destino"></param>
        /// <param name="dcm_monto"></param>
        /// <param name="str_nemonico_canal"></param>
        /// <returns></returns>
        public RespuestaTransaccion validar_transfer_interna ( ReqValidacionTransferencia req_validar_transferencia )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_validar_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_trans", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_nemonico_tipo_transferencia.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_id_cta_ordenante.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_id_cta_beneficiario.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto", TipoDato = TipoDato.Decimal, ObjValue = req_validar_transferencia.dec_monto_tran.ToString() } );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = String.IsNullOrEmpty(req_validar_transferencia.str_observacion) ? "" : req_validar_transferencia.str_observacion } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_servicio", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_srv_transfer } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_categoria", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_categoria.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_log", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_id_log } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_referencia_trans", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_id_servicio } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "validar_transfer_interna_v3";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

                if(respuesta.codigo == "000")
                {
                    respuesta.diccionario.Add( "int_solicitud", lst_valores.Find( x => x.StrNameParameter == "@int_id_solicitud" )!.ObjValue.Trim() );
                }

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_validar_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( req_validar_transferencia.str_id_transaccion )!;

            }
            return respuesta;
        }

        /// <summary>
        /// Permite agregar una transferencia
        /// </summary>
        /// <param name="transferencia"></param>
        /// <returns></returns>
        public RespuestaTransaccion add_transferencia_interna ( ReqAddTransferencia req_add_transferencia_interna )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_add_transferencia_interna );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_correo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = req_add_transferencia_interna.str_correo_beneficiario.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer, ObjValue = req_add_transferencia_interna.int_id_solicitud.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer } );


                ds.NombreSP = "add_transferencia_interna_v3";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                
                if(respuesta.codigo == "000")
                {
                    respuesta.diccionario.Add( "int_id", lst_valores.Find( x => x.StrNameParameter == "@int_id" )!.ObjValue.Trim() );
                }

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_add_transferencia_interna, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( req_add_transferencia_interna.str_id_transaccion )!;

            }
            return respuesta;
        }

        /// <summary>
        /// Validaciónes previas para transferencias externas SPI
        /// </summary>
        /// <param name="dto">Objeto de solicitu de transacción para validaciones de transferencias exteranas</param>
        /// <param name="cabecera">Objeto para la cabecera de la solicitud de transacción</param>
        /// <returns></returns>
        public RespuestaTransaccion get_val_transf_interbancarias ( ReqValidacionTransferencia req_validar_transferencia )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_validar_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_id_cta_ordenante.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_id_cta_beneficiario.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto_transfer", TipoDato = TipoDato.Decimal, ObjValue = req_validar_transferencia.dec_monto_tran.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_observacion } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_enviar_banred", TipoDato = TipoDato.Integer } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_requiere_otp", TipoDato = TipoDato.Integer } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer } );


                ds.NombreSP = "get_val_transf_interbancarias3";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var str_enviar_banred = lst_valores.Find( x => x.StrNameParameter == "@o_enviar_banred" )!.ObjValue.Trim();
                var str_requiere_otp = lst_valores.Find( x => x.StrNameParameter == "@o_requiere_otp" )!.ObjValue.Trim();
                var int_id_solicitud = lst_valores.Find( x => x.StrNameParameter == "@int_id_solicitud" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "str_enviar_banred", str_enviar_banred.ToString() );
                respuesta.diccionario.Add( "str_requiere_otp", str_requiere_otp.ToString() );
                respuesta.diccionario.Add( "int_id_solicitud", int_id_solicitud );

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_validar_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( req_validar_transferencia.str_id_transaccion )!;
            }
            return respuesta;
        }

        /// <summary>
        /// Registra la transferencia externa spi
        /// </summary>
        /// <param name="transferencia">Objeto de solicitud de transacción para el registro de la transferencia</param>
        /// <param name="cabecera">Objeto de solicitud de transacción para la cabecera</param>
        /// <returns></returns>
        public RespuestaTransaccion add_transf_interbancarias ( ReqAddTransferencia req_transferencia )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_id_solicitud.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_correo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_correo_beneficiario } );

                ds.NombreSP = "add_transf_interbancarias3";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( req_transferencia.str_id_transaccion )!;

            }
            return respuesta;
        }


        public RespuestaTransaccion set_envio_transf_por_spi ( ReqTransferencia req_transferencia )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_comprobar_transfer", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_id_comprobar_transfer.ToString() } );

                ds.NombreSP = "set_envio_transf_por_spi2";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteNonQuery( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );


            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( req_transferencia.str_id_transaccion )!;
            }
            return respuesta;
        }

        /*
        public RespuestaTransaccion obtener_datos_req_pago_directo ( ReqTransferencia req_transferencia )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_sesion.ToString() } );

                //Variables requeridas             
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_cuenta_bce", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_sesion.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "set_envio_transf_por_spi2";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteNonQuery( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );

            }
            return respuesta;
        }*/


        /*
        public RespuestaTransaccion get_reimpresion_comprobante ( ReqTransferencia req_transferencia )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_num_referencia", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_num_referencia.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_ente.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_reimpresion_comprobante2";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteNonQuery( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );



            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );

            }
            return respuesta;
        }
        */
    }
}
