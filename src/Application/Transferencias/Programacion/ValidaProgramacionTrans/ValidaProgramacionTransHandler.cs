
using MediatR;

using Domain.Entities;

using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;


using System.Reflection;
using System.Text.Json;

namespace Application.Programacion;

public class ValidaProgramacionTransHandler : RequestHandler<ReqValidaProgramacionTrans, ResValidaProgramacionTrans>

{
    private readonly ILogs _logsService;
    private readonly string str_clase;
    private readonly IWsOtp _wsOtp;
    private readonly IProgramacionDat _programacionDat;


    public ValidaProgramacionTransHandler(ILogs logs, IProgramacionDat programacionDat, IWsOtp wsOtp)
    {
        str_clase = GetType().FullName!;
        _logsService = logs;
        _programacionDat = programacionDat;
        _wsOtp = wsOtp;
    }

    protected override ResValidaProgramacionTrans Handle(ReqValidaProgramacionTrans reqValidaProgramacionTrans)
    {
        string str_operacion = "VALIDA_PROGRAMACION_TRANS";
        ResValidaProgramacionTrans respuesta = new();
        respuesta.LlenarResHeader( reqValidaProgramacionTrans );

        _logsService.SaveHeaderLogs( reqValidaProgramacionTrans, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

        try
        {
            var res_tran = _programacionDat.ValidaProgramacionTrans( reqValidaProgramacionTrans );

            if (res_tran.codigo.Equals( "000" ))
                respuesta.bl_requiere_otp = _wsOtp.ValidaRequiereOtp( reqValidaProgramacionTrans, "PROGRAMACION_TRANS" ).Result;
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