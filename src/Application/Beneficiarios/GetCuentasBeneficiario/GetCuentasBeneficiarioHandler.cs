

using MediatR;
using Application.Common.Interfaces;
using System.Reflection;
using Application.Common.Models;
using Application.Common.Converting;
using Domain.Entities;
using Domain.Services.Alfresco;

namespace Application.Beneficiarios;

public class GetCuentasBeneficiarioHandler : IRequestHandler<ReqGetCuentasBeneficiario, ResGetCuentasBeneficiario>
{

    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;
    private readonly IWsAlfresco _wsAlfresco;

    public GetCuentasBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat, IWsAlfresco wsAlfresco)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
        _wsAlfresco = wsAlfresco;
    }


    public async Task<ResGetCuentasBeneficiario> Handle(ReqGetCuentasBeneficiario reqGetCuentasBeneficiario, CancellationToken cancellationToken)
    {
        string operacion = "GET_CTAS_BENEF_TRANSFERENCIA";
        ResGetCuentasBeneficiario respuesta = new();
        respuesta.LlenarResHeader( reqGetCuentasBeneficiario );

        await _logs.SaveHeaderLogs( reqGetCuentasBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        string imagen = String.Empty;

        try
        {
            RespuestaTransaccion res_tran = await _beneficiariosDat.GetCuentasBeneciairioTrans( reqGetCuentasBeneficiario );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.lst_cuentas_beneficiario = Conversions.ConvertConjuntoDatosToListClass<CuentasBeneficiario>( (ConjuntoDatos)res_tran.cuerpo );
            
            //if(reqGetCuentasBeneficiario.str_tipo_beneficiario == "BEN_OTRAS_CTAS_COOPMEGO")
            //{
            //    for (int i = 0; i < respuesta.lst_cuentas_beneficiario.Count; i++)
            //    {
            //        if (respuesta.lst_cuentas_beneficiario[i].str_avatar != " " && respuesta.lst_cuentas_beneficiario[i].int_favorito == 1)
            //        {
            //            ResGetDocAlfresco resGetDocAlfresco = _wsAlfresco.GetDocumentoAlfresco( respuesta.lst_cuentas_beneficiario[i].str_avatar, operacion, reqGetCuentasBeneficiario.str_id_transaccion );
            //            if (resGetDocAlfresco != null && resGetDocAlfresco.file_bytes != null && resGetDocAlfresco.file_bytes.Length > 0)
            //            {
            //                imagen = resGetDocAlfresco.file_bytes!;
            //                respuesta.lst_cuentas_beneficiario[i].avatar!.file_bytes = imagen;
            //                respuesta.lst_cuentas_beneficiario[i].avatar!.str_doc_extencion = resGetDocAlfresco!.str_doc_extencion;
            //            }
            //            else
            //            {
            //                respuesta.lst_cuentas_beneficiario[i].str_avatar = " ";
            //            }
            //        }
            //    }
            //}
            //else
            //{
            //    for (int i = 0; i < respuesta.lst_cuentas_beneficiario.Count; i++)
            //    {
            //        respuesta.lst_cuentas_beneficiario[i].avatar = null;
            //    }
            //}
            
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