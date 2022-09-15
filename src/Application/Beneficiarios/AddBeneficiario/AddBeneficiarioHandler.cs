
using Application.Common.Interfaces;
using Application.Common.Models;
using MediatR;
using System.Reflection;

namespace Application.Beneficiarios;

public class AddBeneficiarioHandler : RequestHandler<ReqAddBeneficiario, ResAddBeneficiario>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsOtp _wsOtp;

    public AddBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat, IWsOtp wsOtp)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _wsOtp = wsOtp;
    }

    protected override ResAddBeneficiario Handle(ReqAddBeneficiario reqAddBeneficiario)
    {
        string operacion = "ADD_BENEFICIARIO";
        RespuestaTransaccion resTran = new();
        ResAddBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqAddBeneficiario );

        _logs.SaveHeaderLogs( reqAddBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
        try
        {
            var requiereOtp = _wsOtp.ValidaRequiereOtp( reqAddBeneficiario, reqAddBeneficiario.str_tipo_beneficiario! ).Result;

            if (requiereOtp)
            {
                resTran = _wsOtp.ValidaOtp( reqAddBeneficiario ).Result;
                if (resTran.codigo.Equals( "000" ))
                {
                    resTran = _beneficiariosDat.AddBeneficiario( reqAddBeneficiario );
                    respuesta.str_res_info_adicional = resTran.diccionario["str_error"];
                }
                else
                {
                    respuesta.str_res_info_adicional = resTran.codigo;
                    respuesta.str_res_info_adicional = resTran.diccionario["ERROR"];
                }
            }
            else
            {
                resTran = _beneficiariosDat.AddBeneficiario( reqAddBeneficiario );
                respuesta.str_res_info_adicional = resTran.diccionario["str_error"];
            }

            respuesta.str_res_codigo = resTran.codigo;
            respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";
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