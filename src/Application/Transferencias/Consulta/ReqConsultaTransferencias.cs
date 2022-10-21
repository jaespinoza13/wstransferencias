

using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Transferencias.Consulta;
public class ReqConsultaTransferencias : Header, IRequest<ResConsultaTransferencias>
{
    public string str_num_cta_ordenante { get; set; } = String.Empty;
    public string str_fecha_inicio { get; set; } = String.Empty;
    public string str_fecha_fin { get; set; } = String.Empty;
    public string str_tipo_cta_benef { get; set; } = String.Empty;
    public string str_filtro { get; set; } = String.Empty;
    public string str_filtro_nem_canal { get; set; } = String.Empty;
    public int int_ultimos_movimientos { get; set; }
    public int int_iteracion { get; set; }
}
