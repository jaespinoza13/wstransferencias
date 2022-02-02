using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqGetParametros : Header
    {
        public string str_nombre { get; set; } = String.Empty;
        public string str_nemonico { get; set; } = "-1";
        public int int_front { get; set; }
    }
}
