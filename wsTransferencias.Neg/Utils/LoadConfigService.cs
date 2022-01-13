using wsTransferencias.Dat;
using wsTransferencias.Dto;
using wsTransferencias.Model;

namespace wsTransferencias.Neg.Utils
{
    public static class LoadConfigService
    {
        public static List<Parametro> lst_errores { get; set; } = new();
        public static List<Parametro> lst_parametros { get; set; } = new();
        public static DateTime dt_fecha_codigos { get; set; }

        /// <summary>
        /// Carga errores Megonline en memoria
        /// </summary>
        /// <param name="serviceSettings"></param>
        /// <returns></returns>
        public static void LoadConfiguration ( SettingsApi serviceSettings )
        {
            try
            {
                ReqGetParametros req_get_parametros = new();
                req_get_parametros.str_nombre = "CODIGOS_ERROR";
                req_get_parametros.str_id_sistema = "66";
                req_get_parametros.str_id_perfil = "1";
                req_get_parametros.str_id_oficina = "1";

                RespuestaTransaccion res_tran = new ParametrosDat( serviceSettings ).get_parametros( req_get_parametros );
                lst_errores = Utils.ConvertConjuntoDatosToListClass<Parametro>( (ConjuntoDatos) res_tran.cuerpo );

                req_get_parametros.str_nombre = "PARAMETROS_MEGONLINE";
                RespuestaTransaccion res_tran2 = new ParametrosDat( serviceSettings ).get_parametros( req_get_parametros);
                lst_parametros = Utils.ConvertConjuntoDatosToListClass<Parametro>( (ConjuntoDatos) res_tran2.cuerpo );

                dt_fecha_codigos = DateTime.Now.Date;

            }
            catch
            {
                dt_fecha_codigos = default( DateTime );
            }
        }


        public static Parametro FindErrorCode ( string str_codigo )
        {
            return lst_errores.Find( x => x.str_valor_ini == str_codigo )!;
        }
        public static Parametro FindParametro ( string str_nemonico )
        {
            return lst_parametros.Find( x => x.str_nemonico == str_nemonico )!;
        }


    }
}
