
using MediatR;
using Application.Common.Interfaces;


using System.Reflection;
using Application.Common.Converting;
using Application.Common.Models;
using Domain.Entities;

namespace Application.Programacion;

public class GetTransfEjecucionHandler : RequestHandler<ReqGetTransfEjecucion, ResGetTransfEjecucion>

{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IProgramacionDat _programacionDat;

    public GetTransfEjecucionHandler(ILogs logs, IProgramacionDat programacionDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _programacionDat = programacionDat;
    }

    protected override ResGetTransfEjecucion Handle(ReqGetTransfEjecucion reqGetTransfEjecucion)
    {
        string str_operacion = "GET_TRANS_EJECUCION";
        ResGetTransfEjecucion respuesta = new();
        respuesta.LlenarResHeader( reqGetTransfEjecucion );
        _logs.SaveHeaderLogs( reqGetTransfEjecucion, str_operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = _programacionDat.GetTransfEjecucion( reqGetTransfEjecucion );
            respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            respuesta.lst_tranferencias = Conversions.ConvertConjuntoDatosToListClass<TransferenciasEjecucion>( (ConjuntoDatos)res_tran.cuerpo);
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