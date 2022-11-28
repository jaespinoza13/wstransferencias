using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Transferencias.Comprobante
{
    public class ResComprobanteTransferencia : ResComun
    {
        public ArchivoComprobante objComprobante { get; set; } = new();
    }
}
