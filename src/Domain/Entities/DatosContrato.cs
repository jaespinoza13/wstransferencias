using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Entities
{
    public class DatosContrato
    {
        public string str_contrato { get; set; } = String.Empty;
        public string str_nombre_socio { get; set; } = String.Empty;
        public string str_num_documento { get; set; } = String.Empty;
        public string str_canal { get; set; } = String.Empty;
        public int int_tipo_documento { get; set; }

    }
}
