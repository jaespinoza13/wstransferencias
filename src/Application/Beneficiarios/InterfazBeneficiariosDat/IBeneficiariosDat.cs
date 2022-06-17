using Application.Beneficiarios.AddBeneficiario;
using Application.Beneficiarios.DeleteBeneficiario;
using Application.Beneficiarios.GetBeneficiarios;
using Application.Beneficiarios.GetCuentasBeneficiario;
using Application.Beneficiarios.UpdateBeneficiario;
using Application.Beneficiarios.ValidaCuentaPagoDirecto;
using Application.Beneficiarios.ValidaCuentasExterasBeneficiario;
using Application.Beneficiarios.ValidaRegistroBeneficiario;
using Application.Common.Models;

namespace Application.Beneficiarios.InterfazBeneficiariosDat;

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
}