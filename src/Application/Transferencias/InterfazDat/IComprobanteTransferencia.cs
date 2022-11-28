
using Application.Common.Models;
using Application.Transferencias.Comprobante;

namespace Application.Transferencias;
public interface IComprobanteTransferencia
{
    Task<RespuestaTransaccion> get_comprobante_transferencia(ReqComprobanteTransferencia reqComprobanteTransferencia);
}