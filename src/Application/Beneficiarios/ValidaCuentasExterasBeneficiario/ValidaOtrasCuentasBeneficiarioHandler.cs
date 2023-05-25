

using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;
using Domain.Entities;
using MediatR;
using System.Reflection;

namespace Application.Beneficiarios;


public class ValidaOtrasCuentasBeneficiarioHandler : IRequestHandler<ReqValidaOtrasCuentasBeneficiario, ResValidaOtrasCuentasBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsOtp _wsOtp;

    public ValidaOtrasCuentasBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat, IWsOtp wsOtp)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _wsOtp = wsOtp;
    }

    public async Task<ResValidaOtrasCuentasBeneficiario> Handle(ReqValidaOtrasCuentasBeneficiario reqValidaOtrasCuentasBeneficiario, CancellationToken cancellationToken)
    {
        string operacion = "VALIDA_OTRAS_CTAS_MEGO";
        ResValidaOtrasCuentasBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqValidaOtrasCuentasBeneficiario );

        _logs.SaveHeaderLogs( reqValidaOtrasCuentasBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = await _beneficiariosDat.ValidaOtrasCuentasBeneficiario( reqValidaOtrasCuentasBeneficiario );

            if (res_tran.codigo.Equals( "000" ))
            {
                var res_tran_otp = await _wsOtp.ValidaRequiereOtp( reqValidaOtrasCuentasBeneficiario, reqValidaOtrasCuentasBeneficiario.str_tipo_beneficiario! );
                respuesta.bl_requiere_otp = res_tran_otp;
                respuesta.lst_beneficiario = Conversions.ConvertConjuntoDatosToListClass<Beneficiario>( (ConjuntoDatos)res_tran.cuerpo );
            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
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