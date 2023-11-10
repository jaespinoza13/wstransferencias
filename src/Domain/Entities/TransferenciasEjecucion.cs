

namespace Domain.Entities
{
    public class TransferenciasEjecucion
    {

        public int int_id { get; set; }

        public string dcm_valor { get; set; } = String.Empty;
        public string int_id_programacion { get; set; } = String.Empty;
        public string str_ente { get; set; } = String.Empty;
        public string str_id_cuenta_origen { get; set; } = String.Empty;
        public string str_tipo_transferencia { get; set; } = String.Empty;
        public string str_id_beneficiario { get; set; } = String.Empty;
        public string str_observaciones { get; set; } = String.Empty;
        public string str_nemonico_canal_pt { get; set; } = String.Empty;
        public string str_usuario_canal_pt { get; set; } = String.Empty;

    }
}
