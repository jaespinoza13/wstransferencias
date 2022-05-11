using AccesoDatosGrpcAse.Neg;
using Grpc.Net.Client;
using System.Reflection;
using wsTransferencias.Dto;
using wsTransferencias.Model;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace wsTransferencias.Dat
{
    public class ParametrosDat
    {

        private readonly DALClient objClienteDal;
        private readonly SettingsApi _settings;
        private readonly string str_clase;

        public ParametrosDat ( SettingsApi settings )
        {
            _settings = settings;
            this.str_clase = GetType().FullName!;

            var httpHandler = new HttpClientHandler();
            var canal = GrpcChannel.ForAddress( settings.servicio_grpc_sybase, new GrpcChannelOptions { HttpHandler = httpHandler } );
            objClienteDal = new DALClient( canal );
        }

        public RespuestaTransaccion get_parametros ( ReqGetParametros req_get_parametros )
        {
            var respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nombre", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_nombre.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_nemonico.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_front", TipoDato = TipoDato.Integer, ObjValue = req_get_parametros.int_front.ToString() } );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_id_transaccion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = Convert.ToInt32( req_get_parametros.str_id_sistema ).ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_mac_dispositivo.ToString() } );


                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_parametros";
                ds.NombreBD = _settings.BD_megonline;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_get_parametros, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception(req_get_parametros.str_id_transaccion)!;
            }
            return respuesta;
        }


        public RespuestaTransaccion get_datos_otp ( dynamic req_get_datos )
        {
            var respuesta = new RespuestaTransaccion();

            try
            {
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_get_datos.str_ente } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_sistema", TipoDato = TipoDato.Integer, ObjValue = req_get_datos.str_id_sistema } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_canal", TipoDato = TipoDato.VarChar, ObjValue = req_get_datos.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_get_datos.str_login.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_equipo", TipoDato = TipoDato.VarChar, ObjValue = req_get_datos.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_get_datos.str_sesion.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_mac", TipoDato = TipoDato.VarChar, ObjValue = req_get_datos.str_mac_dispositivo.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error_cod", TipoDato = TipoDato.Integer } );
                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@o_error", TipoDato = TipoDato.VarChar } );

                ds.NombreSP = "get_datos_otp_gen";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach(var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@o_error" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
            }
            catch(Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                Funciones.SaveExcepcionDataBaseSybase( _settings, req_get_datos, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception(req_get_datos.str_id_transaccion)!;
            }
            return respuesta;
        }

    }
}
