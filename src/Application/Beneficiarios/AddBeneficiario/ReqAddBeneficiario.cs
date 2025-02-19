﻿
using Application.Common.ISO20022.Models;
using MediatR;

namespace Application.Beneficiarios;

public class ReqAddBeneficiario : Header, IRequest<ResAddBeneficiario>
{
    public string? str_codigo_ifi { get; set; }
    public int int_tipo_producto { get; set; }
    public int int_favorito { get; set; }
    public string? str_num_cta { get; set; }
    public string? str_num_documento { get; set; }
    public string? str_nombres { get; set; }
    public string? str_email { get; set; }
    public string? str_alias_cta { get; set; }
    public string? str_tipo_beneficiario { get; set; }
    public string? str_otp { get; set; }
    public int int_tipo_tarjeta { get; set; }
}