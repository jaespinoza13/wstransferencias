using Application.Common.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using FluentValidation.AspNetCore;
using System.Text;
using WebUI.Filters;
using Microsoft.AspNetCore.Mvc;
using System.Reflection;

namespace Microsoft.Extensions.DependencyInjection;

public static class ConfigureServices
{
    public static IServiceCollection AddWebUIServices(this IServiceCollection services, IConfiguration configuration)
    {
        // CUSTOMISE API EXCEPTIONS BEHAVIOUR
        services.AddControllersWithViews( options => options.Filters.Add<ApiExceptionFilterAttribute>() )
                .AddFluentValidation( x => x.RegisterValidatorsFromAssembly( Assembly.GetExecutingAssembly() ) );

        // CUSTOMISE DEFAULT API BEHAVIOUR
        services.Configure<ApiBehaviorOptions>( options => options.SuppressModelStateInvalidFilter = true );

        //AUTHORIZATION 
        var llave = configuration.GetValue<string>( "llavejwt" );

        services.AddAuthentication( JwtBearerDefaults.AuthenticationScheme )
                        .AddJwtBearer( opciones => opciones.TokenValidationParameters = new TokenValidationParameters
                        {
                            ValidateIssuer = false,
                            ValidateAudience = false,
                            ValidateLifetime = true,
                            ValidateIssuerSigningKey = true,
                            IssuerSigningKey = new SymmetricSecurityKey( Encoding.UTF8.GetBytes( llave ) ),
                            ClockSkew = TimeSpan.Zero
                        } );


        //SERVICES
        services.AddDataProtection();
        services.AddMemoryCache();
        services.AddOptions();


        //FILTERS
        services.AddTransient<DailyRequestFilter>();

        //SWAGGER
        services.AddEndpointsApiExplorer();
        services.AddSwaggerGen( c =>
        {
            c.SwaggerDoc( "v1", new OpenApiInfo
            {
                Title = "API Transferencias",
                Version = "v2",
                Description = "servicio de transferencias y beneficiarios de CoopMego"
            } );
        } );

        //CONFIGURATIONS
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:DataBases" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:GrpcSettings" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:ConfigMongodb" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:LogsPath" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:LoadParameters" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:valida_peticiones_diarias" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:HttpSettings" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:Endpoints" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:EndpointsAuth" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:AlfrescoSettings" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:Transferencia" ) );
        services.Configure<ApiSettings>( configuration.GetSection( "ApiSettings:DescripcionErrores" ) );

        return services;
    }
}