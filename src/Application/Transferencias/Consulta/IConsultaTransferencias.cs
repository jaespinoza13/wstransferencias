
using Application.Common.Models;

namespace Application.Transferencias.Consulta;
public interface IConsultaTransferencias
{
    Task<RespuestaTransaccion> ConsultaTransferencias(ReqConsultaTransferencias reqConsultaTransferencias);
}