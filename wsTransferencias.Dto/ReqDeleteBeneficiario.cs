
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqDeleteBeneficiario : Header
    {

        public int int_ente { get; set; }
        public int int_id { get; set; }
        public string str_motivo_elimina { get; set; }
    }
}
