using AccesoDatosGrpcAse.Neg;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Transferencias.DTO;
using Application.Transferencias.InterfazDat;
using Grpc.Net.Client;
using Infrastructure.Common.Funciones;
using Microsoft.Extensions.Options;
using System.Reflection;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace Infrastructure.gRPC_Clients.Sybase
{
    internal class TransferenciasInternasDat : ITransferenciasInternasDat
    {
        private readonly ApiSettings _settings;
        private readonly DALClient objClienteDal;
        private readonly ILogs _logsService;
        private readonly string str_clase;

        public TransferenciasInternasDat(IOptionsMonitor<ApiSettings> options, ILogs logsService)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!;

            var handler = new SocketsHttpHandler
            {
                PooledConnectionIdleTimeout = Timeout.InfiniteTimeSpan,
                KeepAlivePingDelay = TimeSpan.FromSeconds( _settings.delayOutGrpcSybase ),
                KeepAlivePingTimeout = TimeSpan.FromSeconds( _settings.timeoutGrpcSybase ),
                EnableMultipleHttp2Connections = true
            };

            var canal = GrpcChannel.ForAddress( _settings.client_grpc_sybase!, new GrpcChannelOptions { HttpHandler = handler } );
            objClienteDal = new DALClient( canal );
        }


        public RespuestaTransaccion ValidaTransferenciaInterna(ReqValidaTransferencia req_validar_transferencia)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_validar_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_trans", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_nemonico_tipo_transferencia } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_id_cta_ordenante.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_id_cta_beneficiario.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto", TipoDato = TipoDato.Decimal, ObjValue = req_validar_transferencia.dec_monto_tran.ToString() } );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = String.IsNullOrEmpty( req_validar_transferencia.str_observacion ) ? "" : req_validar_transferencia.str_observacion } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_servicio", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_srv_transfer } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_categoria", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_categoria.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_log", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_id_log } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_referencia_trans", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_id_servicio } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_subcategoria_gasto", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.int_subcategoria_gasto.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "validar_transfer_interna_v3";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

                if (respuesta.codigo == "000")
                {
                    respuesta.diccionario.Add( "int_solicitud", lst_valores.Find( x => x.StrNameParameter == "@int_id_solicitud" )!.ObjValue.Trim() );
                }

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( req_validar_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( req_validar_transferencia.str_id_transaccion )!;

            }
            return respuesta;
        }


        public RespuestaTransaccion AddTransferenciaInterna(ReqAddTransferencia req_add_transferencia_interna)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_add_transferencia_interna );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_correo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = req_add_transferencia_interna.str_correo_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer, ObjValue = req_add_transferencia_interna.int_solicitud.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer } );


                ds.NombreSP = "add_transferencia_interna_v3";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

                if (respuesta.codigo == "000")
                {
                    respuesta.diccionario.Add( "int_id", lst_valores.Find( x => x.StrNameParameter == "@int_id" )!.ObjValue.Trim() );
                }

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( req_add_transferencia_interna, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( req_add_transferencia_interna.str_id_transaccion )!;

            }
            return respuesta;
        }

    }
}
