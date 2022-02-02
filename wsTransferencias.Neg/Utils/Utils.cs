using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Model;

namespace wsTransferencias.Neg.Utils
{
    public static class Utils
    {

        #region Métodos "Conversión de Conjunto de Datos a un objeto/Lista de una Clase"
        /// <summary>
        /// Convierte un Conjunto de datos a una lista de una Clase específica
        /// </summary>
        /// <param name="int_longitud"></param>
        /// <returns></returns>
        public static List<T> ConvertConjuntoDatosToListClass<T> ( ConjuntoDatos cuerpo )
        {
            List<T> lst_array = new List<T>();

            ConjuntoDatos conjuntoDatos = cuerpo;

            foreach(var item in conjuntoDatos.lst_tablas[0].lst_filas)
            {
                T obj = (T) Converting.MapDictToObj( item.nombre_valor, typeof( T ) );
                lst_array.Add( obj );
            }

            return lst_array;
        }


        /// <summary>
        /// Convierte un Conjunto de datos a un objeto de una Clase específica
        /// </summary>
        /// <param name="int_longitud"></param>
        /// <returns></returns>
        public static T? ConvertConjuntoDatosToClass<T> ( ConjuntoDatos cuerpo )
        {
            ConjuntoDatos conjuntoDatos = cuerpo;
            T? obj = default( T );
            foreach(var item in conjuntoDatos.lst_tablas[0].lst_filas)
            {
                obj = (T) Converting.MapDictToObj( item.nombre_valor, typeof( T ) );
            }

            return obj;
        }
        #endregion

        #region Método "Generar número aleatorio"
        /// <summary>
        /// Genera un número aleatorio en string
        /// </summary>
        /// <returns></returns>
        internal static string GeneraCadenaAleatoria ()
        {
            Random random = new Random();
            const string characters = "0123456789";
            return new string( Enumerable.Repeat( characters, 20 )
              .Select( s => s[random.Next( s.Length )] ).ToArray() );
        }
        #endregion

        #region Método "Validar Token de Acceso"
        /// <summary>
        /// Valida token de acceso
        /// </summary>
        /// <returns></returns>
        public async static Task<ResComun> ValidarToken ( SettingsApi settings, string str_data )
        {
            string parametros = "api/wsAcceso?str_operacion=VALIDAR_TOKEN";
            var service = new ServiceHttp<ResComun>();
            ResComun respuesta = await service.PostRestServiceDataAsync( str_data, settings.servicio_ws_acceso, parametros, settings.auth_ws_acceso );
            return respuesta;

        }
        #endregion

        #region "Control de peticiones diarias"
        public static bool control_peticion_diaria ( string str_operacion, SettingsApi serviceSettings, ResComun respuestaLog )
        {

            bool respuesta = true;

            string str_fecha_diaria = DateTime.Now.ToString( "yyyy-MM-dd" );
            string str_filtro = "{'str_fecha_solicitud':'" + str_fecha_diaria + "','str_operacion':'" + str_operacion + "'}";

            try
            {
                RespuestaTransaccion var_respuesta = new LogsMongoDat( serviceSettings! ).buscar_peticiones_diarias( str_filtro );
                int int_act_peticiones = 1;
                if(var_respuesta.codigo == "000")
                {
                    var resp_mongo = var_respuesta.cuerpo;
                    if(resp_mongo != null && resp_mongo.ToString() != "[]")
                    {
                        var res_datos_mongo = var_respuesta.cuerpo.ToString()!.Replace( "ObjectId(", " " ).Replace( ")", " " );
                        res_datos_mongo = res_datos_mongo.Replace( "[", "" ).Replace( "]", "" );
                        PeticionDiaria peticion_diaria = JsonSerializer.Deserialize<PeticionDiaria>( res_datos_mongo )!;
                        if(peticion_diaria!._id != null)
                        {
                            int_act_peticiones = peticion_diaria.int_num_peticion + 1;

                            int respuesta_promedio = new LogsMongoDat( serviceSettings! ).obtener_promedio( str_operacion );
                            var cantidad_maxima = respuesta_promedio * Convert.ToInt32( LoadConfigService.FindParametro( "PRM_MAXIMO_PETICIONES_DIARIAS" )!.str_valor_ini ) / 100;

                            if(serviceSettings.valida_peticiones_diarias && int_act_peticiones > cantidad_maxima)
                                respuesta = false;

                        }
                    }
                    else
                    {
                        new LogsMongoDat( serviceSettings! ).guardar_promedio_peticion_diaria( str_operacion, str_fecha_diaria );
                    }

                    string str_act_registro = "{$set:{'int_num_peticion':" + int_act_peticiones + ", 'str_fecha_solicitud' : '" + str_fecha_diaria + "',str_operacion:'" + str_operacion + "'}}";
                    var_respuesta = new LogsMongoDat( serviceSettings! ).actualizar_peticion_diaria( str_filtro, str_act_registro );


                }
            }
            catch(Exception exception)
            {
                ServiceLogs.SaveExceptionLogs( respuestaLog, str_operacion, MethodBase.GetCurrentMethod()!.Name, "Utils", exception );

                respuesta = true;

            }
            return respuesta;
        }
        #endregion

        #region Método "Llena cabecera"
        /// <summary>
        /// Llena header para realizar peticiones a otro servicio
        /// </summary>
        /// <returns></returns>

        public static Cabecera llenar_cabecera ( Header header )
        {
            Cabecera cabecera = new Cabecera();
            cabecera.int_sistema = Convert.ToInt32( header.str_id_sistema );
            cabecera.str_usuario = header.str_login;
            cabecera.int_perfil = Convert.ToInt32( header.str_id_oficina );
            cabecera.int_oficina = Convert.ToInt32( header.str_id_oficina );
            cabecera.str_nemonico_canal = header.str_nemonico_canal;
            cabecera.str_ip = header.str_ip_dispositivo;
            cabecera.str_session = header.str_sesion;
            cabecera.str_mac = header.str_ip_dispositivo;

            return cabecera;
        }
        #endregion

        #region Método "Validar requiere OTP"
        /// <summary>
        /// Valida si la operacion requiere OTP
        /// </summary>
        /// <returns></returns>
        public async static Task<RespuestaTransaccion> ValidaRequiereOtp ( SettingsApi settings, Header header, string str_operacion )
        {

            var parametros = "api/WsOTP?str_operacion=VALIDA_REQUIERE_OTP";
            var service = new ServiceHttp<RespuestaTransaccion>();

            var cabecera = new
            {

                int_id_sistema = Convert.ToInt32( header.str_id_sistema ),
                int_id_usuario = Convert.ToInt32( header.str_id_usuario ),
                str_usuario = header.str_login,
                int_id_perfil = header.str_id_perfil,
                int_id_oficina = header.str_id_oficina,
                str_nombre_canal = header.str_app,
                str_nemonico_canal = header.str_nemonico_canal,
                str_ip = header.str_ip_dispositivo,
                str_session = header.str_sesion,
                str_mac = header.str_mac_dispositivo
            };

            var cuerpo = new
            {
                str_operacion = str_operacion,
            };

            var raw = new
            {
                cabecera = cabecera,
                cuerpo = cuerpo
            };

            string str_data = JsonSerializer.Serialize( raw );
            RespuestaTransaccion respuesta = await service.PostRestServiceDataAsync( str_data, settings.servicio_ws_otp, parametros, settings.auth_ws_otp );

            return respuesta;

        }
        #endregion


        public async static Task<RespuestaTransaccion> ValidaOtp ( SettingsApi settings, Header header, string str_operacion )
        {

            var parametros = "api/WsOTP?str_operacion=VALIDA_OTP";
            var service = new ServiceHttp<RespuestaTransaccion>();

            var cabecera = new
            {

                int_id_sistema = Convert.ToInt32( header.str_id_sistema ),
                int_id_usuario = Convert.ToInt32( header.str_id_usuario ),
                str_usuario = header.str_login,
                int_id_perfil = header.str_id_perfil,
                int_id_oficina = header.str_id_oficina,
                str_nombre_canal = header.str_app,
                str_nemonico_canal = header.str_nemonico_canal,
                str_ip = header.str_ip_dispositivo,
                str_session = header.str_sesion,
                str_mac = header.str_mac_dispositivo
            };

            var cuerpo = new
            {
                str_operacion = str_operacion,
            };

            var raw = new
            {
                cabecera = cabecera,
                cuerpo = cuerpo
            };

            string str_data = JsonSerializer.Serialize( raw );
            RespuestaTransaccion respuesta = await service.PostRestServiceDataAsync( str_data, settings.servicio_ws_otp, parametros, settings.auth_ws_otp );

            return respuesta;

        }

    }
}
