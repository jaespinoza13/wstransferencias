using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public class RestClient
    {
        private readonly Dictionary<string, string> headers = new Dictionary<string, string>();
        private readonly string url_request;
        private readonly string content_type;

        public RestClient(string url_request, string content_type)
        {
            this.url_request = url_request;
            this.content_type = content_type;
        }

        public RestClient(string url_request, string content_type, string authServicio)
        {
            this.url_request = url_request;
            this.content_type = content_type;
            headers.Add("Authorization", "Basic " + authServicio );
        }


        public void addHeader(string nombre, string valor)
        {
            headers.Add(nombre, valor);
        }

        /// <summary>
        /// Permite consumir servicios REST json
        /// </summary>
        /// <param name="obj_info_entrada">Objeto con la informaciÃ³n de entrada</param>        
        /// <returns></returns>
        public Object post_string_content(Object obj_info_entrada)
        {
            try
            {
#pragma warning disable SYSLIB0014 // El tipo o el miembro están obsoletos
                HttpWebRequest web_request = (HttpWebRequest)WebRequest.Create(url_request);
#pragma warning restore SYSLIB0014 // El tipo o el miembro están obsoletos
                web_request.Method = "POST";
                web_request.ContentType = content_type;

                //add headers 
                foreach (KeyValuePair<string, string> item in headers)
                {
                    web_request.Headers.Add(item.Key, item.Value);
                }

                JsonSerializerSettings serializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Ignore
                };

                string json_in = JsonConvert.SerializeObject(obj_info_entrada, serializerSettings);

                using (StreamWriter writer = new StreamWriter(web_request.GetRequestStream()))
                {
                    writer.Write(json_in);
                }

                //Send a request and wait for response.
                HttpWebResponse response = (HttpWebResponse)web_request.GetResponse();
                Stream reader = response.GetResponseStream();
                StreamReader stream_reader = new StreamReader(reader);
                string json_result = stream_reader.ReadToEnd();
                stream_reader.Close();
                return json_result;
            }
            catch (Exception ex)
            {
                throw new ArgumentNullException(ex.ToString());
            }
        }

        /// <summary>
        /// Permite consumir servicios REST x-www-form-urlencoded
        /// </summary>
        /// <param name="obj_info_entrada"></param>
        /// <returns></returns>
        public Object post_form_content(Object obj_info_entrada)
        {
            try
            {
                HttpClient client = new HttpClient();
                client.BaseAddress = new Uri(url_request);

                //add headers 
                foreach (KeyValuePair<string, string> item in headers)
                {
                    client.DefaultRequestHeaders.Add(item.Key, item.Value);
                }

                JsonSerializerSettings serializerSettings = new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Ignore
                };
                string json_in = JsonConvert.SerializeObject(obj_info_entrada, serializerSettings);

                var parametros = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, string>>(json_in);

                var httpContent = new FormUrlEncodedContent(parametros!);

                HttpResponseMessage response = client.PostAsync("", httpContent).Result;
                if (response.IsSuccessStatusCode)
                {
                    return response.Content.ReadAsStringAsync().Result;
                }
                else
                {
                    throw new Exception(string.Format("{0},({1})", (int)response.StatusCode, response.Content.ReadAsStringAsync()!.Result));
                }
            }
            catch (Exception ex)
            {
                throw new ArgumentNullException(ex.ToString());
            }
        }

        /// <summary>
        /// Permite consumir servicios REST json - GET
        /// </summary>              
        /// <returns></returns>
        public Object get_string_content()
        {
            try
            {
#pragma warning disable SYSLIB0014 // El tipo o el miembro están obsoletos
                HttpWebRequest web_request = (HttpWebRequest)WebRequest.Create(url_request);
#pragma warning restore SYSLIB0014 // El tipo o el miembro están obsoletos
                web_request.Method = "GET";
                web_request.ContentType = content_type;

                //add headers 
                foreach (KeyValuePair<string, string> item in headers)
                {
                    web_request.Headers.Add(item.Key, item.Value);
                }


                //Send a request and wait for response.
                HttpWebResponse response = (HttpWebResponse)web_request.GetResponse();
                Stream reader = response.GetResponseStream();
                StreamReader stream_reader = new StreamReader(reader);
                string json_result = stream_reader.ReadToEnd();
                stream_reader.Close();
                return json_result;
            }
            catch (Exception ex)
            {
                throw new ArgumentNullException(ex.ToString());
            }
        }
    }

    public static class ApplicationContenTypes
    {
        public const string JSON_UTF8 = "application/json; charset=utf-8";
        public const string X_WWW_FORM_URLENCODED = "application/x-www-form-urlencoded";
    }
}
