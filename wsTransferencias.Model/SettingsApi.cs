
namespace wsTransferencias.Model
{
    public class SettingsApi
    {
        #region BASES DE DATOS
        public string BD_megservicios { get; set; }
        public string BD_megonline { get; set; }
        #endregion

        #region ENDPOINTS
        public string servicio_grpc_sybase { get; set; }
        public string servicio_grpc_mongo { get; set; }
        public string servicio_ws_acceso { get; set; }
        public string servicio_ws_otp { get; set; }
        public string servicio_ws_banred { get; set; }
        public string servicio_ws_notificador { get; set; }
        #endregion




        #region PATH LOGS
        public string path_logs_transferencias { get; set; }
        public string path_logs_errores { get; set; }
        public string path_logs_errores_db { get; set; }
        public string path_logs_amenazas { get; set; }
        public string path_logs_errores_http { get; set; }
        #endregion

        #region AUTH SERVICIOS
        public string auth_ws_transferencias { get; set; }
        public string auth_ws_acceso { get; set; }
        public string auth_ws_otp { get; set; }
        public string auth_ws_banred { get; set; }
        #endregion

        #region CONFIGURACIONES
        public string codigo_error_datos_incorrectos_banred { get; set; }
        public string codigo_error_datos_incorrectos_coopmego { get; set; }
        public string msj_error_validacion { get; set; }
        public bool valida_peticiones_diarias { get; set; }
        public string pago_directo_pruebas { get; set; }
        #endregion

        #region CONFIGURACIONES HTTP
        public int timeOutHttp { get; set; }
        public int timeoutGrpcSybase { get; set; }
        public int delayOutGrpcSybase { get; set; }
        public int timeoutGrpcMongo { get; set; }
        public int delayOutGrpcMongo { get; set; }
        public List<string>? lst_canales_valida_token { get; set; }
        #endregion

        #region MONGO
        public string nombre_base_mongo { get; set; } = String.Empty;
        public string coll_errores_db { get; set; } = String.Empty;
        public string coll_peticiones { get; set; } = String.Empty;
        public string coll_respuesta { get; set; } = String.Empty;
        public string coll_errores { get; set; } = String.Empty;
        public string coll_amenazas { get; set; } = String.Empty;
        public string coll_peticiones_diarias { get; set; } = String.Empty;
        public string coll_promedio_peticiones_diarias { get; set; } = String.Empty;
        public string coll_errores_http { get; set; } = String.Empty;
        #endregion
    }
}
