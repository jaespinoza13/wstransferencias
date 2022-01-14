using System.Reflection;
using System.Text.Json;
using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Model;
using wsTransferencias.Neg.Utils;

namespace wsTransferencias.Neg
{
    public class CuposNeg
    {

        private readonly SettingsApi _settingsApi;
        private readonly string str_clase;

        public CuposNeg ( SettingsApi settingsApi )
        {
            _settingsApi = settingsApi;
            this.str_clase = GetType().FullName!;
            ServiceLogs.Init( _settingsApi );
        }


        #region "Cupos"
        public ResGetCupos get_cupos_socios ( ReqGetCupos req_get_cupos, string str_operacion )
        {
            var respuesta = new ResGetCupos();
            respuesta.LlenarResHeader( req_get_cupos );
            req_get_cupos.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqGetCupos>( req_get_cupos, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_get_cupos.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new CuposDat( _settingsApi ).get_cupos( req_get_cupos );

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";

                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }

        public ResComun set_cupos_socios ( ReqSetCupos req_set_cupos, string str_operacion )
        {
            var respuesta = new ResComun();
            respuesta.LlenarResHeader( req_set_cupos );
            req_set_cupos.str_id_transaccion = ServiceLogs.SaveHeaderLogs<ReqSetCupos>( req_set_cupos, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            respuesta.str_id_transaccion = req_set_cupos.str_id_transaccion;

            try
            {
                RespuestaTransaccion res_tran = new CuposDat( _settingsApi ).set_cupos( req_set_cupos );

                respuesta.str_res_estado_transaccion = (res_tran.codigo.Equals( "000" )) ? "OK" : "ERR";
                respuesta.str_res_codigo = res_tran.codigo;
                respuesta.str_res_info_adicional = res_tran.diccionario["str_error"].ToString();
            }
            catch(Exception exception)
            {
                ServiceLogs.SaveExceptionLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase, exception );
                throw;
            }

            ServiceLogs.SaveResponseLogs( respuesta, str_operacion, MethodBase.GetCurrentMethod()!.Name, str_clase );
            return respuesta;
        }

        #endregion

    }
}
