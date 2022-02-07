using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ResValidaBeneficiarioCtasMego:ResComun
    {
        public List<Beneficiario> lst_beneficiario { get; set; }
        public bool bl_requiere_otp { get; set; }
    }
}
