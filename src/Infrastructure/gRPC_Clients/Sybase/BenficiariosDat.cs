using AccesoDatosGrpcAse.Neg;
using Application.Beneficiarios;
using Application.Common.Interfaces;
using Application.Common.Models;
using Grpc.Net.Client;
using Infrastructure.Common.Funciones;
using Microsoft.Extensions.Options;
using System.Reflection;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace Infrastructure.gRPC_Clients.Sybase
{
    internal class BenficiariosDat : IBeneficiariosDat
    {
        private readonly ApiSettings _settings;
        private readonly DALClient _objClienteDal;
        private readonly ILogs _logsService;
        private readonly string str_clase;

        public BenficiariosDat(IOptionsMonitor<ApiSettings> options, ILogs logsService, DALClient objClienteDal)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!; 

            _objClienteDal = objClienteDal;

        }


        public async Task<RespuestaTransaccion> GetDatosBeneficiarios(ReqGetBeneficiarios reqGetBeneficiarios)
        {
            var respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqGetBeneficiarios );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqGetBeneficiarios.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nem_tipo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = reqGetBeneficiarios.str_tipo_beneficiario } );


                ds.NombreSP = "get_datos_beneficiarios";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = await _objClienteDal.ExecuteDataSetAsync( ds );
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
                _logsService.SaveExcepcionDataBaseSybase( reqGetBeneficiarios, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqGetBeneficiarios.str_id_transaccion )!;
            }
            return respuesta;
        }
        public RespuestaTransaccion AddBeneficiario(ReqAddBeneficiario reqAddBeneficiario)
        {
            var respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqAddBeneficiario );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_ifi", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_codigo_ifi } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_producto", TipoDato = TipoDato.Integer, ObjValue = reqAddBeneficiario.int_tipo_producto.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_num_cta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_documento", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_num_documento } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nombres", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_nombres } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_email", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_email } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_alias_cta", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_alias_cta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = reqAddBeneficiario.str_tipo_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqAddBeneficiario.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_favorito", TipoDato = TipoDato.Integer, ObjValue = reqAddBeneficiario.int_favorito.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_tarjeta_cred", TipoDato = TipoDato.Integer, ObjValue = reqAddBeneficiario.int_tipo_tarjeta.ToString() } );

                ds.NombreSP = "add_cuentas_beneficiarios";
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
                _logsService.SaveExcepcionDataBaseSybase( reqAddBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqAddBeneficiario.str_id_transaccion )!;
            }
            return respuesta;
        }
        public RespuestaTransaccion UpdateCuentaBeneficiario(ReqUpdateBeneficiario reqUpdateBeneficiario)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqUpdateBeneficiario );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_ifi", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_codigo_ifi } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_producto", TipoDato = TipoDato.Integer, ObjValue = reqUpdateBeneficiario.int_tipo_producto.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_num_cta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_documento", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_num_documento } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nombres", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_nombres } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_email", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_email } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_alias_cta", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_alias_cta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_tipo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = reqUpdateBeneficiario.str_tipo_beneficiario } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqUpdateBeneficiario.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer, ObjValue = reqUpdateBeneficiario.str_id } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_favorito", TipoDato = TipoDato.Integer, ObjValue = reqUpdateBeneficiario.int_favorito.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_tarjeta_cred", TipoDato = TipoDato.Integer, ObjValue = reqUpdateBeneficiario.int_tipo_tarjeta.ToString() } );

                ds.NombreSP = "update_cuentas_beneficiarios";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteNonQuery( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqUpdateBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqUpdateBeneficiario.str_id_transaccion )!;

            }
            return respuesta;
        } 
        public RespuestaTransaccion DeleteCuentaBeneficiario(ReqDeleteBeneficiario reqDeleteBeneficiario)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqDeleteBeneficiario );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer, ObjValue = reqDeleteBeneficiario.str_id } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqDeleteBeneficiario.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_motivo_elimina", TipoDato = TipoDato.VarChar, ObjValue = reqDeleteBeneficiario.str_motivo_elimina } );


                ds.NombreSP = "delete_cuentas_beneficiarios";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteNonQuery( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqDeleteBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqDeleteBeneficiario.str_id_transaccion )!;
            }
            return respuesta;
        }
        public async Task<RespuestaTransaccion> GetCuentasBeneciairioTrans(ReqGetCuentasBeneficiario reqGetCuentasBeneficiario)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqGetCuentasBeneficiario );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqGetCuentasBeneficiario.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nem_tipo_beneficiario", TipoDato = TipoDato.VarChar, ObjValue = reqGetCuentasBeneficiario.str_tipo_beneficiario.ToString() } );


                ds.NombreSP = "get_ctas_benef_transferencia";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = await _objClienteDal.ExecuteDataSetAsync( ds );
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
                _logsService.SaveExcepcionDataBaseSybase( reqGetCuentasBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqGetCuentasBeneficiario.str_id_transaccion )!;
            }
            return respuesta;
        }
        public async Task<RespuestaTransaccion> ValidaRegistrBeneficiario(ReqValidaRegistroBeneficiario reqValidaRegistroBeneficiario)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqValidaRegistroBeneficiario );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_codigo_ifi", TipoDato = TipoDato.VarChar, ObjValue = reqValidaRegistroBeneficiario.str_codigo_ifi } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_producto", TipoDato = TipoDato.Integer, ObjValue = reqValidaRegistroBeneficiario.int_tipo_producto.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = reqValidaRegistroBeneficiario.str_num_cta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_documento", TipoDato = TipoDato.VarChar, ObjValue = reqValidaRegistroBeneficiario.str_num_documento } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqValidaRegistroBeneficiario.str_ente } );


                ds.NombreSP = "validar_registro_beneficiario";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = await _objClienteDal.ExecuteNonQueryAsync( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqValidaRegistroBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqValidaRegistroBeneficiario.str_id_transaccion )!;
            }
            return respuesta;
        }
        public async Task<RespuestaTransaccion> ValidaOtrasCuentasBeneficiario(ReqValidaOtrasCuentasBeneficiario reqValidaOtrasCuentasBeneficiario)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta", TipoDato = TipoDato.VarChar, ObjValue = reqValidaOtrasCuentasBeneficiario.str_num_cta } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqValidaOtrasCuentasBeneficiario.str_ente } );

                //Variables de auditoria
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_sistema", TipoDato = TipoDato.Integer, ObjValue = reqValidaOtrasCuentasBeneficiario.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = reqValidaOtrasCuentasBeneficiario.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = reqValidaOtrasCuentasBeneficiario.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_oficina", TipoDato = TipoDato.Integer, ObjValue = reqValidaOtrasCuentasBeneficiario.str_id_oficina.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_canal", TipoDato = TipoDato.VarChar, ObjValue = reqValidaOtrasCuentasBeneficiario.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_equipo", TipoDato = TipoDato.VarChar, ObjValue = reqValidaOtrasCuentasBeneficiario.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac", TipoDato = TipoDato.VarChar, ObjValue = reqValidaOtrasCuentasBeneficiario.str_mac_dispositivo.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "validar_benef_otras_ctas_mego";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = await _objClienteDal.ExecuteDataSetAsync( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqValidaOtrasCuentasBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqValidaOtrasCuentasBeneficiario.str_id_transaccion )!;
            }
            return respuesta;
        }
        public RespuestaTransaccion GetDatosPagoDirecto(ReqValidaCuentaPagoDirecto reqValidaCuentaPagoDirecto)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqValidaCuentaPagoDirecto );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = reqValidaCuentaPagoDirecto.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_cuenta_origen", TipoDato = TipoDato.Integer, ObjValue = 0.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_cuenta_destino", TipoDato = TipoDato.Integer, ObjValue = 0.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_cod_ifi", TipoDato = TipoDato.VarChar, ObjValue = reqValidaCuentaPagoDirecto.str_codigo_ifi } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_tipo_cuenta", TipoDato = TipoDato.Integer, ObjValue = reqValidaCuentaPagoDirecto.int_tipo_cuenta.ToString() } );

                ds.NombreSP = "obtener_datos_pago_directo";
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
                _logsService.SaveExcepcionDataBaseSybase( reqValidaCuentaPagoDirecto, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqValidaCuentaPagoDirecto.str_id_transaccion )!;
            }
            return respuesta;
        }
        public RespuestaTransaccion UpdateFavoritoBeneficiario(ReqUpdateFavoritoBeneficiario reqUpdateFavoritoBeneficiario)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenarDatosAuditoriaSalida( ds, reqUpdateFavoritoBeneficiario );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente_registra", TipoDato = TipoDato.Integer, ObjValue = reqUpdateFavoritoBeneficiario.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id", TipoDato = TipoDato.Integer, ObjValue = reqUpdateFavoritoBeneficiario.str_id } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_favorito", TipoDato = TipoDato.Integer, ObjValue = reqUpdateFavoritoBeneficiario.int_favorito.ToString() } );

                ds.NombreSP = "update_favorito_beneficiario";
                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = _objClienteDal.ExecuteNonQuery( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = resultado.NumAfectados;
                respuesta.diccionario.Add( "str_error", str_error.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "003";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqUpdateFavoritoBeneficiario, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new ArgumentException( reqUpdateFavoritoBeneficiario.str_id_transaccion )!;

            }
            return respuesta;
        }

         
    }
}
