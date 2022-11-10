

using Application.Common.Cryptography;
using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Beneficiarios;


public class ReqUpdateFavoritoBeneficiario : Header, IRequest<ResUpdateFavoritoBeneficiario>
{
    public string? str_id { get; set; }
    public int int_favorito { get; set; }
 
    public void DecryptAES(ResGetKeys Key)
    {
        str_id = CryptographyAES.Decrypt( str_id!, Key.str_llave_simetrica );
    }
}
