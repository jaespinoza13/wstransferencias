
using Application.Common.Interfaces;
using Infrastructure.DailyRequest;
using Infrastructure.gGRPC_Clients.Mongo;
using Infrastructure.gRPC_Clients.Sybase;
using Infrastructure.Services;
using Infrastructure.MemoryCache;
using Infrastructure.Common.Interfaces;
using Infrastructure.ExternalAPIs;
using Application.Beneficiarios.InterfazBeneficiariosDat;
using Application.Transferencias.InterfazDat;
using Infrastructure.SessionControl;
using Application.Transferencias.Consulta;

namespace Microsoft.Extensions.DependencyInjection;
public static class ConfigureInfrastructure
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
    {
        //INTERFACES DE SERVICIOS
        services.AddTransient<ParametersInMemory>();
        services.AddTransient<ILogs, LogsService>();
        services.AddTransient<IMongoDat, LogsMongoDat>();
        services.AddTransient<IDailyRequest, DailyRequest>();
        services.AddTransient<IParametersInMemory, ParametersInMemory>();
        services.AddTransient<IParametrosDat, ParametrosDat>();
        services.AddTransient<IHttpService, HttpService>();
        services.AddTransient<IWsAlfresco, WsAlfresco>();
        services.AddTransient<ISqlInjectionValidationService, SqlInjectionValidationService>();
        services.AddTransient<IWsOtp, WsOtp>();
        services.AddTransient<IOtpDat, OtpDat>();
        services.AddTransient<ISessionControl, SessionControl>();
        services.AddTransient<ISesionDat, SesionDat>();

        //INTERFACES DE CASOS DE USO
        services.AddTransient<IBeneficiariosDat, BenficiariosDat>();
        services.AddTransient<ITransferenciasExternasDat, TransferenciasExternasDat>();
        services.AddTransient<ITransferenciasInternasDat, TransferenciasInternasDat>();
        services.AddTransient<IConsultaTransferencias, ConsultaTransferenciasDat>();


        return services;
    }
}
