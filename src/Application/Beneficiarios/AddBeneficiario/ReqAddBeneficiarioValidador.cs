
using Application.Common.Interfaces;
using FluentValidation;

namespace Application.Beneficiarios.AddBeneficiario;
public class ReqAddBeneficiarioValidador : AbstractValidator<ReqAddBeneficiario>
{

    public ReqAddBeneficiarioValidador(IParametersInMemory parametersInMemory)
    {

        RuleFor( x => x.str_nombres)
            .NotEmpty()
            .MaximumLength( Convert.ToInt32( parametersInMemory.FindParameter( "LIMITE_MAXIMO_CARACTERES" ).str_valor_ini ))
            .WithMessage( parametersInMemory.FindParameter( "LIMITE_MAXIMO_CARACTERES" ).str_descripcion );
    }
}
