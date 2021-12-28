using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Dat;
using wsTransferencias.Log;
using wsTransferencias.Model;

namespace wsTransferencias.Neg.Utils
{
    public class ServiceLogs
    {
        private static InfoLog infoLog;
        static ServiceSettings serviceSettings;
        public ServiceLogs(ServiceSettings settings)
        {
            serviceSettings = settings;
            infoLog.str_webservice = "wsConsultas";
        }

        /// <summary>
        /// Guarda en mongodb la cabecera de la petición
        /// </summary>
        /// <param name="Transaccion"></param>
        /// <param name="str_operacion"></param>
        /// <param name="str_metodo"></param>
        /// <param name="str_clase"></param>
        /// <returns></returns>
        /// 
        public static string SaveHeaderLogs<T>(T transaction, String str_operacion, String str_metodo, String str_clase)
        {
            string str_id_transaccion = String.Empty;

            infoLog.str_clase = str_clase;
            infoLog.str_operacion = str_operacion;
            infoLog.str_objeto = transaction;
            infoLog.str_metodo = str_metodo;
            infoLog.str_fecha = DateTime.Now;

            RespuestaTransaccion res_tran_logs = new LogsMongoDat(serviceSettings).GuardarCabeceraMongo(transaction);
            str_id_transaccion = res_tran_logs.codigo.Equals("000") ? (String)res_tran_logs.cuerpo : Utils.GeneraCadenaAleatoria();
            infoLog.str_id_transaccion = str_id_transaccion;
            infoLog.str_tipo = "s:<";
            LogServicios.RegistrarTramas(infoLog.str_tipo, infoLog, serviceSettings.path_logs_consultas);

            return str_id_transaccion;
        }

        /// <summary>
        /// Guarda en mongodb la respuesta de la petición
        /// </summary>
        /// <param name="Transaccion"></param>
        /// <param name="str_operacion"></param>
        /// <param name="str_metodo"></param>
        /// <param name="str_clase"></param>
        /// <returns></returns>
        /// 
        public static void SaveResponseLogs(ResComun transaction, String str_operacion, String str_metodo, String str_clase)
        {
            infoLog.str_clase = str_clase;
            infoLog.str_operacion = str_operacion;
            infoLog.str_objeto = transaction;
            infoLog.str_metodo = str_metodo;
            infoLog.str_fecha = DateTime.Now;

            RespuestaTransaccion res_tran_logs = new LogsMongoDat(serviceSettings).GuardarRespuestaMongo(transaction);
            string str_id_transaccion = res_tran_logs.codigo.Equals("000") ? (String)res_tran_logs.cuerpo : Utils.GeneraCadenaAleatoria();
            infoLog.str_id_transaccion = str_id_transaccion;
            infoLog.str_tipo = "r:>";
            LogServicios.RegistrarTramas(infoLog.str_tipo, infoLog, serviceSettings.path_logs_consultas);
        }

        /// <summary>
        /// Guarda cualquier error 
        /// </summary>
        /// <param name="Transaccion"></param>
        /// <param name="str_operacion"></param>
        /// <param name="str_metodo"></param>
        /// <param name="str_clase"></param>
        /// <param name="obj_error"></param>
        /// <returns></returns>
        /// 
        public static void SaveExceptionLogs(ResComun transaction, String str_operacion, String str_metodo, String str_clase, Object obj_error)
        {
            string str_id_transaccion = String.Empty;

            infoLog.str_clase = str_clase;
            infoLog.str_operacion = str_operacion;
            infoLog.str_objeto = transaction;
            infoLog.str_metodo = str_metodo;
            infoLog.str_fecha = DateTime.Now;

            RespuestaTransaccion res_tran_logs = new LogsMongoDat(serviceSettings).GuardarExcepcionesMongo(transaction, obj_error);
            str_id_transaccion = res_tran_logs.codigo.Equals("000") ? (String)res_tran_logs.cuerpo : Utils.GeneraCadenaAleatoria();
            infoLog.str_id_transaccion = str_id_transaccion;
            infoLog.str_tipo = "e:<";
            LogServicios.RegistrarTramas(infoLog.str_tipo, infoLog, serviceSettings.path_logs_consultas);
        }
    }
}
