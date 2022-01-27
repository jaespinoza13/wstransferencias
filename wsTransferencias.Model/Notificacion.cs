

namespace wsTransferencias.Model
{
    public class Notificacion
    {
        public int int_id { get; set; }
        public int int_ente { get; set; }
        public string str_destinos { get; set; }
        public string str_num_documento { get; set; }
        public string str_nombre_servicio { get; set; }
        public string str_operacion { get; set; }
        public string str_nemonico_plantilla { get; set; }
        public string int_sistema { get; set; }
        public string int_tabla { get; set; }
        public string str_plantilla { get; set; }
        public string int_destino_jefe { get; set; }
        public string str_configuracion { get; set; }
        public string str_variables { get; set; }
        public string str_ids_documentos { get; set; }
        public List<string> lista_variables { get; set; }
        public List<string> lista_valores { get; set; }
        public List<string> lista_destinos { get; set; }
        public object dts_detalles { get; set; }
        public string str_error { get; set; }
        public int int_proveedor_servicio { get; set; }
    }
}
