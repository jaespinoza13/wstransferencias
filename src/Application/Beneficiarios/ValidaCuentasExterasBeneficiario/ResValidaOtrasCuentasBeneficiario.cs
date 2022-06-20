
using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Beneficiarios.ValidaCuentasExterasBeneficiario;
public class ResValidaOtrasCuentasBeneficiario : ResComun
{
    public List<Beneficiario> lst_beneficiario { get; set; } = new();
    public bool bl_requiere_otp { get; set; }
}