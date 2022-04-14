using Microsoft.Extensions.Options;
using System.Text;
using System.Text.Json;
using wsTransferencias.Model;

namespace wsTransferencias.Middleware
{
    public class BasicAuthentication
    {
        private readonly RequestDelegate _next;
        private readonly SettingsApi _settings;

        public BasicAuthentication ( RequestDelegate next, IOptionsMonitor<SettingsApi> settings )
        {
            _next = next;
            _settings = settings.CurrentValue;
        }

        public async Task Invoke ( HttpContext httpContext )
        {
            string authHeader = httpContext.Request.Headers["Authorization"];

            try
            {
                if(authHeader != null && authHeader.StartsWith( "Basic" ))
                {

                    string encodeAuthorization = authHeader.Substring( "Basic ".Length ).Trim();
                    //Valida que sea un base64
                    Encoding.UTF8.GetString( Convert.FromBase64String( encodeAuthorization ) );

                    if(encodeAuthorization.Equals( _settings.auth_ws_transferencias ))
                    {
                        await _next.Invoke( httpContext );
                    }
                    else
                    {
                        httpContext.Response.ContentType = "application/json; charset=UTF-8";
                        int statusCode = Convert.ToInt32( System.Net.HttpStatusCode.Unauthorized );
                        var objErr = new
                        {
                            str_res_codigo = statusCode,
                            dt_res_fecha_msj_crea = DateTime.ParseExact( DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ), "yyyy-MM-dd HH:mm:ss", null ),
                            str_res_estado_transaccion = "ERR",
                            str_res_info_adicional = "Credenciales erroneas"
                        };
                        httpContext.Response.StatusCode = statusCode;
                        await httpContext.Response.WriteAsync( JsonSerializer.Serialize<object>( objErr ) );
                    }

                }
                else
                {
                    httpContext.Response.ContentType = "application/json; charset=UTF-8";
                    int statusCode = Convert.ToInt32( System.Net.HttpStatusCode.Unauthorized );
                    var objErr = new
                    {
                        str_res_codigo = statusCode,
                        dt_res_fecha_msj_crea = DateTime.ParseExact( DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ), "yyyy-MM-dd HH:mm:ss", null ),
                        str_res_estado_transaccion = "ERR",
                        str_res_info_adicional = "No autorizado"
                    };

                    httpContext.Response.StatusCode = statusCode;
                    await httpContext.Response.WriteAsync( JsonSerializer.Serialize<object>( objErr ) );
                }
            }
            catch(Exception ex)
            {
                httpContext.Response.ContentType = "application/json; charset=UTF-8";
                int statusCodeBadRequest = Convert.ToInt32( System.Net.HttpStatusCode.InternalServerError );


                var objErr = new
                {
                    str_id_transaccion = ex.Message,
                    str_res_codigo = statusCodeBadRequest,
                    str_res_estado_transaccion = "ERR",
                    dt_res_fecha_msj_crea = DateTime.ParseExact( DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ), "yyyy-MM-dd HH:mm:ss", null ),
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                httpContext.Response.StatusCode = statusCodeBadRequest;
                await httpContext.Response.WriteAsync( JsonSerializer.Serialize<object>( objErr ) );
            }
        }
    }


    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class BasicAuthenticationExtensions
    {
        public static IApplicationBuilder UseBasicAuthentication ( this IApplicationBuilder builder, IOptionsMonitor<SettingsApi> settings )
        {
            return builder.UseMiddleware<BasicAuthentication>( settings );
        }
    }
}
