using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqCuentasBeneficiario:Header
    {
       public int int_ente { get; set; }
       public string str_nemo_tipo_transferencia { get; set; } = String.Empty;

    }
}
