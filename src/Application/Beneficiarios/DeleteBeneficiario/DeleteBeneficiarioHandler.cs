
using MediatR;

using System.Reflection;

using Application.Beneficiarios.InterfazBeneficiariosDat;
using Application.Common.Interfaces;
using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios.DeleteBeneficiario;


internal class DeleteBeneficiarioHandler : RequestHandler<ReqDeleteBeneficiario, ResComun>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IBeneficiariosDat _beneficiariosDat;

    public DeleteBeneficiarioHandler(ILogs logs, IBeneficiariosDat beneficiariosDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _beneficiariosDat = beneficiariosDat;
    }

    protected override ResComun Handle(ReqDeleteBeneficiario reqDeleteBeneficiario)
    {
        string operacion = "DELETE_BENEFICIARIO";
        ResComun respuesta = new();
        respuesta.LlenarResHeader( reqDeleteBeneficiario );

        _logs.SaveHeaderLogs( reqDeleteBeneficiario, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = _beneficiariosDat.DeleteCuentaBeneficiario( reqDeleteBeneficiario );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
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