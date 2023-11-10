using MediatR;
using Application.Common.ISO20022.Models;

namespace Application.Programacion;
public class ReqGetDatosInicialesPT : Header, IRequest<ResGetDatosInicialesPT>

{
    public string str_nemo_tipo_trans { get; set; } = String.Empty;

    
}