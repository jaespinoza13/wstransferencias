using System.Reflection;
using System.Text.Json;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Model;
using wsTransferencias.Neg.Utils;

namespace wsTransferencias.Neg
{
    public class BeneficiariosNeg
    {
        private readonly SettingsApi _settingsApi;
        private readonly string str_clase;

        public BeneficiariosNeg ( SettingsApi serviceSettings )
        {
            this._settingsApi = serviceSettings;
            this.str_clase = GetType().FullName!;
            ServiceLogs.Init( _settingsApi );
        }

        public ResBeneficiarios add_beneficiario ( ReqAddBeneficiario req_add_beneficiario, string str_operacion )
        {
            var respuesta = new ResBeneficiarios();
            var res_tran = new RespuestaTransaccion();
            respuesta.LlenarResHeader( req_add_beneficiario );

            ServiceLogs.SaveHeaderLogs( req_add_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {

                string[] lst_palabras_nombre = req_add_beneficiario.str_nombres.Split( " " );

                if(!ValidacionInyeccionSql.validar_palabras_sql( req_add_beneficiario.str_nombres, "str_nombres", str_operacion, req_add_beneficiario, str_clase ))
                {
                    respuesta.str_res_codigo = "1004";
                }
                else if(req_add_beneficiario.str_nombres.Length > Convert.ToInt32( LoadConfigService.FindParametro( "LIMITE_MAXIMO_CARACTERES" ).str_valor_ini ))
                {
                    respuesta.str_res_codigo = "1010";
                }
                else if(lst_palabras_nombre.Length > Convert.ToInt32( LoadConfigService.FindParametro( "LIMITE_MAXIMO_PALABRAS" ).str_valor_ini ))
                {
                    respuesta.str_res_codigo = "1011";
                }
                else
                {
                    res_tran = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_add_beneficiario, req_add_beneficiario.str_tipo_beneficiario ).Result;

                    if(res_tran.codigo.Equals( "1009" ))
                    {
                        res_tran = Utils.Utils.ValidaOtp( _settingsApi, req_add_beneficiario ).Result;

                        if(res_tran.codigo.Equals( "000" ))
                        {
                            res_tran = new BeneficiariosDat( _settingsApi ).add_cuentas_beneficiarios( req_add_beneficiario );
                            respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                        }
                    }
                    else
                    {
                        res_tran = new BeneficiariosDat( _settingsApi ).add_cuentas_beneficiarios( req_add_beneficiario );
                        respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                    }
                }
                respuesta.str_res_codigo = String.IsNullOrEmpty( res_tran.codigo ) ? respuesta.str_res_codigo : res_tran.codigo;
                respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";

                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;

            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }

        public ResBeneficiarios update_beneficiario ( ReqUpdateBeneficiario req_update_beneficiario, string str_operacion )
        {
            var respuesta = new ResBeneficiarios();
            var res_tran = new RespuestaTransaccion();
            respuesta.LlenarResHeader( req_update_beneficiario );

            Utils.ServiceLogs.SaveHeaderLogs( req_update_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                res_tran = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_update_beneficiario, req_update_beneficiario.str_tipo_beneficiario ).Result;
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];

                if(res_tran.codigo.Equals( "1009" ))
                {
                    res_tran = Utils.Utils.ValidaOtp( _settingsApi, req_update_beneficiario ).Result;

                    if(res_tran.codigo.Equals( "000" ))
                    {
                        res_tran = new BeneficiariosDat( _settingsApi ).update_cuentas_beneficiarios( req_update_beneficiario );
                    }
                    respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];
                }
                else if(res_tran.codigo.Equals( "1006" ))
                {
                    res_tran = new BeneficiariosDat( _settingsApi ).update_cuentas_beneficiarios( req_update_beneficiario );
                    respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["str_error"];
                }

                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }

        public ResBeneficiarios delete_beneficiario ( ReqDeleteBeneficiario req_delete_beneficiario, string str_operacion )
        {
            var respuesta = new ResBeneficiarios();
            respuesta.LlenarResHeader( req_delete_beneficiario );
            Utils.ServiceLogs.SaveHeaderLogs( req_delete_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).delete_cuentas_beneficiarios( req_delete_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }


        public ResGetBeneficiario get_beneficiario ( ReqGetBeneficiario req_get_beneficiario, string str_operacion )
        {
            var respuesta = new ResGetBeneficiario();
            respuesta.LlenarResHeader( req_get_beneficiario );
            Utils.ServiceLogs.SaveHeaderLogs( req_get_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).get_datos_beneficiarios( req_get_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

                respuesta.lst_beneficiarios = Utils.Utils.ConvertConjuntoDatosToListClass<Beneficiario>( (ConjuntoDatos) res_tran.cuerpo );
                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;

            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }

        public ResValidaBeneficiario validar_registro_beneficiarios ( ReqValidaBeneficiario req_validar_beneficiarios, string str_operacion )
        {

            var respuesta = new ResValidaBeneficiario();
            respuesta.LlenarResHeader( req_validar_beneficiarios );
            Utils.ServiceLogs.SaveHeaderLogs( req_validar_beneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).validar_registro_beneficiarios( req_validar_beneficiarios );
                var res_tran_otp = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_validar_beneficiarios, req_validar_beneficiarios.str_tipo_beneficiario ).Result;

                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

                switch(res_tran_otp.codigo)
                {
                    case "1009":
                        respuesta.str_res_codigo = res_tran.codigo;
                        respuesta.bl_requiere_otp = true;
                        break;
                    case "1006":
                        respuesta.str_res_codigo = res_tran.codigo;
                        respuesta.bl_requiere_otp = false;
                        break;
                    case "1017":
                        respuesta.str_res_codigo = "001";
                        respuesta.str_res_info_adicional = res_tran_otp.diccionario["str_error"].ToString();
                        break;
                }

                respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";
                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }
        public ResValidaBeneficiario validar_update_beneficiarios ( ReqValidaBeneficiario req_validar_beneficiarios, string str_operacion )
        {
            var respuesta = new ResValidaBeneficiario();
            respuesta.LlenarResHeader( req_validar_beneficiarios );
            Utils.ServiceLogs.SaveHeaderLogs( req_validar_beneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                var res_tran_otp = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_validar_beneficiarios, req_validar_beneficiarios.str_tipo_beneficiario ).Result;
                respuesta.str_res_codigo = "000";

                switch(res_tran_otp.codigo)
                {
                    case "1009":
                        respuesta.bl_requiere_otp = true;
                        break;

                    case "1006":
                        respuesta.bl_requiere_otp = false;
                        break;

                    case "1017":
                        respuesta.str_res_codigo = "001";
                        break;
                }

                respuesta.str_res_info_adicional = res_tran_otp.diccionario["str_error"];
                respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";
                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;

            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }

        public ResCuentasBeneficiario get_ctas_benef_transferencia ( ReqCuentasBeneficiario req_cuentas_beneficiario, string str_operacion )
        {
            var respuesta = new ResCuentasBeneficiario();
            respuesta.LlenarResHeader( req_cuentas_beneficiario );

            Utils.ServiceLogs.SaveHeaderLogs( req_cuentas_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                RespuestaTransaccion res_tran = new BeneficiariosDat( _settingsApi ).get_ctas_benef_transferencia( req_cuentas_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.lst_cuentas_beneficiario = Utils.Utils.ConvertConjuntoDatosToListClass<ResCuentasBeneficiario.CuentasBeneficiario>( (ConjuntoDatos) res_tran.cuerpo );
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( req_cuentas_beneficiario.str_id_transaccion );
            }
        }

        public ResValidaCuentaPagoDirecto valida_cuenta_pago_directo ( ReqValidaCuentaPagoDirecto req_valida_cuenta, string str_operacion )
        {

            var respuesta = new ResValidaCuentaPagoDirecto();
            respuesta.LlenarResHeader( req_valida_cuenta );
            Utils.ServiceLogs.SaveHeaderLogs( req_valida_cuenta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                var res_obtiene_datos = new BeneficiariosDat( _settingsApi ).obtener_datos_pago_directo( req_valida_cuenta );
                respuesta.str_res_codigo = res_obtiene_datos.codigo;

                if(res_obtiene_datos.codigo.Equals( "000" ))
                {

                    var datosValidaCuenta = Utils.Utils.ConvertConjuntoDatosToClass<Transaccion>( (ConjuntoDatos) res_obtiene_datos.cuerpo );

                    datosValidaCuenta!.str_tipo_tran = "CON";
                    datosValidaCuenta.int_secuencial = Convert.ToInt32( DateTime.Now.ToString( "HHmm" ) );
                    datosValidaCuenta.dec_monto_tran = 0;
                    datosValidaCuenta.str_cuenta_receptor = req_valida_cuenta.str_num_cuenta;
                    datosValidaCuenta.str_nom_receptor = String.Empty;
                    datosValidaCuenta.str_observaciones = String.Empty;
                    datosValidaCuenta.int_secuencial_cobis = 0;
                    datosValidaCuenta.str_identificacion_receptor = Convert.ToString( datosValidaCuenta.int_fi_aut );

                    var cabecera = Utils.Utils.llenar_cabecera( req_valida_cuenta );

                    var sol_tran = new SolicitudTransaccion
                    {
                        cabecera = cabecera,
                        cuerpo = datosValidaCuenta
                    };

                    string str_data = JsonSerializer.Serialize( sol_tran );
                    var service = new ServiceHttp<RespuestaTransaccion>();
                    RespuestaTransaccion res_banred = service.PostRestServiceDataAsync( str_data, _settingsApi.servicio_ws_banred, String.Empty, _settingsApi.auth_ws_banred, _settingsApi ).Result;

                    if(res_banred.codigo.Equals( "000" ) || res_banred.codigo.Equals( "0000" ))
                    {

                        respuesta.str_nombre = (string) res_banred.cuerpo;
                    }
                    else
                    {
                        if(_settingsApi.pago_directo_pruebas == "1")
                        {
                            res_banred.codigo = "000";
                            //Solo para pruebas
                            respuesta.str_nombre = "USUARIO MEGONLINE";
                            respuesta.str_res_info_adicional = "TRANSACCIÓN EXITOSA";
                        }
                        else
                        {
                            //La cuenta no se validó en pago directo
                            res_banred.codigo = "5000"; //"1012"
                            respuesta.str_res_info_adicional = _settingsApi.msj_error_validacion;
                        }
                    }
                    respuesta.str_res_codigo = res_banred.codigo;
                    respuesta.str_res_estado_transaccion = res_banred.codigo.Equals( "000" ) ? "OK" : "ERR";

                }
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }

        public ResValidaBeneficiarioCtasMego validar_benef_otras_ctas_mego ( ReqValidaBeneficiario req_validar_beneficiarios, string str_operacion )
        {

            var respuesta = new ResValidaBeneficiarioCtasMego();
            respuesta.LlenarResHeader( req_validar_beneficiarios );
            Utils.ServiceLogs.SaveHeaderLogs( req_validar_beneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).validar_benef_otras_ctas_mego( req_validar_beneficiarios );

                if(res_tran.codigo.Equals( "000" ))
                {
                    respuesta.lst_beneficiario = Utils.Utils.ConvertConjuntoDatosToListClass<Beneficiario>( (ConjuntoDatos) res_tran.cuerpo );
                }


                var res_tran_otp = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_validar_beneficiarios, req_validar_beneficiarios.str_tipo_beneficiario ).Result;

                switch(res_tran_otp.codigo)
                {
                    case "1009":
                        respuesta.str_res_codigo = res_tran.codigo;
                        respuesta.bl_requiere_otp = true;
                        respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                        break;
                    case "1006":
                        respuesta.str_res_codigo = res_tran.codigo;
                        respuesta.bl_requiere_otp = false;
                        respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                        break;
                    case "1017":
                        respuesta.str_res_codigo = "001";
                        respuesta.str_res_info_adicional = res_tran_otp.diccionario["str_error"].ToString();
                        break;
                }

                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                return respuesta;
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw new Exception( respuesta.str_id_transaccion );
            }
        }
    }
}