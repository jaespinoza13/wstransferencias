using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Neg.Utils
{
    public class ServiceHttp<T>
    {
        /// <summary>
        /// Servicio de peticiónes GET
        /// </summary>
        /// <param name="serviceAddress"></param>
        /// <param name="base64basicAuth"></param>
        /// <returns></returns>
        public async Task<T> GetRestServiceDataAsync ( string serviceAddress, string base64basicAuth )
        {
            try
            {
                var client = new HttpClient();
                client.BaseAddress = new Uri( serviceAddress );
                client.DefaultRequestHeaders.Add( "Authorization", "Basic " + base64basicAuth );
                HttpResponseMessage response = client.GetAsync( client.BaseAddress ).Result;
                response.EnsureSuccessStatusCode();
                string jsonResult = await response.Content.ReadAsStringAsync();
                var result = JsonSerializer.Deserialize<T>( jsonResult )!;
                return result;
            }
            catch(Exception ex)
            {
                throw new ArgumentNullException( ex.ToString() );
            }
        }

        /// <summary>
        /// Servicio de peticiónes POST
        /// </summary>
        /// <param name="serializedData"></param>
        /// <param name="parameters"></param>
        /// <param name="serviceAddress"></param>
        /// <param name="base64basicAuth"></param>
        /// <returns></returns>
        public async Task<T> PostRestServiceDataAsync ( string serializedData, string serviceAddress, string parameters, string base64basicAuth, SettingsApi settings )
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri( serviceAddress );
                client.DefaultRequestHeaders.Add( "Authorization", "Basic " + base64basicAuth );

                var httpContent = new StringContent( serializedData, Encoding.UTF8, "application/json" );
                HttpResponseMessage response = client.PostAsync( parameters, httpContent ).Result;
                string resultadoJson = await response.Content.ReadAsStringAsync();
                T respuesta = default( T )!;
                if(response.IsSuccessStatusCode)
                {
                    respuesta = JsonSerializer.Deserialize<T>( resultadoJson )!;
                }
                else
                {
                    var res_servicio = new { codigo = response.StatusCode, cabecera = response.Headers, cuerpo = response.Content.ReadAsStreamAsync() };
                    ServiceLogs.Init( settings );
                    ServiceLogs.SaveHttpErrorLogs( JsonSerializer.Deserialize<dynamic>( serializedData ), MethodBase.GetCurrentMethod()!.Name, "ServiceHttp", res_servicio );
                }

                return respuesta;
            }
            catch(Exception ex)
            {
                var data = JsonSerializer.Deserialize<dynamic>( serializedData );
                ServiceLogs.Init( settings );
                ServiceLogs.SaveHttpErrorLogs( data, MethodBase.GetCurrentMethod()!.Name, "ServiceHttp", ex );
                throw new Exception( String.Empty )!;
            }
        }
    }
}
