
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqDeleteBeneficiario : Header
    {

        public int int_ente_registra { get; set; }
        public int int_id { get; set; }
        public string str_motivo_elimina { get; set; }
    }
}
