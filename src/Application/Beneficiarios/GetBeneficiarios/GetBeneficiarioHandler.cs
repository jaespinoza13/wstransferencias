
using MediatR;

using Domain.Entities;

using Application.Beneficiarios.InterfazBeneficiariosDat;
using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;


using System.Reflection;

namespace Application.Beneficiarios.GetBeneficiarios;

public class GetBeneficiarioHandler : IRequestHandler<ReqGetBeneficiarios, ResGetBeneficiarios>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;

    public GetBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
    }
    public async Task<ResGetBeneficiarios> Handle(ReqGetBeneficiarios reqGetBeneficiarios, CancellationToken cancellationToken)
    {
        string str_operacion = "GET_BENEFICIARIO";
        ResGetBeneficiarios respuesta = new();
        respuesta.LlenarResHeader( reqGetBeneficiarios );
        await _logs.SaveHeaderLogs( reqGetBeneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = await _beneficiariosDat.GetDatosBeneficiarios( reqGetBeneficiarios );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            respuesta.lst_beneficiarios = Conversions.ConvertConjuntoDatosToListClass<Beneficiario>( (ConjuntoDatos)res_tran.cuerpo );
            await _logs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;

        }
        catch (Exception exception)
        {
            await _logs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }

    }
}