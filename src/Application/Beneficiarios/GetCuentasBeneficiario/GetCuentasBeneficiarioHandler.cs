

using MediatR;

using Application.Common.Interfaces;
using System.Reflection;
using Application.Common.Models;
using Application.Common.Converting;
using Domain.Entities;

namespace Application.Beneficiarios;

public class GetCuentasBeneficiarioHandler : IRequestHandler<ReqGetCuentasBeneficiario, ResGetCuentasBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;

    public GetCuentasBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
    }


    public async Task<ResGetCuentasBeneficiario> Handle(ReqGetCuentasBeneficiario reqGetCuentasBeneficiario, CancellationToken cancellationToken)
    {
        string operacion = "GET_CTAS_BENEF_TRANSFERENCIA";
        ResGetCuentasBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqGetCuentasBeneficiario );

        await _logs.SaveHeaderLogs( reqGetCuentasBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            RespuestaTransaccion res_tran = await _beneficiariosDat.GetCuentasBeneciairioTrans( reqGetCuentasBeneficiario );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.lst_cuentas_beneficiario = Conversions.ConvertConjuntoDatosToListClass<CuentasBeneficiario>( (ConjuntoDatos)res_tran.cuerpo );
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            await _logs.SaveResponseLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            await _logs.SaveExceptionLogs( respuesta, operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }

    }
}