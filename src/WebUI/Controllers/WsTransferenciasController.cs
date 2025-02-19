using WebUI.Filters;
using Application.Common.Models;

// Authorization
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

using Microsoft.Extensions.Options;

//USE CASE
using Application.Transferencias.Internas;
using Application.Transferencias.Externas.Validaciones;
using Application.Transferencias.DTO;
using Application.Transferencias.Externas.Registro;
using Application.Transferencias.Consulta;
using Application.Transferencias.Comprobante;
using Domain.Types;

namespace WebUI.Controllers
{
    [Route( "api/wsTransferencias" )]
    [ApiController]
    [ServiceFilter( typeof( DailyRequestFilter ) )]
    [Authorize( AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = Rol.SocioInvitadoInterno )]
    [ServiceFilter( typeof( CryptographyAESFilter ) )]
    [ServiceFilter( typeof( ClaimControlFilter ) )]
    [ServiceFilter( typeof( SessionControlFilter ) )]
    [ProducesResponseType( StatusCodes.Status200OK )]
    [ProducesResponseType( StatusCodes.Status400BadRequest )]
    [ProducesResponseType( StatusCodes.Status401Unauthorized )]
    [ProducesResponseType( StatusCodes.Status500InternalServerError )]
    public class WsTransferenciasController : ApiControllerBase
    {
        private readonly ApiSettings _settings;
        public WsTransferenciasController(IOptionsMonitor<ApiSettings> options) => _settings = options.CurrentValue;

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

        [HttpPost( "GET_CONSULTA_TRANSFERENCIAS" )]
        public async Task<ResConsultaTransferencias> ConsultaTransferencias(ReqConsultaTransferencias reqConsultaTransferencias)
        {
            return await Mediator.Send( reqConsultaTransferencias );
        }

        [HttpPost( "GET_COMPROBANTE_TRANSFERENCIA" )]
        public async Task<ResComprobanteTransferencia> ComprobanteTransferencias(ReqComprobanteTransferencia reqComprobanteTransferencia)
        {
            return await Mediator.Send( reqComprobanteTransferencia );
        }
    }
}
