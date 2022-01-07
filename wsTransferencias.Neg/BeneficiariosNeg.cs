using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Log;
using wsTransferencias.Model;

namespace wsTransferencias.Neg
{
    public class BeneficiariosNeg
    {
        private readonly ServiceSettings _serviceSettings;
        private readonly string str_clase;

        public BeneficiariosNeg(ServiceSettings serviceSettings)
        {
            _serviceSettings = serviceSettings;
            this.str_clase = GetType().FullName!;
            new Utils.ServiceLogs(_serviceSettings);
        }

        public ResBeneficiarios procesar_datos_beneficiarios(ReqBeneficiarios req_beneficiarios, string str_operacion)
        {
            //var respuesta = new ResBeneficiarios();
            //respuesta.LlenarResHeader(req_beneficiarios);
            //infoLog.str_tipo = str_entrada;
            //infoLog.str_operacion = str_operacion;
            //infoLog.str_objeto = req_beneficiarios;
            //infoLog.str_metodo = "procesar_datos_beneficiarios";
            //LogServicios.RegistrarTramas(str_entrada, infoLog, str_ruta);


            var respuesta = new ResBeneficiarios();
            respuesta.LlenarResHeader(req_beneficiarios);
            req_beneficiarios.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqBeneficiarios>(req_beneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            respuesta.str_id_transaccion = req_beneficiarios.str_id_transaccion;

            try
            {

                var res_tran = new RespuestaTransaccion();


                if (req_beneficiarios.str_operacion == _serviceSettings.add_beneficiarios)
                {
                    //infoLog.str_tipo = str_entrada;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "add_cuentas_beneficiarios";
                    //LogServicios.RegistrarTramas(str_entrada, infoLog, str_ruta);
                          
                    res_tran = new BeneficiariosDat(_serviceSettings).add_cuentas_beneficiarios(req_beneficiarios);

                    //infoLog.str_tipo = str_salida;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "add_cuentas_beneficiarios";
                    //LogServicios.RegistrarTramas(str_salida, infoLog, str_ruta);
                }
                else if (req_beneficiarios.str_operacion == _serviceSettings.update_beneficiarios)
                {

                    //infoLog.str_tipo = str_entrada;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "update_cuentas_beneficiarios";
                    //LogServicios.RegistrarTramas(str_entrada, infoLog, str_ruta);
                  
                    res_tran = new BeneficiariosDat(_serviceSettings).update_cuentas_beneficiarios(req_beneficiarios);                    
                   
                    //infoLog.str_tipo = str_salida;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "update_cuentas_beneficiarios";
                    //LogServicios.RegistrarTramas(str_salida, infoLog, str_ruta);

                }
                else if (req_beneficiarios.str_operacion == _serviceSettings.delete_beneficiarios)
                {                    
                    //infoLog.str_tipo = str_salida;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "delete_cuentas_beneficiarios";
                    //LogServicios.RegistrarTramas(str_entrada, infoLog, str_ruta);

                    res_tran = new BeneficiariosDat(_serviceSettings).delete_cuentas_beneficiarios(req_beneficiarios); 
                    
                    //infoLog.str_tipo = str_entrada;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "delete_cuentas_beneficiarios";
                    //LogServicios.RegistrarTramas(str_salida, infoLog, str_ruta);


                }
                else if (req_beneficiarios.str_operacion == _serviceSettings.listado_beneficiarios)
                {
                    //infoLog.str_tipo = str_salida;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "get_datos_beneficiarios";
                    //LogServicios.RegistrarTramas(str_entrada, infoLog, str_ruta); 
                    
                    res_tran = new BeneficiariosDat(_serviceSettings).get_datos_beneficiarios(req_beneficiarios); 
                    
                    //infoLog.str_tipo = str_entrada;
                    //infoLog.str_operacion = str_operacion;
                    //infoLog.str_objeto = req_beneficiarios;
                    //infoLog.str_metodo = "get_datos_beneficiarios";
                    //LogServicios.RegistrarTramas(str_salida, infoLog, str_ruta);
                                        
                    //ConjuntoDatos ds_posicion_consolidada = (ConjuntoDatos)res_tran.cuerpo;

                    //List<Beneficiario> lst_beneficiarios = new List<Beneficiario>();

                    //foreach (var item in ds_posicion_consolidada.lst_tablas[0].lst_filas)
                    //{
                    //    Beneficiario obj = (Beneficiario)Converting.MapDictToObj(item.nombre_valor, typeof(Beneficiario));
                    //    lst_beneficiarios.Add(obj);
                    //}

                    //respuesta = Utils.Utils.ConvertConjuntoDatosToListClass<ResBeneficiarios>((ConjuntoDatos)res_tran.cuerpo);

                    respuesta.lst_beneficiarios = Utils.Utils.ConvertConjuntoDatosToListClass<Beneficiario>((ConjuntoDatos)res_tran.cuerpo);
                }


                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals("000") ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch (Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }

        public ResBeneficiarios validar_registro_beneficiarios(ReqBeneficiarios validar_beneficiarios, string str_operacion)
        {
            //var respuesta = new ResBeneficiarios();
            //respuesta.LlenarResHeader(validar_beneficiarios);
            //infoLog.str_tipo = str_entrada;
            //infoLog.str_operacion = str_operacion;
            //infoLog.str_objeto = validar_beneficiarios;
            //infoLog.str_metodo = "validar_registro_beneficiarios";
            //LogServicios.RegistrarTramas(str_entrada, infoLog, str_ruta);

            var respuesta = new ResBeneficiarios();
            respuesta.LlenarResHeader(validar_beneficiarios);
            validar_beneficiarios.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqBeneficiarios>(validar_beneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            respuesta.str_id_transaccion = validar_beneficiarios.str_id_transaccion;


            try
            {
                              
                var res_tran = new BeneficiariosDat(_serviceSettings).validar_registro_beneficiarios(validar_beneficiarios);

                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals("000") ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch (Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }


        public ResCuentasBeneficiario get_ctas_beneficiario(ReqCuentasBeneficiario req_cuentas_beneficiario, string str_operacion)
        {
            var respuesta = new ResCuentasBeneficiario();
            respuesta.LlenarResHeader(req_cuentas_beneficiario);
            req_cuentas_beneficiario.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqCuentasBeneficiario>(req_cuentas_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            respuesta.str_id_transaccion = req_cuentas_beneficiario.str_id_transaccion;

            try
            {

                RespuestaTransaccion res_tran = new BeneficiariosDat(_serviceSettings).get_ctas_beneficiario(req_cuentas_beneficiario);
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals("000") ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.lst_cuentas_beneficiario = Utils.Utils.ConvertConjuntoDatosToListClass<ResCuentasBeneficiario.CuentasBeneficiario>((ConjuntoDatos)res_tran.cuerpo);
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch (Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception);
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs(respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase);
            return respuesta;
        }


    }
}
