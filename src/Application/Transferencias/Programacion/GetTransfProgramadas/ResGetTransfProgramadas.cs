

using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Programacion;

public class ResGetTransfProgramadas : ResComun
{
    public List<TransferenciasProgramadas>? lst_tranferencias { get; set; }

}

