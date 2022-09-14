using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Transferencias.DTO
{
    public class ResValidaTransferencia : ResComun
    {
        public ValidacionTransferencia objValidacionTransferencia { get; set; } = new();
        public Boolean bl_requiere_otp { get; set; }
        public int int_solicitud { get; set; }
    }
}
