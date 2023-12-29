

using Application.Common.Cryptography;
using Application.Common.ISO20022.Models;
using Domain.Entities;

namespace Application.Programacion;

public class ResGetTransfEjecucion : ResComun
{
    public List<TransferenciasEjecucion> lst_tranferencias { get; set; } = new();
    

}

