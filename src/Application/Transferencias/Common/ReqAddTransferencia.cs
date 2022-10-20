

using Application.Common.ISO20022.Models;

namespace Application.Transferencias.DTO
{
    public class ReqAddTransferencia : Header
    {
        public string? str_nemonico_tipo_transferencia { get; set; }
        public string? str_correo_beneficiario { get; set; }
        public string? str_otp { get; set; }
        public string? str_id_log { get; set; }
        public int int_solicitud { get; set; }
    }
}
