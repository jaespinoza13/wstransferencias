
using MediatR;

using Domain.Entities;

using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;


using System.Reflection;
using System.Text.Json;

namespace Application.Programacion;

public class DelProgramacionTransHandler : RequestHandler<ReqDelProgramacionTrans, ResDelProgramacionTrans>

{
    private readonly ILogs _logsService;
    private readonly string str_clase;
    private readonly IWsOtp _wsOtp;
    private readonly IProgramacionDat _programacionDat;


    public DelProgramacionTransHandler(ILogs logs, IProgramacionDat programacionDat, IWsOtp wsOtp)
    {
        str_clase = GetType().FullName!;
        _logsService = logs;
        _programacionDat = programacionDat;
        _wsOtp = wsOtp;
    }

    protected override ResDelProgramacionTrans Handle(ReqDelProgramacionTrans reqDelProgramacionTrans)
    {
        string str_operacion = "DEL_PROGRAMACION_TRANS";
        ResDelProgramacionTrans respuesta = new();
        respuesta.LlenarResHeader( reqDelProgramacionTrans );
        var res_tran = new RespuestaTransaccion();
        _logsService.SaveHeaderLogs( reqDelProgramacionTrans, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

        try
        {
           
            res_tran = _programacionDat.DelProgramacionTrans( reqDelProgramacionTrans );
            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            _logsService.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }
        catch (Exception exception)
        {
            _logsService.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
            throw new ArgumentException( respuesta.str_id_transaccion );
        }

    }
}