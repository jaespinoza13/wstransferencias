

using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Beneficiarios.GetCuentasBeneficiario;

public class ResGetCuentasBeneficiario : ResComun
{
    public List<CuentasBeneficiario> lst_cuentas_beneficiario { get; set; } = new();
}
