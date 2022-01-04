using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public class SolicitudTransaccion
    {
        public Cabecera cabecera { get; set; }
        public Object cuerpo { get; set; }
        public SolicitudTransaccion(Cabecera cabecera, Object cuerpo)
        {
            this.cabecera = cabecera;
            this.cuerpo = cuerpo;
        }
        public SolicitudTransaccion()
        {

        }
    }
}
