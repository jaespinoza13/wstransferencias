﻿
using Domain.Services.Alfresco;

namespace Domain.Entities
{
    public class CuentasBeneficiario
    {
        public string str_id { get; set; } = String.Empty;
        public string str_num_cta { get; set; } = String.Empty;
        public string str_nombre_ifi { get; set; } = String.Empty;
        public string str_nombres { get; set; } = String.Empty;
        public string str_num_documento { get; set; } = String.Empty;
        public string str_email { get; set; } = String.Empty;
        public string str_acronimo_producto { get; set; } = String.Empty;
        public string str_descripcion_tipo_producto { get; set; } = String.Empty;
        public decimal dec_monto { get; set; }
        public int int_favorito { get; set; }
        public string str_avatar { get; set; } = String.Empty;
        public string str_tipo_beneficiario { get; set; } = String.Empty;
        public string str_alias_cta { get; set; } = String.Empty;
    }
}
