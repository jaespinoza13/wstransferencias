
using MediatR;

using System.Reflection;

using Application.Common.Interfaces;

namespace Application.Beneficiarios;

public class ValidaRegistroBeneficiarioHandler : IRequestHandler<ReqValidaRegistroBeneficiario, ResValidaRegistroBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsOtp _wsOtp;

    public ValidaRegistroBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat, IWsOtp wsOtp)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _wsOtp = wsOtp;
    }

    public async Task<ResValidaRegistroBeneficiario> Handle(ReqValidaRegistroBeneficiario reqValidaRegistroBeneficiario, CancellationToken cancellationToken)
    {
        string operacion = "VALIDAR_REGISTRO_BENEFICIARIO";
        ResValidaRegistroBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqValidaRegistroBeneficiario );
        _logs.SaveHeaderLogs( reqValidaRegistroBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = await _beneficiariosDat.ValidaRegistrBeneficiario( reqValidaRegistroBeneficiario );

            if (res_tran.codigo.Equals( "000" ))
            {
                respuesta.bl_requiere_otp = await _wsOtp.ValidaRequiereOtp( reqValidaRegistroBeneficiario, reqValidaRegistroBeneficiario.str_tipo_beneficiario! );
            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];
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