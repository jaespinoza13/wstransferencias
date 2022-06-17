using MediatR;
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios.GetBeneficiarios;
public class ReqGetBeneficiarios : Header, IRequest<ResGetBeneficiarios>
{
    public string? str_tipo_beneficiario { get; set; }
}