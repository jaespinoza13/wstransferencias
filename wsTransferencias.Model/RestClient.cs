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
        private Dictionary<string, string> headers = new Dictionary<string, string>();
        private string url_request;
        private string content_type;

        public RestClient(string url_request, string content_type)
        {
            this.url_request = url_request;
            this.content_type = content_type;
        }

        public RestClient(string url_request, string content_type, string usuario, string contrasenia)
        {
            this.url_request = url_request;
            this.content_type = content_type;
            string authInfo = Convert.ToBase64String(ASCIIEncoding.ASCII.GetBytes(usuario + ":" + contrasenia));
            headers.Add("Authorization", "Basic " + authInfo);
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
                HttpWebRequest web_request = (HttpWebRequest)WebRequest.Create(url_request);
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
                //Log.LogServicios.RegistrarTramas()
                throw;
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

                Dictionary<string, string> parametros = (Dictionary<string, string>)JsonConvert.DeserializeObject(json_in, typeof(Dictionary<string, string>));

                var httpContent = new FormUrlEncodedContent(parametros);

                HttpResponseMessage response = client.PostAsync("", httpContent).Result;
                if (response.IsSuccessStatusCode)
                {
                    return response.Content.ReadAsStringAsync().Result;
                }
                else
                {
                    throw new Exception(string.Format("{0},({1})", (int)response.StatusCode, response.Content.ReadAsStringAsync().Result));
                }
            }
            catch (Exception ex)
            {
                //Log.LogServicios.RegistrarTramas()
                throw;
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
                HttpWebRequest web_request = (HttpWebRequest)WebRequest.Create(url_request);
                web_request.Method = "GET";
                web_request.ContentType = content_type;

                //add headers 
                foreach (KeyValuePair<string, string> item in headers)
                {
                    web_request.Headers.Add(item.Key, item.Value);
                }

                //JsonSerializerSettings serializerSettings = new JsonSerializerSettings
                //{
                //    NullValueHandling = NullValueHandling.Ignore
                //};                

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
                //Log.LogServicios.RegistrarTramas()
                throw;
            }
        }
    }

    public static class ApplicationContenTypes
    {
        public const string JSON_UTF8 = "application/json; charset=utf-8";
        public const string X_WWW_FORM_URLENCODED = "application/x-www-form-urlencoded";
    }
}
