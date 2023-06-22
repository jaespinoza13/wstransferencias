
using Application.Common.Cryptography;
using Application.Common.ISO20022.Models;

namespace Application.Transferencias.DTO
{
    public class ReqValidaTransferencia : Header
    {
        public string? str_nemonico_tipo_transferencia { get; set; }
        public int int_id_cta_ordenante { get; set; }
        public string str_id_cta_ordenante { get; set; } = string.Empty;
        public int int_id_cta_beneficiario { get; set; }
        public string str_id_cta_beneficiario { get; set; } = string.Empty;
        public decimal dec_monto_tran { get; set; }
        public string str_observacion { get; set; } = string.Empty;
        public int int_categoria { get; set; } = 0;
        public string str_srv_transfer { get; set; } = string.Empty;
        public string str_id_log { get; set; } = string.Empty;
        public int int_subcategoria_gasto { get; set; } = 0;
        public int int_id_programacion { get; set; } = 0;

        public void DecryptAES(ResGetKeys Key)
        {
            str_id_cta_ordenante = CryptographyAES.Decrypt( str_id_cta_ordenante!, Key.str_llave_simetrica );
            str_id_cta_beneficiario = CryptographyAES.Decrypt( str_id_cta_beneficiario!, Key.str_llave_simetrica );
        }
    }
}
