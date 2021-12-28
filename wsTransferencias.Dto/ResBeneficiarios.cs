using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ResBeneficiarios : ResComun
    {      

        public object cuerpo { get; set; }
        public List<Beneficiario> lst_beneficiarios { get; set; }

    }

    public class Beneficiario 
    {
        public string str_operacion { get; set; }
        public int int_id { get; set; }
        public int int_ente_registra { get; set; }
        public string str_codigo_ifi { get; set; }
        public string str_nombre_ifi { get; set; }
        public int int_tipo_producto { get; set; }
        public string str_descripcion_tipo_producto { get; set; }
        public string str_num_cta { get; set; }
        public string str_num_documento { get; set; }
        public string str_nombres { get; set; }
        public string str_email { get; set; }
        public string str_alias_cta { get; set; }
        public int int_tipo_tarjeta_cred { get; set; }
        public string str_descrip_tipo_tarjeta_cred { get; set; }
        public string str_tipo_beneficiario { get; set; }
        public string str_motivo_elimina { get; set; }


        public Beneficiario()
        {
            
        }
    }
    
}


