using MediatR;
using Application.Common.ISO20022.Models;
using Application.Common.Cryptography;

namespace Application.Programacion;
public class ReqDelProgramacionTrans : Header, IRequest<ResDelProgramacionTrans>

{
    public int int_id { get; set; }
   
}