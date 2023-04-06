

using Application.Common.Models;

namespace Application.Programacion
{
    public interface IProgramacionDat
    {
        RespuestaTransaccion GetDatosInicialesPT(ReqGetDatosInicialesPT reqGetDatosInicialesPT);
        RespuestaTransaccion ValidaProgramacionTrans(ReqValidaProgramacionTrans reqValidaProgramacionTrans);
        RespuestaTransaccion GetContratoPT(ReqGetContratoPT reqGetContratoPT);
       
    }
}
