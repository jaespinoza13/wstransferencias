﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public interface IRespuesta
    {
        string str_res_original_id_msj { get; set; }
        string str_res_original_id_servicio { get; set; }
        DateTime dt_res_fecha_msj_crea { get; set; }
        string str_res_estado_transaccion { get; set; }
        string str_res_codigo { get; set; }
        int int_res_id_servidor { get; set; }
        string str_res_info_adicional { get; set; }

        void LlenarResComun(string str_res_original_id_msj, string str_res_original_id_servicio, DateTime dt_res_fecha_msj_crea);
    }
}
