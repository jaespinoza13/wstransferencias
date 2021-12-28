using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public class Respuesta : IRespuesta
    {
        public string str_res_original_id_msj { get; set; } = string.Empty;
        public string str_res_original_id_servicio { get; set; } = string.Empty;
        public DateTime dt_res_fecha_msj_crea { get; set; } = DateTime.Now;
        public string str_res_estado_transaccion { get; set; } = string.Empty;
        public string str_res_codigo { get; set; } = string.Empty;
        public int int_res_id_servidor { get; set; }
        public string str_res_info_adicional { get; set; } = string.Empty;

        public void LlenarResComun(string str_res_original_id_msj, string str_res_original_id_servicio, DateTime dt_res_fecha_msj_crea)
        {
        }
    }
}
