using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Transferencias.Comprobante
{
    public class ReqComprobanteTransferencia : Header, IRequest<ResComprobanteTransferencia>
    {
        public int int_num_referencia { get; set; }
        public string str_documento_ordenante { get; set; } = String.Empty;
        public string str_num_cta_benef { get; set;} = String.Empty;

    }
}
