using Application.Common.Converting;
using Application.Common.Cryptography;
using Application.Common.Interfaces;
using Application.Common.Models;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;
using System.Text.Json;

namespace WebUI.Filters
{
    public class CifradoAESFilter : IActionFilter
    {

        private readonly IKeysDat _keysDat;
        private readonly ApiSettings _settings;

        public CifradoAESFilter(IKeysDat keysDat, IOptionsMonitor<ApiSettings> options) { 
            _keysDat = keysDat;
            _settings = options.CurrentValue;

        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            //Desencripta datos de entrada
            var modelRequest = context.ActionArguments.First();
            var reqGetKeys = JsonSerializer.Deserialize<ReqGetKeys>( JsonSerializer.Serialize( modelRequest.Value ) )!;

            if (_settings.lst_canales_encriptar.Contains( reqGetKeys.str_nemonico_canal ))
            {
                var res_tran = _keysDat.GetKeys( reqGetKeys );
                var Key = Conversions.ConvertConjuntoDatosToClass<ResGetKeys>( (ConjuntoDatos)res_tran.cuerpo, 0 );

                if (Key != null)
                    try
                    {
                        _settings.lst_datos_encriptados!.ForEach( atributo =>
                        {
                            if (modelRequest.Value!.GetType().GetProperty( atributo ) != null)
                            {

                                var propiedad = modelRequest.Value.GetType().GetProperty( atributo );
                                var valor = propiedad!.GetValue( modelRequest.Value, null )!.ToString();
                                var textoDesencriptado = CifradoAES.Decrypt( valor!, Key.str_llave_simetrica );
                                propiedad.SetValue( modelRequest.Value, textoDesencriptado );

                            }

                        } );
                       
                    }
                    catch (Exception)
                    {
                        throw new ArgumentException( "Error: Credenciales inválidas" );
                    }
                else
                    throw new ArgumentException( "Error: Credenciales inválidas" );

            }
           
          


        }
        public void OnActionExecuted(ActionExecutedContext context)
        {
                   
        }


    }
}
