
using MediatR;

using Domain.Entities;

using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;


using System.Reflection;
using System.Text.Json;

namespace Application.Programacion;

public class AddProgramacionTransHandler : RequestHandler<ReqAddProgramacionTrans, ResAddProgramacionTrans>

{
    private readonly ILogs _logsService;
    private readonly string str_clase;
    private readonly IWsOtp _wsOtp;
    private readonly IProgramacionDat _programacionDat;


    public AddProgramacionTransHandler(ILogs logs, IProgramacionDat programacionDat, IWsOtp wsOtp)
    {
        str_clase = GetType().FullName!;
        _logsService = logs;
        _programacionDat = programacionDat;
        _wsOtp = wsOtp;
    }

    protected override ResAddProgramacionTrans Handle(ReqAddProgramacionTrans reqAddProgramacionTrans)
    {
        string str_operacion = "ADD_PROGRAMACION_TRANS";
        ResAddProgramacionTrans respuesta = new();
        respuesta.LlenarResHeader( reqAddProgramacionTrans );
        var res_tran = new RespuestaTransaccion();
        _logsService.SaveHeaderLogs( reqAddProgramacionTrans, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

        try
        {
            var requiereOtp = _wsOtp.ValidaRequiereOtp( reqAddProgramacionTrans, "ADD_PROGRAMACION_TRANS" ).Result;

            var ejecutarSolicitud = false;
            if (requiereOtp)
            {
                var res_tran_otp = _wsOtp.ValidaOtp( reqAddProgramacionTrans ).Result;
                if (res_tran_otp.codigo.Equals( "000" ))
                    ejecutarSolicitud = true;
                else
                {
                    res_tran.codigo = res_tran_otp.codigo;
                    res_tran.diccionario["str_error"] = res_tran_otp.diccionario["ERROR"];
                }
            }
            else
                ejecutarSolicitud = true;
            if (ejecutarSolicitud) {
                res_tran = _programacionDat.AddProgramacionTrans( reqAddProgramacionTrans );
            }

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