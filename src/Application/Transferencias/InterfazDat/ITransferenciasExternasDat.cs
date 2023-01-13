

using Application.Common.Models;
using Application.Transferencias.DTO;

namespace Application.Transferencias.InterfazDat
{
    public interface ITransferenciasExternasDat
    {
        RespuestaTransaccion ValidaTransferenciaInterbancaria(ReqValidaTransferencia req_validar_transferencia);
        RespuestaTransaccion SetEnvioTransferenciaSPI(ReqTransferencia req_transferencia);
        RespuestaTransaccion AddTransferenciaInternbancaria(ReqAddTransferencia req_transferencia);
        RespuestaTransaccion ValidaOtpTransferenciaInternbancaria(ReqAddTransferencia req_transferencia);
    }
}
