
namespace Domain.Entities
{
    public class DatosComprobante
    {
        public string? int_tipo_transaccion { get; set; }
        public string? str_nombre_ordenante { get; set; }
        public string? str_documento_ordenante { get; set; }
        public string? str_num_cta_ordenante { get; set; }
        public string? str_nombre_beneficiario { get; set; }
        public string? str_documento_beneficiario { get; set; }
        public string? str_num_cta_beneficiario { get; set; }
        public string? dt_fecha { get; set; }
        public string? dt_hora { get; set; }
        public decimal dec_monto { get; set; }
        public decimal dec_comision { get; set; }
        public string? str_concepto { get; set; }
        public string? str_observacion { get; set; }
        public string? str_canal { get; set; }
        public string? str_tipo_movimiento { get; set; }
        public string? str_descripcion_tipo_transf { get; set; }
        public int int_referencia { get; set; }
        public string? str_nemonico_servicio { get; set; }
        public string? str_ifi_beneficiario { get; set; }

    }
}
