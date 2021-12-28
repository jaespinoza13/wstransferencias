using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public class ServiceSettings
    {
        public string BD_megservicios { get; set; }
        public string BD_megsistemas { get; set; }


        public string servicio_grpc_sybase { get; set; }
        public string servicio_grpc_mongo { get; set; }

        public string path_logs_consultas { get; set; }

        public string user_ws_consultas { get; set; }
        public string pass_ws_consultas { get; set; }


        public const string Beneficiarios = "Beneficiarios";
        public string add_beneficiarios { get; set; }
        public string update_beneficiarios { get; set; }
        public string delete_beneficiarios { get; set; }
        public string listado_beneficiarios { get; set; }
      
    }
}
