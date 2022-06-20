
using MediatR;
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios.GetCuentasBeneficiario;

public class ReqGetCuentasBeneficiario : Header, IRequest<ResGetCuentasBeneficiario>
{
    public string str_tipo_beneficiario { get; set; } = String.Empty;
}