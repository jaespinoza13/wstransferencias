
using Domain.Entities;
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios.GetBeneficiarios;

public class ResGetBeneficiarios : ResComun
{
    public List<Beneficiario>? lst_beneficiarios { get; set; }
}

