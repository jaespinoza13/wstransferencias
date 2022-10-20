using MediatR;
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios;
public class ReqGetBeneficiarios : Header, IRequest<ResGetBeneficiarios>
{
    public string? str_tipo_beneficiario { get; set; }
}