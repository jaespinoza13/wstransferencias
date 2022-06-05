using Application.Common.Validations;
using Application.Transferencias.Externas.Validaciones;
using MediatR;
using System.Reflection;

namespace Microsoft.Extensions.DependencyInjection;

public static class ConfigureApplication
{
    public static IServiceCollection AddApplicationServices ( this IServiceCollection services )
    {
        services.AddTransient<IParametersToValidate, ParametersToValidate>();
        services.AddTransient<IValidacionesPagoDirecto, ValidacionesPagoDirecto>();
        services.AddMediatR( Assembly.GetExecutingAssembly() );

        return services;
    }
}