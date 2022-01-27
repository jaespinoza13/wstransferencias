
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ResValidacionTransferencias : ResComun
    {
        public ValidacionTransferencia objValidacionTransferencia { get; set; }
        public Boolean bl_requiere_otp { get; set; }
        
        public class ValidacionTransferencia
        {
            public int int_id_cta_beneficiario { get; set; }
            public int int_tipo_benef { get; set; }
            public int int_tipo_tarj_cred_benef { get; set; }
            public string str_nombre_ifi_benef { get; set; }
            public string str_cta_bce_ifi_benef { get; set; }
            public string str_tipo_cta_benef { get; set; }
            public string str_desc_tipo_cta_benef { get; set; }
            public string str_num_cta_benef { get; set; }
            public string str_desc_tip_tarj_cre_benef { get; set; }
            public string str_alias_cta_benef { get; set; }
            public string str_nombre_benef { get; set; }
            public string str_num_doc_benef { get; set; }
            public string str_correo_benef { get; set; }
            public decimal dec_monto_tran { get; set; }
            public decimal dec_comision { get; set; }
            public int int_id_comprobar_transfer { get; set; }
            public int int_enviar_banred { get; set; }

        }
        
    }
   
}


