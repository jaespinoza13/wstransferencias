

using Application.Common.Cryptography;
using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Programacion;

public class ResGetTransfProgramadas : ResComun
{
    public List<TransferenciasProgramadas> lst_tranferencias { get; set; } = new();
    public void EncryptAES(ResGetKeys Key)
    {
        lst_tranferencias.ForEach( cuenta =>
        {
            cuenta.str_id_cta_beneficiario = CryptographyAES.Encrypt( cuenta.str_id_cta_beneficiario!, Key.str_llave_simetrica );
            cuenta.str_id_cta_ordenante = CryptographyAES.Encrypt( cuenta.str_id_cta_ordenante!, Key.str_llave_simetrica );
        } );


    }

}

