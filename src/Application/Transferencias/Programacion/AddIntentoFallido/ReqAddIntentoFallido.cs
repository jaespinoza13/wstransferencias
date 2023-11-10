using MediatR;
using Application.Common.ISO20022.Models;
using Application.Common.Cryptography;

namespace Application.Programacion;
public class ReqAddIntentoFallido : Header, IRequest<ResAddIntentoFallido>

{
    public int int_id { get; set; }
    public string str_codigo_respuesta { get; set; } = String.Empty;    
    public string str_mensaje_respuesta { get; set; } = String.Empty;    

}