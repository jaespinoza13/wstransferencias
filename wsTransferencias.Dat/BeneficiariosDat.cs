using AccesoDatosGrpcAse.Neg;
using Grpc.Net.Client;
using System.Reflection;
using wsTransferencias.Dto;
using wsTransferencias.Log;
using wsTransferencias.Model;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace wsTransferencias.Dat
{
    public class BeneficiariosDat
    {

        private InfoLog infoLog;
        private readonly SettingsApi _settings;
        private readonly DALClient objClienteDal;
        private readonly string str_ruta;
        private const string str_salida_error = "e:< ";

        public BeneficiariosDat ( SettingsApi serviceSettings )
        {
            _settings = serviceSettings;
            this.str_ruta = serviceSettings.path_logs_transferencias;

            infoLog.str_clase = GetType().FullName;
            infoLog.str_fecha = DateTime.Now;
            
            var canal = GrpcChannel.ForAddress( serviceSettings.servicio_grpc_sybase );
            objClienteDal = new DALClient( canal );
        }

        public RespuestaTransaccion add_cuentas_beneficiarios ( ReqAddBeneficiario obj_beneficiario )
        {
            var respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_ifi", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_codigo_ifi.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_producto", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_tipo_producto.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_numero_cuenta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_documento", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_numero_documento.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nombres", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nombres.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_email", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_email.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_alias_cta", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_alias_cta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_tipo_beneficiario.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_ente_registra.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "add_cuentas_beneficiarios2";
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

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }

        public RespuestaTransaccion update_cuentas_beneficiarios ( ReqUpdateBeneficiario obj_beneficiario )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_ifi", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_codigo_ifi.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_producto", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_tipo_producto.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_num_cta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_documento", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_num_documento.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nombres", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nombres.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_email", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_email.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_alias_cta", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_alias_cta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_tipo_beneficiario.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_ente_registra.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_id.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "update_cuentas_beneficiarios2";
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

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }


        public RespuestaTransaccion delete_cuentas_beneficiarios ( ReqDeleteBeneficiario obj_beneficiario )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_id.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_ente_registra.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_motivo_elimina", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_motivo_elimina.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "delete_cuentas_beneficiarios2";
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

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }



        public RespuestaTransaccion get_datos_beneficiarios ( ReqGetBeneficiario obj_beneficiario )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_ente_registra.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_datos_beneficiarios2";
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

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }

        public RespuestaTransaccion validar_registro_beneficiarios ( ReqValidaBeneficiario obj_beneficiario )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_ifi", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_codigo_ifi } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_producto", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_tipo_producto.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_numero_cuenta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_documento", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_numero_documento.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_ente_registra.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "validar_registro_beneficiario2";
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

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }


        public RespuestaTransaccion validar_benef_otras_ctas_mego ( ReqAddBeneficiario obj_beneficiario )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_numero_cuenta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.int_ente_registra.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_sistema", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_session", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_usuario", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "validar_benef_otras_ctas_mego";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }

        public RespuestaTransaccion get_ctas_beneficiario ( ReqCuentasBeneficiario obj_beneficiario )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.int_ente.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_transferencia", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_tipo_transferencia.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = obj_beneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = obj_beneficiario.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_ctas_beneficiario";
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

                infoLog.str_id_transaccion = obj_beneficiario.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = obj_beneficiario.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }


        public RespuestaTransaccion obtener_datos_pago_directo ( ReqValidaCuentaPagoDirecto req_valida_cuenta )
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.int_ente_registra.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_cuenta_origen", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_num_cuenta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_cuenta_destino", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_num_cuenta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_cod_ifi", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_num_cuenta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_cuenta", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_num_cuenta.ToString() } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = req_valida_cuenta.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = req_valida_cuenta.str_id_perfil.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = req_valida_cuenta.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_valida_cuenta.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "obtener_datos_pago_directo_v2";
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

                infoLog.str_id_transaccion = req_valida_cuenta.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = req_valida_cuenta.str_id_servicio;

                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }


    }
}
