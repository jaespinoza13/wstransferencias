using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using wsTransferencias.Model;
using wsTransferencias.Neg;
using wsTransferencias.Neg.Utils;

namespace wsTransferencias.Controllers
{
    [Route( "api/[controller]" )]
    [ApiController]
    public class WsTransferenciasController : ControllerBase
    {
        private readonly SettingsApi _settings;
        public WsTransferenciasController ( IOptionsMonitor<SettingsApi> settings, IOptionsMonitor<LoadParameters> optionsMonitorParam, IWebHostEnvironment webHost )
        {
            _settings = settings.CurrentValue;
            string path_logs = webHost.WebRootPath + _settings.path_logs_transferencias;
            _settings.path_logs_transferencias = path_logs;
            if(DateTime.Compare( DateTime.Now, LoadConfigService.dt_fecha_codigos.AddDays( 1 ) ) > 0 || LoadConfigService.lst_errores.Count <= 0)
            {
                LoadConfigService.Init( optionsMonitorParam.CurrentValue );
                LoadConfigService.LoadConfiguration( _settings );
            }
        }

        // POST api/<wsConsultas>
        [HttpPost]
        public IActionResult Transaccion ( Object raw, string str_operacion )
        {
            try
            {
                WsTransferenciasNeg objConsultas = new WsTransferenciasNeg( _settings );
                object respuesta = objConsultas.procesarSolicitud( raw, str_operacion );
                return Ok( respuesta );
            }
            catch(Exception ex)
            {
                throw new Exception( ex.Message )!;
            }
        }
    }
}
