﻿

using Application.Common.Models;

namespace Application.Programacion
{
    public interface IProgramacionDat
    {
        RespuestaTransaccion GetDatosInicialesPT(ReqGetDatosInicialesPT reqGetDatosInicialesPT);
        RespuestaTransaccion ValidaProgramacionTrans(ReqValidaProgramacionTrans reqValidaProgramacionTrans);
        RespuestaTransaccion AddProgramacionTrans(ReqAddProgramacionTrans reqAddProgramacionTrans);
        RespuestaTransaccion GetContratoPT(ReqGetContratoPT reqGetContratoPT);
        RespuestaTransaccion GetTransfProgramadas(ReqGetTransfProgramadas reqGetTransfProgramadas);
        RespuestaTransaccion GetTransfEjecucion(ReqGetTransfEjecucion reqGetTransfEjecucion);
        RespuestaTransaccion DelProgramacionTrans(ReqDelProgramacionTrans reqDelProgramacionTrans);
        RespuestaTransaccion UpdProgramacionTrans(ReqUpdProgramacionTrans reqUpdProgramacionTrans);
        RespuestaTransaccion AddIntentoFallido(ReqAddIntentoFallido reqAddIntentoFallido);
       
    }
}
