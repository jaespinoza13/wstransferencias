

using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Programacion;

public class ResGetDatosInicialesPT : ResComun
{
    public DatosInicialesPT datos { get; set; } = new();
}

