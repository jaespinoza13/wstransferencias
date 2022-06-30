

using Application.Common.ISO20022.Models;

namespace Application.Transferencias.Consulta
{
    public class ResConsultaTransferencias : ResComun
    {
        public int int_numero_registros { get; set; }
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
        public string str_descripcion_tipo_transf { get; set; } = String.Empty;
        public string str_tipo_movimiento { get; set; } = String.Empty;
        public string str_documento_ordenante { get; set; } = String.Empty;
        public decimal dec_comision { get; set; } = Decimal.Zero;
    }

}
