using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Dto
{
    public class Transaccion
    {
        public string str_tipo_tran { get; set; } //Consutla->CON, Transferencia Ahorros->TRAH, Transferencia Corriente->TRCO, Tarjeta de Crédito->TRTC
        public int int_secuencial { get; set; }
        public string str_nom_ordenante { get; set; }
        public int int_fi_aut { get; set; }
        public string str_bin_aut { get; set; }
        public string str_cuenta_ordenante { get; set; }
        public string str_observaciones { get; set; } //maximo de 10 caracteres
        public string str_identificacion_ordenante { get; set; }
        public int int_secuencial_cobis { get; set; }
        public string str_nom_receptor { get; set; }
        public string str_cuenta_receptor { get; set; }
        public string str_cuenta_bce { get; set; }
        public string str_info_adicional { get; set; }
        public string str_identificacion_receptor { get; set; }
        public string str_tipo_cuenta_receptor { get; set; } //04: Cuenta Corriente, 05: Cuenta Ahorros, 06: Cuenta Especial, 07: Dinero Electrónico
        public decimal dec_monto_tran { get; set; }
        public int int_id_comprobar_transfer { get; set; }
        public int int_num_referencia { get; set; } //Nuevo para enviar un numero de referencia para transacciones fuera de linea. Beebot es el id de cht_transacciones.
        public override string ToString()
        {
            return " str_tipo_tran: " + str_tipo_tran +
                 " int_secuencial: " + int_secuencial +
                 " str_nom_ordenante: " + str_nom_ordenante +
                 " int_fi_aut: " + int_fi_aut +
                 " str_bin_aut: " + str_bin_aut +
                 " str_cuenta_ordenante: " + str_cuenta_ordenante +
                 " str_observaciones: " + str_observaciones +
                 " str_identificacion_ordenante: " + str_identificacion_ordenante +
                 " int_secuencial_cobis: " + int_secuencial_cobis +
                 " str_nom_receptor: " + str_nom_receptor +
                 " str_cuenta_receptor: " + str_cuenta_receptor +
                 " str_banco_receptor: " + str_cuenta_bce +
                 " str_info_adicional: " + str_info_adicional +
                 " str_identificacion_receptor: " + str_identificacion_receptor +
                 " str_tipo_cuenta_receptor: " + str_tipo_cuenta_receptor +
                 " dec_monto_tran: " + dec_monto_tran +
                 " int_id_comprobar_transfer: " + int_id_comprobar_transfer +
                 " int_num_referencia " + int_num_referencia;
        }
    }
}
