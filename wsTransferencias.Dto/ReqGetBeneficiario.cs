
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqGetBeneficiario : Header
    {
        public int int_ente { get; set; }
        public string str_tipo_beneficiario { get; set; }
    }
}
