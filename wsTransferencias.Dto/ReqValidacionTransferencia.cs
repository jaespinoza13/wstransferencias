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
    }
}
