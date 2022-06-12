
using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;
using MediatR;
using System.Reflection;

namespace Application.Transferencias.Consulta;


public class ConsultaTransferenciasHandler : IRequestHandler<ReqConsultaTransferencias, ResConsultaTransferencias>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IConsultaTransferencias _consultaTransferencias;
    public ConsultaTransferenciasHandler(ILogs logs, IConsultaTransferencias consultaTransferencias)
    {
        _logs = logs;
        _clase = GetType().Name;
        _consultaTransferencias = consultaTransferencias;
    }

    public async Task<ResConsultaTransferencias> Handle(ReqConsultaTransferencias reqConsultaTransferencias, CancellationToken cancellationToken)
    {
        string operacion = "GET_CONSULTA_TRANSFERENCIAS";
        ResConsultaTransferencias respuesta = new();
        respuesta.LlenarResHeader( reqConsultaTransferencias );
        await _logs.SaveHeaderLogs( reqConsultaTransferencias, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            RespuestaTransaccion res_tran = await _consultaTransferencias.ConsultaTransferencias( reqConsultaTransferencias );

            if (res_tran.codigo.Equals( "000" ))
            {
                respuesta.lst_tranferencias = Conversions.ConvertConjuntoDatosToListClass<Transferencias>( (ConjuntoDatos)res_tran.cuerpo );
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                respuesta.int_numero_registros = Convert.ToInt32( res_tran.diccionario["int_num_registros"].ToString() );
            }

            respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
            respuesta.str_res_codigo = res_tran.codigo;
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

