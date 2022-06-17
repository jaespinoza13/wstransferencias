
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios.ValidaRegistroBeneficiario;

public class ResValidaRegistroBeneficiario : ResComun
{
    public Boolean bl_requiere_otp { get; set; }
}