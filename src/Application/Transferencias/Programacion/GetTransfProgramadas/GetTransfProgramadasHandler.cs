
using MediatR;
using Application.Common.Interfaces;


using System.Reflection;
using Application.Common.Converting;
using Application.Common.Models;
using Domain.Entities;

namespace Application.Programacion;

public class GetTransfProgramadasHandler : RequestHandler<ReqGetTransfProgramadas, ResGetTransfProgramadas>

{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IProgramacionDat _programacionDat;

    public GetTransfProgramadasHandler(ILogs logs, IProgramacionDat programacionDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _programacionDat = programacionDat;
    }

    protected override ResGetTransfProgramadas Handle(ReqGetTransfProgramadas reqGetTransfProgramadas)
    {
        string str_operacion = "GET_TRANS_PROGRAMADAS";
        ResGetTransfProgramadas respuesta = new();
        respuesta.LlenarResHeader( reqGetTransfProgramadas );
        _logs.SaveHeaderLogs( reqGetTransfProgramadas, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = _programacionDat.GetTransfProgramadas( reqGetTransfProgramadas );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            respuesta.lst_tranferencias = Conversions.ConvertConjuntoDatosToListClass<TransferenciasProgramadas>( (ConjuntoDatos)res_tran.cuerpo);
            _logs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase );
            return respuesta;

        }
        catch (Exception exception)
        {
            _logs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }

    }
}