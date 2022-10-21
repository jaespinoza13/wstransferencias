
namespace Domain.Entities
{
    public class Transaccion
    {
        public string? str_tipo_tran { get; set; } //Consutla->CON, Transferencia Ahorros->TRAH, Transferencia Corriente->TRCO, Tarjeta de Crédito->TRTC
        public int int_secuencial { get; set; }
        public string? str_nom_ordenante { get; set; }
        public int int_fi_aut { get; set; }
        public string? str_bin_aut { get; set; }
        public string? str_cuenta_ordenante { get; set; }
        public string? str_observaciones { get; set; } //maximo de 10 caracteres
        public string? str_identificacion_ordenante { get; set; }
        public int int_secuencial_cobis { get; set; }
        public string? str_nom_receptor { get; set; }
        public string? str_cuenta_receptor { get; set; }
        public string? str_cuenta_bce { get; set; }
        public string? str_info_adicional { get; set; }
        public string? str_identificacion_receptor { get; set; }
        public string? str_tipo_cuenta_receptor { get; set; } //04: Cuenta Corriente, 05: Cuenta Ahorros, 06: Cuenta Especial, 07: Dinero Electrónico
        public decimal dec_monto_tran { get; set; }
        public int int_id_comprobar_transfer { get; set; }
        public int int_num_referencia { get; set; } //Nuevo para enviar un numero de referencia para transacciones fuera de linea. Beebot es el id de cht_transacciones.
    }
}
