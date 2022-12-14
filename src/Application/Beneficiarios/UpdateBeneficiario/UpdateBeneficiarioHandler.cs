
using MediatR;
using Application.Common.Interfaces;
using System.Reflection;
using Application.Common.Models;
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios;

public class UpdateBeneficiarioHandler : RequestHandler<ReqUpdateBeneficiario, ResUpdateBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsOtp _wsOtp;

    public UpdateBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat, IWsOtp wsOtp)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _wsOtp = wsOtp;
    }

    protected override ResUpdateBeneficiario Handle(ReqUpdateBeneficiario reqUpdateBeneficiario)
    {
        string operacion = "UPDATE_BENEFICIARIO";

        ResUpdateBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqUpdateBeneficiario );

        _logs.SaveHeaderLogs( reqUpdateBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        RespuestaTransaccion resTran = new();
        try
        {
            var requiereOtp = _wsOtp.ValidaRequiereOtp( reqUpdateBeneficiario, reqUpdateBeneficiario.str_tipo_beneficiario! ).Result;
            if (requiereOtp)
            {
                resTran = _wsOtp.ValidaOtp( reqUpdateBeneficiario ).Result;
                resTran = resTran.codigo.Equals( "000" ) ? _beneficiariosDat.UpdateCuentaBeneficiario( reqUpdateBeneficiario ) : resTran;
            }
            else
          
                resTran = _beneficiariosDat.UpdateCuentaBeneficiario( reqUpdateBeneficiario );
            

            respuesta.str_res_estado_transaccion = resTran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = resTran.codigo;
            respuesta.str_res_info_adicional = resTran.diccionario.ContainsKey( "str_error" ) ? resTran.diccionario["str_error"] : resTran.diccionario["ERROR"];

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
