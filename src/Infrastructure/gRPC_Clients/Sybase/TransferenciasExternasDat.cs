

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
    internal class TransferenciasExternasDat : ITransferenciasExternasDat
    {
        private readonly ApiSettings _settings;
        private readonly DALClient _objClienteDal;
        private readonly ILogs _logsService;
        private readonly string str_clase;

        public TransferenciasExternasDat(IOptionsMonitor<ApiSettings> options, ILogs logsService, DALClient objClienteDal)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!;

            _objClienteDal = objClienteDal;

        }


        public RespuestaTransaccion ValidaTransferenciaInterbancaria(ReqValidaTransferencia req_validar_transferencia)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_validar_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.str_id_cta_ordenante } ); 
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = req_validar_transferencia.str_id_cta_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto_transfer", TipoDato = TipoDato.Decimal, ObjValue = req_validar_transferencia.dec_monto_tran.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = req_validar_transferencia.str_observacion } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_enviar_banred", TipoDato = TipoDato.Integer } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer } );


                ds.NombreSP = "get_val_transf_interbancarias3";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var str_enviar_banred = lst_valores.Find( x => x.StrNameParameter == "@o_enviar_banred" )!.ObjValue.Trim();
                var int_id_solicitud = lst_valores.Find( x => x.StrNameParameter == "@int_id_solicitud" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "str_enviar_banred", str_enviar_banred.ToString() );
                respuesta.diccionario.Add( "int_id_solicitud", int_id_solicitud );

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


        public RespuestaTransaccion SetEnvioTransferenciaSPI(ReqTransferencia req_transferencia)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_comprobar_transfer", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_id_comprobar_transfer.ToString() } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@mny_o_monto_comision", TipoDato = TipoDato.Money } );

                ds.NombreSP = "set_envio_transf_por_spi2";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var dec_comision = lst_valores.Find( x => x.StrNameParameter == "@mny_o_monto_comision" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "dec_comision", dec_comision.ToString() );


            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( req_transferencia.str_id_transaccion )!;
            }
            return respuesta;
        }


        public RespuestaTransaccion ValidaOtpTransferenciaInternbancaria(ReqAddTransferencia req_transferencia)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_ente } );
               // ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_transferencia", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_nemonico_tipo_transferencia } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_solicitud.ToString() } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_requiere_otp", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_val_otp_transf_interb";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var str_requiere_otp = lst_valores.Find( x => x.StrNameParameter == "@o_requiere_otp" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "str_requiere_otp", str_requiere_otp.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( req_transferencia.str_id_transaccion )!;

            }
            return respuesta;
        } public RespuestaTransaccion AddTransferenciaInternbancaria(ReqAddTransferencia req_transferencia)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, req_transferencia );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_solicitud", TipoDato = TipoDato.Integer, ObjValue = req_transferencia.int_solicitud.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_correo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = req_transferencia.str_correo_beneficiario } );

                ds.NombreSP = "add_transf_interbancarias3";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( req_transferencia, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( req_transferencia.str_id_transaccion )!;

            }
            return respuesta;
        }
    }
}
