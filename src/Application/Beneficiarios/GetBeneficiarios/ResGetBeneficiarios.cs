
using Domain.Entities;
using Application.Common.ISO20022.Models;
using Application.Common.Cryptography;

namespace Application.Beneficiarios.GetBeneficiarios;

public class ResGetBeneficiarios : ResComun
{
    public List<Beneficiario>? lst_beneficiarios { get; set; }=new ();

    public void EncryptAES(ResGetKeys Key)
    {
        lst_beneficiarios!.ForEach( beneficiario =>
        {
            beneficiario.str_id = CryptographyAES.Encrypt( beneficiario.str_id!, Key.str_llave_simetrica );
            beneficiario.str_ente_registra = CryptographyAES.Encrypt( beneficiario.str_ente_registra!, Key.str_llave_simetrica );

        } );


    }
}

