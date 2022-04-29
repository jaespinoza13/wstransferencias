using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqValidacionTransferencia : Header
    {
        public string str_nemonico_tipo_transferencia { get; set; }
        public int int_id_cta_ordenante { get; set; }
        public int int_id_cta_beneficiario { get; set; }
        public decimal dec_monto_tran { get; set; }
        public int int_ente { get; set; }
        public string str_observacion { get; set; } = string.Empty;
        public int int_categoria { get; set; } = 0;
        public string str_srv_transfer { get; set; } = string.Empty;
        public string str_id_log { get; set; } = string.Empty;
    }
}
