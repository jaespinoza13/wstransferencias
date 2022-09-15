using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios;

public class ResValidaUpdateBeneficiario : ResComun
{
    public Boolean bl_requiere_otp { get; set; }
}
