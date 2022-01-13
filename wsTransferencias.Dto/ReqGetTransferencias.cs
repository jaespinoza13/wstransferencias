﻿using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqGetTransferencias : Header
    {
        public string str_num_cta_ordenante { get; set; } = String.Empty;
        public string str_fecha_inicio { get; set; } = String.Empty;
        public string str_fecha_fin { get; set; } = String.Empty;
        public string str_tipo_cta_benef { get; set; } = String.Empty;
        public string str_filtro { get; set; } = String.Empty;
    }
}
