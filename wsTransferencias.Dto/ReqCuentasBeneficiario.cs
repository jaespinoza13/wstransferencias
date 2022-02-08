using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqCuentasBeneficiario:Header
    {
       public int int_ente { get; set; }
       public string str_tipo_beneficiario { get; set; } = String.Empty;

    }
}
