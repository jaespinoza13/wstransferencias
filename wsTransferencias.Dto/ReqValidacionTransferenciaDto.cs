using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqValidacionTransferenciaDto : Header
    {
        public string str_nemonico_tipo_transferencia { get; set; }
        public int int_id_cta_ordenante { get; set; }
        public int int_id_cta_beneficiario { get; set; }
        public decimal dec_monto_tran { get; set; }
        //public string str_nemonico_canal { get; set; }
        // public int int_sistema { get; set; }
        public int int_ente { get; set; }
    }
}
