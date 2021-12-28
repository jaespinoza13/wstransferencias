using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using wsTransferencias.Dto;
using wsTransferencias.Model;

namespace wsTransferencias.Neg
{
    public class wsTransferenciasNeg
    {
        private readonly ServiceSettings serviceSettings;
        public wsTransferenciasNeg(ServiceSettings settings)
        {
            this.serviceSettings = settings;
        }
        public object procesarSolicitud(Object sol_tran, string str_operacion)
        {
            object respuesta = new object();
            string jsonString = "";
            try
            {
                switch (str_operacion)
                {

                    case "BENEFICIARIOS":
                        jsonString = JsonSerializer.Serialize(sol_tran);
                        var req_beneficiarios = JsonSerializer.Deserialize<ReqBeneficiarios>(jsonString);                        
                        respuesta = new BeneficiariosNeg(serviceSettings).procesar_datos_beneficiarios(req_beneficiarios,str_operacion);
                        break;
                    case "VALIDAR_REGISTRO_BENEFICIARIOS":
                        jsonString = JsonSerializer.Serialize(sol_tran);
                        var valida_beneficiarios = JsonSerializer.Deserialize<ReqBeneficiarios>(jsonString);
                        respuesta = new BeneficiariosNeg(serviceSettings).validar_registro_beneficiarios(valida_beneficiarios, str_operacion); 

                        break;
                    default:
                        break;

                }
            }
            catch (Exception ex)
            {
                ResException resException = new ResException()
                {
                    str_res_estado_transaccion = "ERR",
                    str_res_codigo = "001",
                    str_res_info_adicional = "Ocurrio un problema. intente nuevamente más tarde."
                };
                return resException;
            }

            return respuesta;
        }
    }
}
