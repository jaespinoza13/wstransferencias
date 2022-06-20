
using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Beneficiarios.DeleteBeneficiario;

public class ReqDeleteBeneficiario : Header, IRequest<ResComun>
{
    public int int_id { get; set; }
    public string? str_motivo_elimina { get; set; }
}