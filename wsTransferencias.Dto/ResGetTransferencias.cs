using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ResGetTransferencias : ResComun
    {
        public int int_num_paginas { get; set; }
        public List<Transferencias>? lst_tranferencias { get; set; }
    }

    public class Transferencias
    {
        public string int_num_referencia { get; set; } = String.Empty;
        public string str_fecha_transac { get; set; } = String.Empty;
        public string str_desc_tipo_cta_benef { get; set; } = String.Empty;
        public string str_nombre_ifi_benef { get; set; } = String.Empty;
        public string str_alias_cta_benef { get; set; } = String.Empty;
        public string str_desc_tip_tarj_cre_receptor { get; set; } = String.Empty;
        public string str_alias_tipo { get; set; } = String.Empty;
        public string str_nombre_benef { get; set; } = String.Empty;
        public string str_num_cta_benef { get; set; } = String.Empty;
        public string dec_monto_tran { get; set; } = String.Empty;
        public string str_observaciones { get; set; } = String.Empty;
        public string str_hora { get; set; } = String.Empty;
        public string str_canal { get; set; } = String.Empty;
    }

}
