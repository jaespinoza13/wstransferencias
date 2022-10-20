
using Application.Common.Interfaces;
using Infrastructure.DailyRequest;
using Infrastructure.gGRPC_Clients.Mongo;
using Infrastructure.gRPC_Clients.Sybase;
using Infrastructure.Services;
using Infrastructure.MemoryCache;
using Infrastructure.Common.Interfaces;
using Infrastructure.ExternalAPIs;
using Application.Transferencias.InterfazDat;
using Infrastructure.SessionControl;
using Application.Transferencias.Consulta;
using Application.Beneficiarios;
using Application.Transferencias;

namespace Microsoft.Extensions.DependencyInjection;
public static class ConfigureInfrastructure
{
    public static IServiceCollection AddInfrastructureServices(this IServiceCollection services)
    {
        //INTERFACES DE SERVICIOS
        services.AddSingleton<ParametersInMemory>();
        services.AddSingleton<ILogs, LogsService>();
        services.AddSingleton<IMongoDat, LogsMongoDat>();
        services.AddSingleton<IDailyRequest, DailyRequest>();
        services.AddSingleton<IParametersInMemory, ParametersInMemory>();
        services.AddSingleton<IParametrosDat, ParametrosDat>();
        services.AddTransient<IHttpService, HttpService>();
        services.AddTransient<IWsAlfresco, WsAlfresco>();
        services.AddTransient<ISqlInjectionValidationService, SqlInjectionValidationService>();
        services.AddTransient<IWsOtp, WsOtp>();
        services.AddSingleton<IOtpDat, OtpDat>();
        services.AddTransient<ISessionControl, SessionControl>();
        services.AddSingleton<ISesionDat, SesionDat>();
        services.AddSingleton<IKeysDat, KeysDat>();


        //INTERFACES DE CASOS DE USO
        services.AddSingleton<IBeneficiariosDat, BenficiariosDat>();
        services.AddSingleton<ITransferenciasExternasDat, TransferenciasExternasDat>();
        services.AddSingleton<ITransferenciasInternasDat, TransferenciasInternasDat>();
        services.AddSingleton<IConsultaTransferencias, ConsultaTransferenciasDat>();


        return services;
    }
}
