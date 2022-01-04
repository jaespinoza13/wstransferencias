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
                        respuesta = new BeneficiariosNeg(serviceSettings).procesar_datos_beneficiarios(req_beneficiarios, str_operacion);
                        break;
                    case "VALIDAR_REGISTRO_BENEFICIARIOS":
                        jsonString = JsonSerializer.Serialize(sol_tran);
                        var valida_beneficiarios = JsonSerializer.Deserialize<ReqBeneficiarios>(jsonString);
                        respuesta = new BeneficiariosNeg(serviceSettings).validar_registro_beneficiarios(valida_beneficiarios, str_operacion);

                        break;
                    case "VALIDA_TRANSFERENCIA":

                        jsonString = JsonSerializer.Serialize(sol_tran);
                        var valida_transferencia = JsonSerializer.Deserialize<ReqValidacionTransferenciaDto>(jsonString);
                        respuesta = new TransferenciasNeg(serviceSettings).validar_transferencia(valida_transferencia, str_operacion);

                        break;
                    case "ADD_TRANSFERENCIA":


                        jsonString = JsonSerializer.Serialize(sol_tran);
                        var add_transferencia = JsonSerializer.Deserialize <ReqTransferencia>(jsonString);
                        respuesta = new TransferenciasNeg(serviceSettings).add_transferencia(add_transferencia, str_operacion);

                        break;
                        //case "GET_CONSULTA_TRANSFERENCIAS":
                        //    respuesta = get_consulta_transferencias(sol_tran);
                        //    break;
                        //case "GET_REIMPRESION_COMPROBANTE":
                        //    respuesta = get_reimpresion_comprobante(sol_tran);
                        //break;
                        default:
                        break;

                }
            }
            catch (Exception)
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
