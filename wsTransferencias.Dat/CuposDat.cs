using AccesoDatosGrpcAse.Neg;
using Grpc.Net.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Dto;
using wsTransferencias.Log;
using wsTransferencias.Model;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace wsTransferencias.Dat
{
    public class CuposDat
    {
        private InfoLog infoLog;
        private readonly SettingsApi _settings;
        private readonly DALClient objClienteDal;
        private readonly string str_ruta;
        private const string str_salida_error = "e:< ";

        public CuposDat ( SettingsApi serviceSettings)
        {
            _settings = serviceSettings;
            
            this.str_ruta = serviceSettings.path_logs_transferencias;

            infoLog.str_clase = GetType().FullName;
            infoLog.str_fecha = DateTime.Now;

            var httpHandler = new HttpClientHandler();
            var canal = GrpcChannel.ForAddress(serviceSettings.servicio_grpc_sybase, new GrpcChannelOptions { HttpHandler = httpHandler });
            objClienteDal = new DALClient(canal);
        }

        public RespuestaTransaccion set_cupos ( ReqSetCupos req_get_cupos)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
               
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_config_servicio", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.int_id_config_servicio.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.int_ente.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_num_acumula", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_num_acumula.ToString() });                
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_cupo", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.int_id_cupo.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@dcm_monto", TipoDato = TipoDato.Money, ObjValue = req_get_cupos.dcm_monto.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_frecuencia", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.int_frecuencia.ToString() });


                //Variables de auditoria
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_id_transaccion.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.str_id_sistema });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_login.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.str_id_perfil.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.str_id_oficina.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_nemonico_canal.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_ip_dispositivo.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_sesion.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_mac_dispositivo.ToString() });


                ds.ListaPSalida.Add(new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar });
                ds.ListaPSalida.Add(new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer });

                ds.NombreSP = "get_cupos_socios_v2";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet(ds);
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add(item);
                var str_codigo = lst_valores.Find(x => x.StrNameParameter == "@int_o_error_cod")!.ObjValue;
                var str_error = lst_valores.Find(x => x.StrNameParameter == "@str_o_error")!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft(3, '0');
                respuesta.cuerpo = Funciones.ObtenerDatos(resultado);
                respuesta.diccionario.Add("str_error", str_error.ToString());

            }
            catch (Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add("str_error", exception.ToString());

                infoLog.str_id_transaccion = req_get_cupos.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = req_get_cupos.str_id_servicio;
                LogServicios.RegistrarTramas(str_salida_error, infoLog, str_ruta);
                throw;
            }
            return respuesta;
        }   public RespuestaTransaccion get_cupos(ReqGetCupos req_get_cupos)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {
               
                DatosSolicitud ds = new DatosSolicitud();

                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_config_servicio", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.int_id_config_servicio.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_ente", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.int_ente.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_num_acumula", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_num_acumula.ToString() });


                //Variables de auditoria
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_id_transaccion", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_id_transaccion.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_id_sistema", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.str_id_sistema });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_login", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_login.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_id_perfil", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.str_id_perfil.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@int_id_oficina", TipoDato = TipoDato.Integer, ObjValue = req_get_cupos.str_id_oficina.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_nemonico_canal", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_nemonico_canal.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_ip_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_ip_dispositivo.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_sesion", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_sesion.ToString() });
                ds.ListaPEntrada.Add(new ParametroEntrada { StrNameParameter = "@str_mac_dispositivo", TipoDato = TipoDato.VarChar, ObjValue = req_get_cupos.str_mac_dispositivo.ToString() });


                ds.ListaPSalida.Add(new ParametroSalida { StrNameParameter = "@str_o_error", TipoDato = TipoDato.VarChar });
                ds.ListaPSalida.Add(new ParametroSalida { StrNameParameter = "@int_o_error_cod", TipoDato = TipoDato.Integer });

                ds.NombreSP = "get_cupos_socios_v2";
                ds.NombreBD = _settings.BD_megservicios;

                var resultado = objClienteDal.ExecuteDataSet(ds);
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add(item);
                var str_codigo = lst_valores.Find(x => x.StrNameParameter == "@int_o_error_cod")!.ObjValue;
                var str_error = lst_valores.Find(x => x.StrNameParameter == "@str_o_error")!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft(3, '0');
                respuesta.cuerpo = Funciones.ObtenerDatos(resultado);
                respuesta.diccionario.Add("str_error", str_error.ToString());

            }
            catch (Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add("str_error", exception.ToString());

                infoLog.str_id_transaccion = req_get_cupos.str_id_transaccion;
                infoLog.str_tipo = str_salida_error;
                infoLog.str_objeto = exception;
                infoLog.str_metodo = MethodBase.GetCurrentMethod()!.Name;
                infoLog.str_operacion = req_get_cupos.str_id_servicio;
                LogServicios.RegistrarTramas(str_salida_error, infoLog, str_ruta);
                throw;
            }
            return respuesta;
        }
      

    }
}
