using Application.Common.Validations;
using Application.Transferencias.Externas.Validaciones;
using MediatR;
using System.Reflection;
using FluentValidation;

namespace Microsoft.Extensions.DependencyInjection;

public static class ConfigureApplication
{
    public static IServiceCollection AddApplicationServices(this IServiceCollection services)
    {
        services.AddTransient<IValidacionesPagoDirecto, ValidacionesPagoDirecto>();

        services.AddMediatR( Assembly.GetExecutingAssembly() );
        services.AddValidatorsFromAssembly( Assembly.GetExecutingAssembly() );
        //services.AddTransient( typeof( IPipelineBehavior<,> ), typeof( ValidationBehaviour<,> ) );

        return services;
    }
}