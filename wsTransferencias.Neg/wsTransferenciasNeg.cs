using System.Text.Json;
using System.Threading.Tasks;
using wsTransferencias.Dto;
using wsTransferencias.Model;

namespace wsTransferencias.Neg
{
    public class WsTransferenciasNeg
    {
        private readonly SettingsApi _settingsApi;
        public WsTransferenciasNeg ( SettingsApi settings )
        {
            this._settingsApi = settings;
        }
        public object procesarSolicitud ( Object sol_tran, string str_operacion )
        {
            Object respuesta = new object();
            var validacion_token = new ResComun();

            try
            {
                switch(str_operacion)
                {
                    case "ADD_BENEFICIARIOS":
                    case "GET_BENEFICIARIOS":
                    case "UPDATE_BENEFICIARIOS":
                    case "DELETE_BENEFICIARIOS":
                    case "GET_CUENTAS_BENEFICIARIO":
                    case "VALIDAR_REGISTRO_BENEFICIARIOS":
                        var str_beneficiarios = JsonSerializer.Serialize( sol_tran );
                        validacion_token = Utils.Utils.ValidarToken( _settingsApi, str_beneficiarios ).Result;
                        respuesta = validacion_token.str_res_codigo.Equals( "000" ) ? ProcesarSolicitudBeneficiarios( str_beneficiarios, str_operacion ) : validacion_token;
                        break;

                    case "VALIDA_TRANSFERENCIA":
                        string str_valida_transferencia = JsonSerializer.Serialize( sol_tran );
                        validacion_token = Utils.Utils.ValidarToken( _settingsApi, str_valida_transferencia ).Result;
                        respuesta = validacion_token.str_res_codigo.Equals( "000" ) ? ProcesarSolicitudValidacionTransferencias( str_valida_transferencia, str_operacion ) : validacion_token;
                        break;

                    case "ADD_TRANSFERENCIA":
                        string str_add_transferencia = JsonSerializer.Serialize( sol_tran );
                        validacion_token = Utils.Utils.ValidarToken( _settingsApi, str_add_transferencia ).Result;
                        respuesta = validacion_token.str_res_codigo.Equals( "000" ) ? ProcesarSolicitudRealizaTransferencias( str_add_transferencia, str_operacion ) : validacion_token;
                        break;

                    case "GET_CONSULTA_TRANSFERENCIAS":
                        string str_get_parametros = JsonSerializer.Serialize( sol_tran );
                        var req_get_parametros = JsonSerializer.Deserialize<ReqGetTransferencias>( str_get_parametros )!;
                        respuesta = new TransferenciasNeg( _settingsApi ).get_consulta_transferencias( req_get_parametros, str_operacion );
                        break;
                    case "GET_CUPOS_SOCIOS":
                    case "SET_CUPOS_SOCIOS":
                        validacion_token = Utils.Utils.ValidarToken( _settingsApi, JsonSerializer.Serialize( sol_tran ) ).Result;
                        respuesta = validacion_token.str_res_codigo.Equals( "000" ) ? ProcesarSolicitudCupos( JsonSerializer.Serialize( sol_tran ), str_operacion ) : validacion_token;

                        break;

                    default:
                        break;

                }
            }
            catch(Exception)
            {
                ResException resException = new ResException()
                {
                    str_res_estado_transaccion = "ERR",
                    str_res_codigo = "001",
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                return resException;
            }

            return respuesta;
        }


        public Object ProcesarSolicitudBeneficiarios ( string str_sol_tran, string str_operacion )
        {
            Object respuesta = new();
            try
            {
                switch(str_operacion)
                {

                    case "ADD_BENEFICIARIOS":
                        var req_add_beneficiario = JsonSerializer.Deserialize<ReqAddBeneficiario>( str_sol_tran );
                        respuesta = new BeneficiariosNeg( _settingsApi ).add_beneficiario( req_add_beneficiario!, str_operacion );
                        break;

                    case "UPDATE_BENEFICIARIOS":
                        var req_update_beneficiario = JsonSerializer.Deserialize<ReqUpdateBeneficiario>( str_sol_tran );
                        respuesta = new BeneficiariosNeg( _settingsApi ).update_beneficiario( req_update_beneficiario!, str_operacion );
                        break;

                    case "DELETE_BENEFICIARIOS":
                        var req_delete_beneficiario = JsonSerializer.Deserialize<ReqDeleteBeneficiario>( str_sol_tran );
                        respuesta = new BeneficiariosNeg( _settingsApi ).delete_beneficiario( req_delete_beneficiario!, str_operacion );
                        break;

                    case "GET_BENEFICIARIOS":
                        var req_get_beneficiario = JsonSerializer.Deserialize<ReqGetBeneficiario>( str_sol_tran );
                        respuesta = new BeneficiariosNeg( _settingsApi ).get_beneficiario( req_get_beneficiario!, str_operacion );
                        break;

                    case "GET_CUENTAS_BENEFICIARIO":
                        var get_ctas_beneficiario = JsonSerializer.Deserialize<ReqCuentasBeneficiario>( str_sol_tran );
                        respuesta = new BeneficiariosNeg( _settingsApi ).get_cuentas_beneficiario( get_ctas_beneficiario!, str_operacion );
                        break;

                    case "VALIDAR_REGISTRO_BENEFICIARIOS":
                        var valida_beneficiarios = JsonSerializer.Deserialize<ReqValidaBeneficiario>( str_sol_tran );
                        respuesta = new BeneficiariosNeg( _settingsApi ).validar_registro_beneficiarios( valida_beneficiarios!, str_operacion );
                        break;
                }
            }
            catch(Exception)
            {
                ResException resException = new ResException()
                {
                    str_res_estado_transaccion = "ERR",
                    str_res_codigo = "001",
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                return resException;
            }

            return respuesta;
        }

        public Object ProcesarSolicitudCupos ( string str_cupos, string str_operacion )
        {
            Object respuesta = new();
            try
            {

                switch(str_operacion)
                {
                    case "GET_CUPOS_SOCIOS":
                        var get_cupos = JsonSerializer.Deserialize<ReqGetCupos>( str_cupos );
                        respuesta = new CuposNeg( _settingsApi ).get_cupos_socios( get_cupos!, str_operacion );
                        break;

                    case "SET_CUPOS_SOCIOS":
                        //respuesta = new ResTransferencia();
                       // respuesta = new CuposNeg( _settingsApi ).set_cupos_socios( req_valida_transferencia!, str_operacion );
                        break;
                }

            }
            catch(Exception)
            {
                ResException resException = new ResException()
                {
                    str_res_estado_transaccion = "ERR",
                    str_res_codigo = "001",
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                return resException;
            }

            return respuesta;
        }   public Object ProcesarSolicitudValidacionTransferencias ( string str_va_transferencia, string str_operacion )
        {
            Object respuesta = new();
            try
            {
                var req_valida_transferencia = JsonSerializer.Deserialize<ReqValidacionTransferencia>( str_va_transferencia );

                switch(req_valida_transferencia!.str_nemonico_tipo_transferencia)
                {
                    case "TRN_MIS_CUENTAS_COOPMEGO":
                    case "TRN_OTRAS_CUENTAS_COOPMEGO":
                        //respuesta = new ResValidacionTransferencias();
                        respuesta = new TransferenciasNeg( _settingsApi ).validar_transfer_interna( req_valida_transferencia!, str_operacion );
                        break;

                    case "TRN_EXTERNAS":
                        //respuesta = new ResTransferencia();
                        respuesta = new TransferenciasNeg( _settingsApi ).get_val_transf_interbancarias( req_valida_transferencia!, str_operacion );
                        break;
                }

            }
            catch(Exception)
            {
                ResException resException = new ResException()
                {
                    str_res_estado_transaccion = "ERR",
                    str_res_codigo = "001",
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                return resException;
            }

            return respuesta;
        }

        public Object ProcesarSolicitudRealizaTransferencias ( string str_va_transferencia, string str_operacion )
        {
            Object respuesta = new();
            try
            {
                var req_add_transferencia = JsonSerializer.Deserialize<ReqTransferencia>( str_va_transferencia );

                switch(req_add_transferencia!.str_nemonico_tipo_transferencia)
                {
                    case "TRN_MIS_CUENTAS_COOPMEGO":
                    case "TRN_OTRAS_CUENTAS_COOPMEGO":
                        respuesta = new TransferenciasNeg( _settingsApi ).add_transfer_interna( req_add_transferencia!, str_operacion );
                        break;

                    case "TRN_EXTERNAS":
                        //respuesta = new ResTransferencia();
                        respuesta = new TransferenciasNeg( _settingsApi ).add_transf_interbancarias( req_add_transferencia, str_operacion );
                        break;
                }

            }
            catch(Exception)
            {
                ResException resException = new ResException()
                {
                    str_res_estado_transaccion = "ERR",
                    str_res_codigo = "001",
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                return resException;
            }

            return respuesta;
        }
    }
}
