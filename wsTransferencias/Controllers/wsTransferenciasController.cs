using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using wsTransferencias.Model;
using wsTransferencias.Neg;

namespace wsTransferencias.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class wsTransferenciasController : ControllerBase
    {
        private readonly ServiceSettings serviceSettings;
        public wsTransferenciasController(IOptionsMonitor<ServiceSettings> settings)
        {
            serviceSettings = settings.CurrentValue;
        }

        // POST api/<wsConsultas>
        [HttpPost]
        public IActionResult Transaccion(Object raw, string str_operacion)
        {
            object respuesta = new object();
            wsTransferenciasNeg objConsultas = new wsTransferenciasNeg(serviceSettings);
            respuesta = objConsultas.procesarSolicitud(raw, str_operacion);
            return Ok(respuesta);
        }

    }
}
