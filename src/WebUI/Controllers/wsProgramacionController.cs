using WebUI.Filters;

// Authorization
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

//USE CASE
using Application.Common.ISO20022.Models;
using Application.Beneficiarios;
using Domain.Types;
using Application.Programacion;
using Microsoft.Extensions.Options;
using Application.Common.Models;

namespace WebUI.Controllers
{

    [Route( "api/wsProgramacion" )]
    [ApiController]
    [ServiceFilter( typeof( DailyRequestFilter ) )]
    //[Authorize( AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = Rol.Socio )]
    //[ServiceFilter( typeof( CryptographyAESFilter ) )]
    //[ServiceFilter( typeof( ClaimControlFilter ) )]
    //[ServiceFilter( typeof( SessionControlFilter ) )]
    [ProducesResponseType( StatusCodes.Status200OK )]
    [ProducesResponseType( StatusCodes.Status400BadRequest )]
    [ProducesResponseType( StatusCodes.Status401Unauthorized )]
    [ProducesResponseType( StatusCodes.Status500InternalServerError )]
    public class wsProgramacionController : ApiControllerBase
    {
        private readonly ApiSettings _settings;
        public wsProgramacionController(IOptionsMonitor<ApiSettings> options) => _settings = options.CurrentValue;

        [HttpPost( "GET_DATOS_INICIALES_PT" )]
        public async Task<ResGetDatosInicialesPT> GetDatosInicialesPT(ReqGetDatosInicialesPT reqGetDatosInicialesPT)
        {
            return await Mediator.Send( reqGetDatosInicialesPT );
        }

        [HttpPost( "VALIDA_PROGRAMACION_TRANS" )]
        public IActionResult ValidaTransferencia(ReqValidaProgramacionTrans reqValidaProgramacionTrans)
        {
            ResValidaProgramacionTrans respuesta = new();

            var proceso = _settings.ProcesoTransferencia.Find( e => e.proceso == reqValidaProgramacionTrans!.str_nemonico_tipo_transferencia );

            if (proceso != null)
            {
                reqValidaProgramacionTrans!.str_srv_transfer = proceso.servicio;

                if (proceso.tipo == "interna")
                {
                    respuesta = Mediator.Send( reqValidaProgramacionTrans ).Result;
                }
                else if (proceso.tipo == "externa")
                {
                    respuesta = Mediator.Send( reqValidaProgramacionTrans ).Result;
                }
                return Ok( respuesta );
            }

            return BadRequest();
        }

        [HttpPost( "ADD_PROGRAMACION_TRANS" )]
        public IActionResult AddTransferencia(ReqAddProgramacionTrans reqAddProgramacionTrans)
        {
            ResAddProgramacionTrans respuesta = new();

            var proceso = _settings.ProcesoTransferencia.Find( e => e.proceso == reqAddProgramacionTrans!.str_nemonico_tipo_transferencia );

            if (proceso != null)
            {
                reqAddProgramacionTrans!.str_srv_transfer = proceso.servicio;

                if (proceso.tipo == "interna")
                {
                    respuesta = Mediator.Send( reqAddProgramacionTrans ).Result;
                }
                else if (proceso.tipo == "externa")
                {
                    respuesta = Mediator.Send( reqAddProgramacionTrans ).Result;
                }
                return Ok( respuesta );
            }

            return BadRequest();
        }

        [HttpPost( "GET_CONTRATO_PT" )]
        public async Task<ResGetContratoPT> GetContratoPT(ReqGetContratoPT reqGetContratoPT)
        {
            return await Mediator.Send( reqGetContratoPT );
        }  
        
        
        [HttpPost( "GET_TRANSF_PROGRAMADAS" )]
        public async Task<ResGetTransfProgramadas> GetTransfProgramadas(ReqGetTransfProgramadas reqGetTransfProgramadas)
        {
            return await Mediator.Send( reqGetTransfProgramadas );
        }
    }
}
