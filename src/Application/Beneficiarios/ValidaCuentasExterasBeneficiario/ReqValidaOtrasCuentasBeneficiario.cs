﻿
using MediatR;

using Application.Common.ISO20022.Models;

namespace Application.Beneficiarios;

public class ReqValidaOtrasCuentasBeneficiario : Header, IRequest<ResValidaOtrasCuentasBeneficiario>
{
    public string str_codigo_ifi { get; set; } = "0";
    public int int_tipo_producto { get; set; }
    public string? str_num_cta { get; set; } = String.Empty;
    public string? str_num_celular { get; set; } = String.Empty;
    public string? str_num_documento { get; set; }
    public string? str_tipo_beneficiario { get; set; }
}