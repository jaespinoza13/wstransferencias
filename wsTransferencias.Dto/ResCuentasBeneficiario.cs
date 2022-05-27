using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ResCuentasBeneficiario : ResComun
    {
        public List<CuentasBeneficiario> lst_cuentas_beneficiario { get; set; }

        public class CuentasBeneficiario
        {
            public int int_id { get; set; }
            public string str_num_cta { get; set; } = String.Empty;
            public string str_nombre_ifi { get; set; } = String.Empty;
            public string str_nombres { get; set; } = String.Empty; 
            public string str_num_documento { get; set; } = String.Empty;
            public string str_email { get; set; } = String.Empty;
            public string str_acronimo_producto {get; set; } = String.Empty;
            public string str_descripcion_tipo_producto { get; set; } = String.Empty;
            public decimal dec_monto { get; set; } 

        }
    }
}
