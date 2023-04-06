using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Programacion;

public class ResGetContratoPT : ResComun
{
    public dynamic datos_contrato { get; set; } = new System.Dynamic.ExpandoObject();

}
