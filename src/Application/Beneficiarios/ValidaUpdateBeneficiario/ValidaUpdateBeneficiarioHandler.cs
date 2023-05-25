using Application.Common.Interfaces;
using MediatR;
using System.Reflection;

namespace Application.Beneficiarios;

public class ValidaUpdateBeneficiarioHandler : IRequestHandler<ReqValidaUpdateBeneficiario, ResValidaUpdateBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IWsOtp _wsOtp;

    public ValidaUpdateBeneficiarioHandler(ILogs logs, IWsOtp wsOtp)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _wsOtp = wsOtp;
    }

    public async Task<ResValidaUpdateBeneficiario> Handle(ReqValidaUpdateBeneficiario reqValidaUpdateBeneficiario, CancellationToken cancellationToken)
    {
        string operacion = "VALIDAR_UPDATE_BENEFICIARIO";
        ResValidaUpdateBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqValidaUpdateBeneficiario );

        _logs.SaveHeaderLogs( reqValidaUpdateBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var bl_requiere_otp = await _wsOtp.ValidaRequiereOtp( reqValidaUpdateBeneficiario, reqValidaUpdateBeneficiario.str_tipo_beneficiario! );
            respuesta.str_res_codigo = "000";
            respuesta.str_res_estado_transaccion = "OK";
            respuesta.str_res_info_adicional = String.Empty;
            respuesta.bl_requiere_otp = bl_requiere_otp;

            _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            _logs.SaveExceptionLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }
    }
}

