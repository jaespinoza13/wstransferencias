using WebUI.Filters;

// Authorization
using Microsoft.AspNetCore.Mvc;
//USE CASE
using Application.Programacion;
using Microsoft.Extensions.Options;
using Application.Common.Models;

namespace WebUI.Controllers
{

    [Route( "api/wsProgramacion" )]
    [ApiController]
    [ProducesResponseType( StatusCodes.Status200OK )]
    [ProducesResponseType( StatusCodes.Status400BadRequest )]
    [ProducesResponseType( StatusCodes.Status401Unauthorized )]
    [ProducesResponseType( StatusCodes.Status500InternalServerError )]
    public class wsProgramacionEjecucionController : ApiControllerBase
    {
        private readonly ApiSettings _settings;
        public wsProgramacionEjecucionController(IOptionsMonitor<ApiSettings> options) => _settings = options.CurrentValue;

        [HttpPost( "GET_TRANS_EJECUCION" )]
        public async Task<ResGetTransfEjecucion> GetDatosInicialesPT(ReqGetTransfEjecucion reqGetTransfEjecucion)
        {
            return await Mediator.Send( reqGetTransfEjecucion );
        }

    }
}