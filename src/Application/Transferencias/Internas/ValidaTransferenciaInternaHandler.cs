
using Application.Common.Converting;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Transferencias.DTO;
using Application.Transferencias.InterfazDat;
using Domain.Entities;
using MediatR;
using System.Reflection;
using System.Text.Json;

namespace Application.Transferencias.Internas;

public record ValidaTransferenciaInternaCommand(ReqValidaTransferencia ReqValidaTransferencia) : IRequest<ResValidaTransferencia>;

public class ValidaTransferenciaInternaHandler : RequestHandler<ValidaTransferenciaInternaCommand, ResValidaTransferencia>
{
    private readonly ILogs _logs;
    private readonly string _clase;
    private readonly IWsOtp _wsOtp;
    private readonly ITransferenciasInternasDat _internasDat;

    public ValidaTransferenciaInternaHandler(ILogs logs, IWsOtp wsOtp, ITransferenciasInternasDat internasDat)
    {
        _clase = GetType().FullName!;
        _logs = logs;
        _wsOtp = wsOtp;
        _internasDat = internasDat;
    }

    protected override ResValidaTransferencia Handle(ValidaTransferenciaInternaCommand request)
    {
        var validaTransferenciaInterna = request.ReqValidaTransferencia;
        string operacion = "VALIDA_TRANSFERENCIA_INTERNA";
        ResValidaTransferencia respuesta = new();
        respuesta.LlenarResHeader( validaTransferenciaInterna );

        _logs.SaveHeaderLogs( validaTransferenciaInterna, operacion, MethodBase.GetCurrentMethod()!.Name, _clase );

        try
        {
            var res_tran = _internasDat.ValidaTransferenciaInterna( validaTransferenciaInterna );

            if (res_tran.codigo.Equals( "000" ))
            {
                respuesta.bl_requiere_otp = _wsOtp.ValidaRequiereOtp( validaTransferenciaInterna, validaTransferenciaInterna.str_nemonico_tipo_transferencia! ).Result;
                if (respuesta.bl_requiere_otp && validaTransferenciaInterna.str_nemonico_tipo_transferencia!.Equals( "TRN_OTRAS_CUENTAS_COOPMEGO" )) {
                    var reqAddTransferencia = JsonSerializer.Deserialize<ReqAddTransferencia>( JsonSerializer.Serialize( validaTransferenciaInterna ) )!;
                    reqAddTransferencia.int_solicitud = Convert.ToInt32( res_tran.diccionario["int_id_solicitud"] );
                    var res_tran_otp = _internasDat.ValidaOtpTransferenciaInterna( reqAddTransferencia );
                    respuesta.bl_requiere_otp= res_tran_otp.diccionario["str_requiere_otp"].Equals( "1006" )?false: respuesta.bl_requiere_otp;
                }
                respuesta.str_res_estado_transaccion = "OK";
                respuesta.int_solicitud = Convert.ToInt32( res_tran.diccionario["int_solicitud"].ToString() );
                respuesta.objValidacionTransferencia = Conversions.ConvertConjuntoDatosToClass<ValidacionTransferencia>( (ConjuntoDatos)res_tran.cuerpo )!;
            }
            else
                respuesta.str_res_estado_transaccion = "ERR";

            respuesta.str_res_codigo = res_tran.codigo;
            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            if (res_tran.codigo.Equals( "000" ))
            {
                respuesta.objValidacionTransferencia = Conversions.ConvertConjuntoDatosToClass<ValidacionTransferencia>( (ConjuntoDatos)res_tran.cuerpo )!;
            }


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