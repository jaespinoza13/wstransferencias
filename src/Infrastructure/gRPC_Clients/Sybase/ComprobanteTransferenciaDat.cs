using AccesoDatosGrpcAse.Neg;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Transferencias;
using Application.Transferencias.Comprobante;
using Infrastructure.Common.Funciones;
using Microsoft.Extensions.Options;
using System.Reflection;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace Infrastructure.gRPC_Clients.Sybase
{
    internal class ComprobanteTransferenciaDat : IComprobanteTransferencia
    {

        private readonly ApiSettings _settings;
        private readonly DALClient _objClienteDal;
        private readonly ILogs _logsService;
        private readonly string str_clase;

        public ComprobanteTransferenciaDat(IOptionsMonitor<ApiSettings> options, ILogs logsService, DALClient objClienteDal)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!;

            _objClienteDal = objClienteDal;

        }

        public async Task<RespuestaTransaccion> get_comprobante_transferencia(ReqComprobanteTransferencia reqComprobanteTransferencia)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, reqComprobanteTransferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_num_referencia", TipoDato = TipoDato.Integer, ObjValue = reqComprobanteTransferencia.int_num_referencia.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_documento_ordenante", TipoDato = TipoDato.VarChar, ObjValue = reqComprobanteTransferencia.str_documento_ordenante.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta_benef", TipoDato = TipoDato.VarChar, ObjValue = reqComprobanteTransferencia.str_num_cta_benef.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_tipo_transfer", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_comprobante_transferencia";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = await _objClienteDal.ExecuteDataSetAsync( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var int_tipo_transfer = lst_valores.Find( x => x.StrNameParameter == "@int_tipo_transfer" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "int_tipo_transfer", int_tipo_transfer.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                await _logsService.SaveExcepcionDataBaseSybase( reqComprobanteTransferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( reqComprobanteTransferencia.str_id_transaccion )!;

            }
            return respuesta;
        }

    }


}
