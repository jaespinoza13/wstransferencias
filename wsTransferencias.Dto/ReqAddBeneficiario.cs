
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqAddBeneficiario : Header
    {
        public int int_ente { get; set; }
        public string str_codigo_ifi { get; set; }
        public int int_tipo_producto { get; set; }
        public string str_numero_cuenta { get; set; }
        public string str_numero_documento { get; set; }
        public string str_nombres { get; set; }
        public string str_email { get; set; }
        public string str_alias_cta { get; set; }
        public string str_tipo_beneficiario { get; set; }
        public string str_otp { get; set; }
    }
}
