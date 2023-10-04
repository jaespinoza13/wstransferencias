

using MediatR;
using Application.Common.Interfaces;
using System.Reflection;
using Application.Common.Models;
using Application.Common.Converting;
using Domain.Entities;
using Domain.Services.Alfresco;
using System.Runtime;
using Microsoft.Extensions.Options;

namespace Application.Beneficiarios;

public class GetCuentasBeneficiarioHandler : IRequestHandler<ReqGetCuentasBeneficiario, ResGetCuentasBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly ApiSettings _settings;

    public GetCuentasBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat, IOptionsMonitor<ApiSettings> option)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _settings = option.CurrentValue;
    }


    public async Task<ResGetCuentasBeneficiario> Handle(ReqGetCuentasBeneficiario reqGetCuentasBeneficiario, CancellationToken cancellationToken)
    {
        string operacion = "GET_CTAS_BENEF_TRANSFERENCIA";
        ResGetCuentasBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqGetCuentasBeneficiario );

        _logs.SaveHeaderLogs( reqGetCuentasBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );


        try
        {
            RespuestaTransaccion res_tran = await _beneficiariosDat.GetCuentasBeneciairioTrans( reqGetCuentasBeneficiario );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.lst_cuentas_beneficiario = Conversions.ConvertConjuntoDatosToListClass<CuentasBeneficiario>( (ConjuntoDatos)res_tran.cuerpo );

            if (reqGetCuentasBeneficiario.str_tipo_beneficiario == "BEN_OTRAS_CTAS_COOPMEGO")
            {
                for (int i = 0; i < respuesta.lst_cuentas_beneficiario.Count; i++)
                {
                    if (respuesta.lst_cuentas_beneficiario[i].str_avatar.Trim() != "")
                    {
                        string str_id_avatar = respuesta.lst_cuentas_beneficiario[i].str_avatar;
                        respuesta.lst_cuentas_beneficiario[i].str_avatar = _settings.avatar_url + str_id_avatar;
                    }
                }
            }

            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

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