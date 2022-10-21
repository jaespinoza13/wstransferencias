
using Application.Common.Cryptography;
using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Beneficiarios;

public class ReqDeleteBeneficiario : Header, IRequest<ResDeleteBeneficiario>
{
    public string? str_id { get; set; }
    public string? str_motivo_elimina { get; set; }
    public void DecryptAES(ResGetKeys Key)
    {
        str_id = CryptographyAES.Decrypt( str_id!, Key.str_llave_simetrica );
    }
}