
using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Transferencias.DTO;
using Application.Transferencias.InterfazDat;
using MediatR;
using System.Reflection;

namespace Application.Transferencias.Internas;


public record AddTransferenciaInternaCommand(ReqAddTransferencia ReqAddTransferencia) : IRequest<ResAddTransferencia>;

public class AddTransferenciaInternaHandler : RequestHandler<AddTransferenciaInternaCommand, ResAddTransferencia>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IWsOtp _wsOtp;
    private readonly ITransferenciasInternasDat _internasDat;

    public AddTransferenciaInternaHandler(ILogs logs, IWsOtp wsOtp, ITransferenciasInternasDat internasDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _wsOtp = wsOtp;
        _internasDat = internasDat;
    }


    protected override ResAddTransferencia Handle(AddTransferenciaInternaCommand request)
    {
        var reqAddTransferencia = request.ReqAddTransferencia;
        string operacion = "ADD_TRANSFERENCIA_INTERNA";
        RespuestaTransaccion res_tran = new();
        ResAddTransferencia respuesta = new();
        respuesta.LlenarResHeader( reqAddTransferencia );

        _logs.SaveHeaderLogs( reqAddTransferencia, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );


        try
        {
            var bl_requiere_otp = _wsOtp.ValidaRequiereOtp( reqAddTransferencia, reqAddTransferencia.str_nemonico_tipo_transferencia! ).Result;
            var res_tran_otp = _internasDat.ValidaOtpTransferenciaInterna( reqAddTransferencia );
            bl_requiere_otp = res_tran_otp.diccionario["str_requiere_otp"].Equals( "1006" ) ? false : bl_requiere_otp;

            if (bl_requiere_otp)
            {
                res_tran = _wsOtp.ValidaOtp( reqAddTransferencia ).Result;
                if (res_tran.codigo.Equals( "000" ))
                {
                    res_tran = _internasDat.AddTransferenciaInterna( reqAddTransferencia );
                }
                else
                {
                    respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["ERROR"];
                }
            }
            else
            {
                res_tran = _internasDat.AddTransferenciaInterna( reqAddTransferencia );
            }

            if (res_tran.codigo.Equals( "000" ))
            {
                respuesta.objAddTransferencia = Conversions.ConvertConjuntoDatosToClass<ResAddTransferencia.AddTransferencia>( (ConjuntoDatos)res_tran.cuerpo )!;
                respuesta.str_res_estado_transaccion = "OK";
                respuesta.objAddTransferencia.int_id_transaccion = Convert.ToInt32( res_tran.diccionario["int_id"] );
            }
            else
            {
                respuesta.str_res_estado_transaccion = "ERR";
                respuesta.str_res_info_adicional = res_tran.diccionario.ContainsKey( "str_error" ) ? res_tran.diccionario["str_error"] : respuesta.str_res_info_adicional;
            }

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";

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