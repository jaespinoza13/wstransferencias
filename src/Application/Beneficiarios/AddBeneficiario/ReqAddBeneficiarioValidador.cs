
using Application.Common.Interfaces;
using FluentValidation;

namespace Application.Beneficiarios.AddBeneficiario;
public class ReqAddBeneficiarioValidador : AbstractValidator<ReqAddBeneficiario>
{

    public ReqAddBeneficiarioValidador(IParametersInMemory parametersInMemory)
    {

        RuleFor( x => x.str_nombres)
            .NotEmpty()
            .MaximumLength( Convert.ToInt32( parametersInMemory.FindParametro( "LIMITE_MAXIMO_CARACTERES" ).str_valor_ini ))
            .WithMessage( parametersInMemory.FindParametro( "LIMITE_MAXIMO_CARACTERES" ).str_descripcion );
    }
}
