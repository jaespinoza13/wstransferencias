
using Application.Common.Models;
using Application.Transferencias.Consulta;

namespace Application.Transferencias;
public interface IConsultaTransferencias
{
    Task<RespuestaTransaccion> ConsultaTransferencias(ReqConsultaTransferencias reqConsultaTransferencias);
}