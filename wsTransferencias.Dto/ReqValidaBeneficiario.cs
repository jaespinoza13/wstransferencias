
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqValidaBeneficiario : Header
    {

        public int int_ente_registra { get; set; }
        public string str_codigo_ifi { get; set; }
        public int int_tipo_producto { get; set; }
        public string str_numero_cuenta { get; set; }
        public string str_numero_documento { get; set; }
    }
}
