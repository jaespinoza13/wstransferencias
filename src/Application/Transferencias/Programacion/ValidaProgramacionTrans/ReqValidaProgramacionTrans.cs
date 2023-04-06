using MediatR;
using Application.Common.ISO20022.Models;
using Application.Common.Cryptography;

namespace Application.Programacion;
public class ReqValidaProgramacionTrans : Header, IRequest<ResValidaProgramacionTrans>

{
    public string? str_nemonico_tipo_transferencia { get; set; }
    public string str_id_cta_ordenante { get; set; } = string.Empty;
    public string str_id_cta_beneficiario { get; set; } = string.Empty;
    public decimal dec_monto_tran { get; set; }
    public string str_observacion { get; set; } = string.Empty;
    public string str_srv_transfer { get; set; } = string.Empty;
    public string str_fecha_desde { get; set; } = string.Empty;
    public string str_fecha_hasta { get; set; } = string.Empty;
    public void DecryptAES(ResGetKeys Key)
    {
        str_id_cta_ordenante = CryptographyAES.Decrypt( str_id_cta_ordenante!, Key.str_llave_simetrica );
        str_id_cta_beneficiario = CryptographyAES.Decrypt( str_id_cta_beneficiario!, Key.str_llave_simetrica );
    }
}