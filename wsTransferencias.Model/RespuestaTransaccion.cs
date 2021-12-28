﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public class RespuestaTransaccion
    {
        public object cuerpo { get; set; }

        public string codigo { get; set; } = string.Empty;

        public Dictionary<string, string> diccionario { get; set; }

        public RespuestaTransaccion()
        {
            diccionario = new Dictionary<string, string>();
        }
    }
}
