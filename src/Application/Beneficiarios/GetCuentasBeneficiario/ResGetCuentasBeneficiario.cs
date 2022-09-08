

using Application.Common.Cryptography;
using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Beneficiarios.GetCuentasBeneficiario;

public class ResGetCuentasBeneficiario : ResComun
{
    public List<CuentasBeneficiario> lst_cuentas_beneficiario { get; set; } = new();
    public void EncryptAES(ResGetKeys Key)
    {
        lst_cuentas_beneficiario.ForEach( cuenta =>
        {
            cuenta.str_id = CryptographyAES.Encrypt( cuenta.str_id!, Key.str_llave_simetrica );
            cuenta.str_id = "";

        } );


    }
}
