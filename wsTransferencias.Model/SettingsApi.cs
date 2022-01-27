
namespace wsTransferencias.Model
{
    public class SettingsApi
    {
        public string BD_megservicios { get; set; }
        public string BD_megonline { get; set; }
        

        public string servicio_grpc_sybase { get; set; }
        public string servicio_grpc_mongo { get; set; }
        public string servicio_ws_acceso { get; set; }
        public string servicio_ws_otp { get; set; }
        public string servicio_ws_banred { get; set; }
        public string servicio_ws_notificador { get; set; }

        public string pago_directo_offline { get; set; }

        public string path_logs_transferencias { get; set; }
        public string path_logs_amenazas { get; set; }

        public string auth_ws_transferencias { get; set; }
        public string auth_ws_acceso { get; set; }
        public string auth_ws_otp { get; set; }
        public string auth_ws_banred { get; set; }

        public string user_ws_banred { get; set; }
        public string pass_ws_banred { get; set; }

        public string codigo_error_datos_incorrectos_banred { get; set; }
        public string codigo_error_datos_incorrectos_coopmego { get; set; }
        public string msj_error_validacion { get; set; }


        public bool valida_peticiones_diarias { get; set; }

    }
}
