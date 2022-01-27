using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
    public class ResGetCupos : ResComun
    {
        public List<Cupo> lst_cupos  { get; set; }

        public class Cupo
        {
            public int int_id_config_servicio { get; set; }
            public int int_id_cupo { get; set; }
            public int int_id_periodo { get; set; }
            public string str_num_acumula { get; set; } = String.Empty;
            public decimal dcm_monto_maximo { get; set; }
            public decimal dcm_monto { get; set; }
            public int int_frecuencia_maxima { get; set; }
            public int int_frecuencia { get; set; }
            public string str_nombre_periodo { get; set; } = String.Empty;
        }
      
    }
}
