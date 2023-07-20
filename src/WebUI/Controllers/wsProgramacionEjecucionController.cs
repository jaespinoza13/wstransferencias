using WebUI.Filters;

// Authorization
using Microsoft.AspNetCore.Mvc;
//USE CASE
using Application.Programacion;
using Microsoft.Extensions.Options;
using Application.Common.Models;
using Application.Transferencias.DTO;
using Application.Transferencias.Internas;
using Application.Transferencias.Externas.Validaciones;
using Application.Transferencias.Externas.Registro;

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
        [HttpPost( "VALIDA_TRANSFERENCIA" )]
        public IActionResult ValidaTransferencia(ReqValidaTransferencia reqValidaTransferencia)
        {
            ResValidaTransferencia respuesta = new();

            var proceso = _settings.ProcesoTransferencia.Find( e => e.proceso == reqValidaTransferencia!.str_nemonico_tipo_transferencia );

            if (proceso != null)
            {
                reqValidaTransferencia!.str_srv_transfer = proceso.servicio;

                if (proceso.tipo == "interna")
                {
                    respuesta = Mediator.Send( new ValidaTransferenciaInternaCommand( reqValidaTransferencia ) ).Result;
                }
                else if (proceso.tipo == "externa")
                {
                    respuesta = Mediator.Send( new ValidaTransferenciaExternaCommand( reqValidaTransferencia ) ).Result;
                }
                return Ok( respuesta );
            }

            return BadRequest();
        }


        [HttpPost( "ADD_TRANSFERENCIA" )]
        public IActionResult RegistraTransferencia(ReqAddTransferencia reqAddTransferencia)
        {
            ResAddTransferencia respuesta = new();

            var proceso = _settings.ProcesoTransferencia.Find( e => e.proceso == reqAddTransferencia!.str_nemonico_tipo_transferencia );

            if (proceso != null)
            {
                if (proceso.tipo == "interna")
                {
                    respuesta = Mediator.Send( new AddTransferenciaInternaCommand( reqAddTransferencia ) ).Result;
                }
                else if (proceso.tipo == "externa")
                {
                    respuesta = Mediator.Send( new AddTransferenciaExternaCommand( reqAddTransferencia ) ).Result;
                }
                return Ok( respuesta );
            }
            return NotFound();
        }
       
        [HttpPost( "ADD_INTENTO_FALLITO_PT" )]
        public async Task<ResAddIntentoFallido> GetContratoPT(ReqAddIntentoFallido reqAddIntentoFallido)
        {
            return await Mediator.Send( reqAddIntentoFallido );
        }

    }
}