

using AccesoDatosGrpcAse.Neg;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Programacion;
using Application.Transferencias.DTO;
using Infrastructure.Common.Funciones;
using Microsoft.Extensions.Options;
using System.Reflection;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace Infrastructure.gRPC_Clients.Sybase
{
    internal class ProgramacionDat : IProgramacionDat
    {
        private readonly ApiSettings _settings;
        private readonly DALClient _objClienteDal;
        private readonly ILogs _logsService;
        private readonly string str_clase;

        public ProgramacionDat(IOptionsMonitor<ApiSettings> options, ILogs logsService, DALClient objClienteDal)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!;

            _objClienteDal = objClienteDal;

        }


        public RespuestaTransaccion GetDatosInicialesPT(ReqGetDatosInicialesPT reqGetDatosInicialesPT)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
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
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqGetDatosInicialesPT, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqGetDatosInicialesPT.str_id_transaccion )!;
            }
            return respuesta;
        }
          public RespuestaTransaccion ValidaProgramacionTrans(ReqValidaProgramacionTrans reqValidaProgramacionTrans)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
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
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqValidaProgramacionTrans, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqValidaProgramacionTrans.str_id_transaccion )!;
            }
            return respuesta;
        }    public RespuestaTransaccion AddProgramacionTrans(ReqAddProgramacionTrans reqAddProgramacionTrans)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new();
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
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqAddProgramacionTrans, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqAddProgramacionTrans.str_id_transaccion )!;
            }
            return respuesta;
        }

        public RespuestaTransaccion GetContratoPT(ReqGetContratoPT reqGetContratoPT)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
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
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqGetContratoPT, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqGetContratoPT.str_id_transaccion )!;
            }
            return respuesta;
        } 
        public RespuestaTransaccion GetTransfProgramadas(ReqGetTransfProgramadas reqGetTransfProgramadas)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();
            try
            {

                DatosSolicitud ds = new DatosSolicitud();
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
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqGetTransfProgramadas, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqGetTransfProgramadas.str_id_transaccion )!;
            }
            return respuesta;
        }

    }
}
