using Application.Common.ISO20022.Models;

namespace Application.Transferencias.DTO
{
    public class ResAddTransferencia : ResComun
    {
        public AddTransferencia objAddTransferencia { get; set; } = new();
        public class AddTransferencia
        {
            public string? str_num_doc_ordenante { get; set; }
            public string? str_nombre_ordenante { get; set; }
            public string? str_num_cta_ordenante { get; set; }
            public string? str_nombre_ifi_benef { get; set; }
            public string? str_nombre_ifi_ord { get; set; }
            public string? str_nombre_benef { get; set; }
            public string? str_num_doc_benef { get; set; }
            public string? str_num_cta_benef { get; set; }
            public string? str_correo_benef { get; set; }
            public decimal dec_monto_tran { get; set; }
            public decimal dec_comision { get; set; }
            public int int_num_referencia { get; set; }
            public string? str_fecha_transac { get; set; }
            public string? str_observacion { get; set; }
            public int int_enviar_banred { get; set; }
            public int int_id_transaccion { get; set; }

        }
    }
}
