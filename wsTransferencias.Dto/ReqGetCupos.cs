
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqGetCupos : Header
    {
        public int int_id_config_servicio { get; set; }
        public int int_ente { get; set; }
        public string str_num_acumula { get; set; }
    }
}
