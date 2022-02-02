
using AccesoDatosGrpcAse.Neg;
using Grpc.Net.Client;
using System.Reflection;
using wsTransferencias.Dto;
using wsTransferencias.Log;
using wsTransferencias.Model;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace wsTransferencias.Dat
{
    public class ParametrosDat
    {

        private InfoLog infoLog;
        private readonly DALClient objClienteDal;
        private readonly SettingsApi _settings;
        private readonly string str_ruta;
        private const string str_salida_error = "e:< ";

        public ParametrosDat ( SettingsApi settings  )
        {
            _settings = settings;
            this.str_ruta = settings.path_logs_transferencias;
            infoLog.str_clase = GetType().FullName;

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
                //ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = Convert.ToInt32( req_get_config_token.str_id_perfil ).ToString() } );
                //ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = Convert.ToInt32( req_get_config_token.str_id_oficina ).ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_nemonico_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_ip_dispositivo.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_session ", TipoDato = TipoDato.VarChar, ObjValue = req_get_parametros.str_sesion.ToString() } );
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

                infoLog.str_id_transaccion = req_get_parametros.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = req_get_parametros.str_id_servicio;
                LogServicios.RegistrarTramas( str_salida_error, infoLog, str_ruta );
            }
            return respuesta;
        }


    }
}
