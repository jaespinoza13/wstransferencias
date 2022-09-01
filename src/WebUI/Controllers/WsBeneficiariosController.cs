using WebUI.Filters;

// Authorization
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;

//USE CASE
using Application.Common.ISO20022.Models;
using Application.Beneficiarios.GetBeneficiarios;
using Application.Beneficiarios.AddBeneficiario;
using Application.Beneficiarios.UpdateBeneficiario;
using Application.Beneficiarios.DeleteBeneficiario;
using Application.Beneficiarios.GetCuentasBeneficiario;
using Application.Beneficiarios.ValidaRegistroBeneficiario;
using Application.Beneficiarios.ValidaUpdateBeneficiario;
using Application.Beneficiarios.ValidaCuentasExterasBeneficiario;
using Application.Beneficiarios.ValidaCuentaPagoDirecto;
using Domain.Types;

namespace WebUI.Controllers
{

    [Route( "api/wsBeneficiarios" )]
    [ApiController]
    [ServiceFilter( typeof( DailyRequestFilter ) )]
    [Authorize( AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = Rol.Socio )]
    [ServiceFilter( typeof( ClaimControlFilter ) )]
    [ServiceFilter( typeof( SessionControlFilter ) )]
    [ProducesResponseType( StatusCodes.Status200OK )]
    [ProducesResponseType( StatusCodes.Status400BadRequest )]
    [ProducesResponseType( StatusCodes.Status401Unauthorized )]
    [ProducesResponseType( StatusCodes.Status500InternalServerError )]
    public class WsBeneficiariosController : ApiControllerBase
    {
        [HttpPost( "GET_BENEFICIARIO" )]
        public async Task<ResComun> GetBeneficiarios(ReqGetBeneficiarios reqGetBeneficiarios)
        {
            return await Mediator.Send( reqGetBeneficiarios );
        }

        [HttpPost( "ADD_BENEFICIARIO" )]

        public Task<ResComun> AddBeneficiarios(ReqAddBeneficiario reqAddBeneficiario)
        {
            return Mediator.Send( reqAddBeneficiario );
        }

        [HttpPost( "UPDATE_BENEFICIARIO" )]
        public Task<ResComun> UpdateBeneficiarios(ReqUpdateBeneficiario reqUpdateBeneficiario)
        {
            return Mediator.Send( reqUpdateBeneficiario );
        }

        [HttpPost( "DELETE_BENEFICIARIO" )]
        public Task<ResComun> DeleteBeneficiarios(ReqDeleteBeneficiario reqDeleteBeneficiario)
        {
            return Mediator.Send( reqDeleteBeneficiario );
        }

        [HttpPost( "GET_CTAS_BENEF_TRANSFERENCIA" )]
        public async Task<ResGetCuentasBeneficiario> GetCuentasBeneficiarioTransferencia(ReqGetCuentasBeneficiario reqGetCuentasBeneficiario)
        {
            return await Mediator.Send( reqGetCuentasBeneficiario );
        }

        [HttpPost( "VALIDAR_REGISTRO_BENEFICIARIO" )]
        public async Task<ResValidaRegistroBeneficiario> ValidaRegistroBeneficiario(ReqValidaRegistroBeneficiario reqValidaRegistroBeneficiario)
        {
            return await Mediator.Send( reqValidaRegistroBeneficiario );
        }

        [HttpPost( "VALIDAR_UPDATE_BENEFICIARIO" )]
        public async Task<ResValidaUpdateBeneficiario> ValidaUpdateBeneficiario(ReqValidaUpdateBeneficiario reqValidaUpdateBeneficiario)
        {
            return await Mediator.Send( reqValidaUpdateBeneficiario );
        }

        [HttpPost( "VALIDA_OTRAS_CTAS_MEGO" )]
        public async Task<ResValidaOtrasCuentasBeneficiario> ValidaOtrasCuentasBeneficiario(ReqValidaOtrasCuentasBeneficiario reqValidaOtrasCuentasBeneficiario)
        {
            return await Mediator.Send( reqValidaOtrasCuentasBeneficiario );
        }


        [HttpPost( "VALIDA_CUENTA_PD" )]
        public Task<ResValidaCuentaPagoDirecto> ValidaCuentasPagoDirecto(ReqValidaCuentaPagoDirecto reqValidaCuentaPagoDirecto)
        {
            return Mediator.Send( reqValidaCuentaPagoDirecto );
        }
    }
}
