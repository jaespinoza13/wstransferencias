using Application.Common.Models;

namespace Application.Beneficiarios;

public interface IBeneficiariosDat
{
    Task<RespuestaTransaccion> GetDatosBeneficiarios(ReqGetBeneficiarios reqGetBeneficiarios);
    RespuestaTransaccion AddBeneficiario(ReqAddBeneficiario reqAddBeneficiario);
    RespuestaTransaccion UpdateCuentaBeneficiario(ReqUpdateBeneficiario reqUpdateBeneficiario);
    RespuestaTransaccion DeleteCuentaBeneficiario(ReqDeleteBeneficiario reqDeleteBeneficiario);
    Task<RespuestaTransaccion> GetCuentasBeneciairioTrans(ReqGetCuentasBeneficiario reqGetCuentasBeneficiario);
    Task<RespuestaTransaccion> ValidaRegistrBeneficiario(ReqValidaRegistroBeneficiario reqValidaRegistroBeneficiario);
    Task<RespuestaTransaccion> ValidaOtrasCuentasBeneficiario(ReqValidaOtrasCuentasBeneficiario reqValidaOtrasCuentasBeneficiario);
    RespuestaTransaccion GetDatosPagoDirecto(ReqValidaCuentaPagoDirecto reqValidaCuentaPagoDirecto);
    RespuestaTransaccion UpdateFavoritoBeneficiario(ReqUpdateFavoritoBeneficiario reqUpdateFavoritoBeneficiario);

}