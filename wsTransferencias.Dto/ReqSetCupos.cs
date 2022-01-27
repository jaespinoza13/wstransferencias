
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqSetCupos : Header
    {
        public int int_id_config_servicio { get; set; }
        public int int_id_cupo { get; set; }
        public int int_ente { get; set; }
        public string str_num_acumula { get; set; }
        public decimal dcm_monto { get; set; }
        public int int_frecuencia { get; set; }
    }
}
