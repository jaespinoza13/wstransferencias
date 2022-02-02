
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqValidaCuentaPagoDirecto : Header
    {
        public int int_ente { get; set; }
        public string str_cod_ifi { get; set; }
        public int int_tipo_cuenta { get; set; }
        public string str_identificacion { get; set; }
        public string str_nombre { get; set; }
        public int int_tipo_tarjeta { get; set; }
        public string str_alias_tarjeta { get; set; }
        public string str_email { get; set; }
        public string str_num_cuenta { get; set; }
        public string str_ref_transaccion { get; set; }
        public string str_tipo_beneficiario { get; set; }

    }
}
