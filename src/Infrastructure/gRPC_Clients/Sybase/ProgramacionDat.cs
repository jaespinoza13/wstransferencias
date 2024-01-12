

using AccesoDatosGrpcAse.Neg;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Programacion;
using Grpc.Net.Client;
using Infrastructure.Common.Funciones;
using Microsoft.Extensions.Options;
using System.Reflection;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace Infrastructure.gRPC_Clients.Sybase
{
    internal class ProgramacionDat : IProgramacionDat
    {
        private readonly ApiSettings _settings;
        private readonly ILogs _logsService;
        private readonly string str_clase;
        private const string str_mensaje_error = "Error inesperado, intenta más tarde.";

        public ProgramacionDat(IOptionsMonitor<ApiSettings> options, ILogs logsService)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!;
        }


        public RespuestaTransaccion GetDatosInicialesPT(ReqGetDatosInicialesPT reqGetDatosInicialesPT)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqGetDatosInicialesPT );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqGetDatosInicialesPT.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_trans", TipoDato = TipoDato.VarChar, ObjValue = reqGetDatosInicialesPT.str_nemo_tipo_trans } );

                ds.NombreSP = "get_datos_iniciales_pt";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqGetDatosInicialesPT, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion ValidaProgramacionTrans(ReqValidaProgramacionTrans reqValidaProgramacionTrans)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqValidaProgramacionTrans );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqValidaProgramacionTrans.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_trans", TipoDato = TipoDato.VarChar, ObjValue = reqValidaProgramacionTrans.str_nemonico_tipo_transferencia } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = reqValidaProgramacionTrans.str_id_cta_ordenante } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = reqValidaProgramacionTrans.str_id_cta_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto", TipoDato = TipoDato.Decimal, ObjValue = reqValidaProgramacionTrans.dec_monto_tran.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = String.IsNullOrEmpty( reqValidaProgramacionTrans.str_observacion ) ? "" : reqValidaProgramacionTrans.str_observacion } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_servicio", TipoDato = TipoDato.VarChar, ObjValue = reqValidaProgramacionTrans.str_srv_transfer } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dtt_fecha_desde", TipoDato = TipoDato.VarChar, ObjValue = reqValidaProgramacionTrans.str_fecha_desde.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dtt_fecha_hasta", TipoDato = TipoDato.VarChar, ObjValue = reqValidaProgramacionTrans.str_fecha_hasta.ToString() } );

                ds.NombreSP = "validar_progra_trans";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqValidaProgramacionTrans, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion AddProgramacionTrans(ReqAddProgramacionTrans reqAddProgramacionTrans)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqAddProgramacionTrans );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqAddProgramacionTrans.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_dia_transf", TipoDato = TipoDato.Integer, ObjValue = reqAddProgramacionTrans.int_dia_transf.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_trans", TipoDato = TipoDato.VarChar, ObjValue = reqAddProgramacionTrans.str_nemonico_tipo_transferencia } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = reqAddProgramacionTrans.str_id_cta_ordenante } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = reqAddProgramacionTrans.str_id_cta_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto", TipoDato = TipoDato.Decimal, ObjValue = reqAddProgramacionTrans.dec_monto_tran.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = String.IsNullOrEmpty( reqAddProgramacionTrans.str_observacion ) ? "" : reqAddProgramacionTrans.str_observacion } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_servicio", TipoDato = TipoDato.VarChar, ObjValue = reqAddProgramacionTrans.str_srv_transfer } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dtt_fecha_desde", TipoDato = TipoDato.VarChar, ObjValue = reqAddProgramacionTrans.str_fecha_desde.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dtt_fecha_hasta", TipoDato = TipoDato.VarChar, ObjValue = reqAddProgramacionTrans.str_fecha_hasta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_correo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = reqAddProgramacionTrans.str_correo_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_contrato", TipoDato = TipoDato.VarChar, ObjValue = reqAddProgramacionTrans.str_id_contrato } );

                ds.NombreSP = "add_programacion_transf";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqAddProgramacionTrans, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion UpdProgramacionTrans(ReqUpdProgramacionTrans reqUpdProgramacionTrans)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new();

                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );

                Funciones.llenarDatosAuditoriaSalida( ds, reqUpdProgramacionTrans );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_pt", TipoDato = TipoDato.Integer, ObjValue = reqUpdProgramacionTrans.int_id.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqUpdProgramacionTrans.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_dia_transf", TipoDato = TipoDato.Integer, ObjValue = reqUpdProgramacionTrans.int_dia_transf.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemo_tipo_trans", TipoDato = TipoDato.VarChar, ObjValue = reqUpdProgramacionTrans.str_nemonico_tipo_transferencia } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_ordenante", TipoDato = TipoDato.Integer, ObjValue = reqUpdProgramacionTrans.str_id_cta_ordenante } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_cta_beneficiario", TipoDato = TipoDato.Integer, ObjValue = reqUpdProgramacionTrans.str_id_cta_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@mny_monto", TipoDato = TipoDato.Decimal, ObjValue = reqUpdProgramacionTrans.dec_monto_tran.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_observacion", TipoDato = TipoDato.VarChar, ObjValue = String.IsNullOrEmpty( reqUpdProgramacionTrans.str_observacion ) ? "" : reqUpdProgramacionTrans.str_observacion } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_servicio", TipoDato = TipoDato.VarChar, ObjValue = reqUpdProgramacionTrans.str_srv_transfer } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dtt_fecha_desde", TipoDato = TipoDato.VarChar, ObjValue = reqUpdProgramacionTrans.str_fecha_desde.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dtt_fecha_hasta", TipoDato = TipoDato.VarChar, ObjValue = reqUpdProgramacionTrans.str_fecha_hasta.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_correo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = reqUpdProgramacionTrans.str_correo_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_contrato", TipoDato = TipoDato.VarChar, ObjValue = reqUpdProgramacionTrans.str_id_contrato } );

                ds.NombreSP = "upd_programacion_transf";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqUpdProgramacionTrans, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }

        public RespuestaTransaccion GetContratoPT(ReqGetContratoPT reqGetContratoPT)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqGetContratoPT );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqGetContratoPT.str_ente } );

                ds.NombreSP = "get_contrato_pt";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqGetContratoPT, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion GetTransfProgramadas(ReqGetTransfProgramadas reqGetTransfProgramadas)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqGetTransfProgramadas );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqGetTransfProgramadas.str_ente } );

                ds.NombreSP = "get_transf_programadas";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqGetTransfProgramadas, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion GetTransfEjecucion(ReqGetTransfEjecucion reqGetTransfEjecucion)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqGetTransfEjecucion );
                ds.NombreSP = "get_transf_ejecucion";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqGetTransfEjecucion, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion AddIntentoFallido(ReqAddIntentoFallido reqAddIntentoFallido)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqAddIntentoFallido );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_programacion", TipoDato = TipoDato.Integer, ObjValue = reqAddIntentoFallido.int_id.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_respuesta", TipoDato = TipoDato.VarChar, ObjValue = reqAddIntentoFallido.str_codigo_respuesta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mensaje_respuesta", TipoDato = TipoDato.VarChar, ObjValue = reqAddIntentoFallido.str_mensaje_respuesta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqAddIntentoFallido.str_ente } );

                ds.NombreSP = "add_intento_fallido_pt";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqAddIntentoFallido, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }
        public RespuestaTransaccion DelProgramacionTrans(ReqDelProgramacionTrans reqDelProgramacionTrans)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            GrpcChannel grpcChannel = null!;
            DALClient _objClienteDal = null!;
            try
            {

                DatosSolicitud ds = new();
                (grpcChannel, _objClienteDal) = Funciones.getConnection( _settings.client_grpc_sybase! );
                Funciones.llenarDatosAuditoriaSalida( ds, reqDelProgramacionTrans );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_pt", TipoDato = TipoDato.Integer, ObjValue = reqDelProgramacionTrans.int_id.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqDelProgramacionTrans.str_ente } );

                ds.NombreSP = "del_programacion_transf";
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
                respuesta.diccionario.Add("str_error", str_mensaje_error);
                _logsService.SaveExcepcionDataBaseSybase( reqDelProgramacionTrans, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
            }
            Funciones.setCloseConnection( grpcChannel );
            return respuesta;
        }

    }
}
