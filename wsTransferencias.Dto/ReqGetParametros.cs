using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ReqGetParametros : Header
    {
        public string str_nombre { get; set; } = String.Empty;
    }
}
