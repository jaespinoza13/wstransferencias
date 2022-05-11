﻿
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqUpdateBeneficiario : Header
    {

        public int int_id { get; set; }
        public string str_codigo_ifi { get; set; }
        public int int_tipo_producto { get; set; }
        public string str_num_cta { get; set; }
        public string str_num_documento { get; set; }
        public string str_nombres { get; set; }
        public string str_email { get; set; }
        public string str_alias_cta { get; set; }
        public string str_tipo_beneficiario { get; set; }
        public string str_otp { get; set; }


    }
}
