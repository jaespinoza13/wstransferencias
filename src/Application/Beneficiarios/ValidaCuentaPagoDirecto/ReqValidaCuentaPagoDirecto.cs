
using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Beneficiarios;

public class ReqValidaCuentaPagoDirecto : Header, IRequest<ResValidaCuentaPagoDirecto>
{
    public string? str_codigo_ifi { get; set; }
    public int int_tipo_cuenta { get; set; }
    public string? str_num_documento { get; set; }
    public string? str_nombre { get; set; }
    public int int_tipo_tarjeta { get; set; }
    public string? str_alias_tarjeta { get; set; }
    public string? str_email { get; set; }
    public string? str_num_cuenta { get; set; }
    public string? str_ref_transaccion { get; set; }
    public string? str_tipo_beneficiario { get; set; }
    public int int_tipo_producto { get; set; }
    

}