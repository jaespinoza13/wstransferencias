﻿

namespace wsTransferencias.Model
{
    public class Beneficiario
    {
        public int int_id { get; set; }
        public int int_ente_registra { get; set; }
        public string str_num_documento { get; set; }
        public string str_nombres { get; set; }
        public string str_email { get; set; }
        public int int_tipo_producto { get; set; }
        public string str_descripcion_tipo_producto { get; set; }
        public string str_num_cta { get; set; }
        public string str_codigo_ifi { get; set; }
        public string str_nombre_ifi { get; set; }
        public string str_tipo_beneficiario { get; set; }
        public string str_alias_cta { get; set; }
        public int int_tipo_tarjeta_cred { get; set; }
        public string str_descrip_tipo_tarjeta_cred { get; set; }
    }
}
