using Microsoft.Extensions.Options;
using wsTransferencias.Model;

namespace wsTransferencias.Middleware
{
    public class BasicAuthentication
    {
        private readonly RequestDelegate _next;
        private readonly SettingsApi _settings;

        public BasicAuthentication(RequestDelegate next, IOptionsMonitor<SettingsApi> settings)
        {
            _next = next;
            _settings = settings.CurrentValue;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            string authHeader = httpContext.Request.Headers["Authorization"];

            if (authHeader != null && authHeader.StartsWith("Basic"))
            {

                string encodeAuthorization = authHeader.Substring("Basic ".Length).Trim();

                if (encodeAuthorization.Equals(_settings.auth_ws_transferencias))
                {
                    await _next.Invoke(httpContext);
                }
                else
                {
                    httpContext.Response.StatusCode = Convert.ToInt32(System.Net.HttpStatusCode.Unauthorized);
                }

            }
            else
            {

                httpContext.Response.StatusCode = Convert.ToInt32(System.Net.HttpStatusCode.Unauthorized);
            }
        }
    }


    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class BasicAuthenticationExtensions
    {
        public static IApplicationBuilder UseBasicAuthentication(this IApplicationBuilder builder, IOptionsMonitor<SettingsApi> settings)
        {
            return builder.UseMiddleware<BasicAuthentication>(settings);
        }
    }
}
