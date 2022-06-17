
using Application.Common.Models;
using Application.Transferencias.DTO;

namespace Application.Transferencias.InterfazDat
{
    public interface ITransferenciasInternasDat
    {
        RespuestaTransaccion ValidaTransferenciaInterna(ReqValidaTransferencia req_validar_transferencia);
        RespuestaTransaccion AddTransferenciaInterna(ReqAddTransferencia req_add_transferencia_interna);
    }
}
