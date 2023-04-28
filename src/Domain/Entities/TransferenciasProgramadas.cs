

namespace Domain.Entities
{
    public class TransferenciasProgramadas
    {
       
        public int int_id { get; set; }
        public string str_nem_tipo_transf { get; set; } = String.Empty;
        public string str_id_cta_ordenante  { get; set; } = String.Empty;
        public string str_num_cta_ord  { get; set; } = String.Empty;
        public string str_nombre_ord  { get; set; } = String.Empty;
        public string str_alias_ord  { get; set; } = String.Empty; 
        public string str_id_cta_beneficiario  { get; set; } = String.Empty;
        public string str_nombre_ben  { get; set; } = String.Empty; 
        public string str_num_cta_ben  { get; set; } = String.Empty; 
        public string str_nombre_ifi { get; set; } = String.Empty; 
        public string str_acronimo_producto  { get; set; } = String.Empty;
        public string str_fecha_inicio  { get; set; } = String.Empty;
        public string str_fecha_fin  { get; set; } = String.Empty;
        public string int_dia_transf  { get; set; } = String.Empty;
        public string dec_monto_tran  { get; set; } = String.Empty; 
        public string str_observacion { get; set; } = String.Empty;
        public string str_avatar { get; set; } = String.Empty;
        public string str_correo { get; set; } = String.Empty;
        public string str_descripcion_tipo_producto { get; set; } = String.Empty;
    }
}
