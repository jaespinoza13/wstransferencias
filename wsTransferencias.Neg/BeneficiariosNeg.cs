using System.Reflection;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Log;
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
            respuesta.LlenarResHeader( req_add_beneficiario );
            req_add_beneficiario.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqAddBeneficiario>( req_add_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_add_beneficiario.str_id_transaccion;

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
                    RespuestaTransaccion res_tran = new BeneficiariosDat( _settingsApi ).add_cuentas_beneficiarios( req_add_beneficiario );
                    respuesta.str_res_codigo = res_tran.codigo;
                    respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                }

                respuesta.str_res_estado_transaccion = respuesta.str_res_codigo.Equals( "000" ) ? "OK" : "ERR";
                Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
                respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
                return respuesta;
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }
        }

        public ResBeneficiarios update_beneficiario ( ReqUpdateBeneficiario req_update_beneficiario, string str_operacion )
        {
            var respuesta = new ResBeneficiarios();
            respuesta.LlenarResHeader( req_update_beneficiario );
            req_update_beneficiario.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqUpdateBeneficiario>( req_update_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_update_beneficiario.str_id_transaccion;

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).update_cuentas_beneficiarios( req_update_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;
        }


        public ResBeneficiarios delete_beneficiario ( ReqDeleteBeneficiario req_delete_beneficiario, string str_operacion )
        {
            var respuesta = new ResBeneficiarios();
            respuesta.LlenarResHeader( req_delete_beneficiario );
            req_delete_beneficiario.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqDeleteBeneficiario>( req_delete_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_delete_beneficiario.str_id_transaccion;

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).delete_cuentas_beneficiarios( req_delete_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;
        }


        public ResGetBeneficiario get_beneficiario ( ReqGetBeneficiario req_get_beneficiario, string str_operacion )
        {
            var respuesta = new ResGetBeneficiario();
            respuesta.LlenarResHeader( req_get_beneficiario );
            req_get_beneficiario.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqGetBeneficiario>( req_get_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_get_beneficiario.str_id_transaccion;

            try
            {


                var res_tran = new BeneficiariosDat( _settingsApi ).get_datos_beneficiarios( req_get_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
                respuesta.lst_beneficiarios = Utils.Utils.ConvertConjuntoDatosToListClass<ResGetBeneficiario.Beneficiario>( (ConjuntoDatos) res_tran.cuerpo );
            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;
        }


        public ResValidaBeneficiario validar_registro_beneficiarios ( ReqValidaBeneficiario req_validar_beneficiarios, string str_operacion )
        {

            var respuesta = new ResValidaBeneficiario();
            respuesta.LlenarResHeader( req_validar_beneficiarios );
            req_validar_beneficiarios.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqValidaBeneficiario>( req_validar_beneficiarios, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_validar_beneficiarios.str_id_transaccion;

            try
            {
                var res_tran = new BeneficiariosDat( _settingsApi ).validar_registro_beneficiarios( req_validar_beneficiarios );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";

                respuesta.bl_requiere_otp = Utils.Utils.ValidaRequiereOtp( _settingsApi, req_validar_beneficiarios, str_operacion ).Result.codigo.Equals( "1009" );
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;
        }


        public ResCuentasBeneficiario get_cuentas_beneficiario ( ReqCuentasBeneficiario req_cuentas_beneficiario, string str_operacion )
        {
            var respuesta = new ResCuentasBeneficiario();
            respuesta.LlenarResHeader( req_cuentas_beneficiario );
            req_cuentas_beneficiario.str_id_transaccion = Utils.ServiceLogs.SaveHeaderLogs<ReqCuentasBeneficiario>( req_cuentas_beneficiario, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_cuentas_beneficiario.str_id_transaccion;

            try
            {

                RespuestaTransaccion res_tran = new BeneficiariosDat( _settingsApi ).get_ctas_beneficiario( req_cuentas_beneficiario );
                respuesta.str_res_estado_transaccion = res_tran.codigo.Equals( "000" ) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.lst_cuentas_beneficiario = Utils.Utils.ConvertConjuntoDatosToListClass<ResCuentasBeneficiario.CuentasBeneficiario>( (ConjuntoDatos) res_tran.cuerpo );
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();

            }
            catch(Exception exception)
            {
                Utils.ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            Utils.ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_res_info_adicional = LoadConfigService.FindErrorCode( respuesta.str_res_codigo ).str_valor_fin;
            return respuesta;
        }

    }
}
