using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Dto
{
    public class DatosValidadosTransaccion
    {
        public string str_nombre_ordenante { get; set; }
        public int int_ente { get; set; }
        public string str_descrip_moneda_ordenante { get; set; }
        public string str_descrip_tipo_cta_ordenante { get; set; }
        public string str_num_cta_ordenante { get; set; }
        public string str_num_doc_ordenante { get; set; }
        public int int_id_cta_ordenante { get; set; }

        /// <summary>
        /// Datos receptor - beneficiario
        /// </summary>
        public int int_fi_aut { get; set; }
        public string str_bin_aut { get; set; }
        public string str_num_doc_benef { get; set; }
        /// <summary>
        /// 04: Cuenta Corriente, 05: Cuenta Ahorros, 06: Cuenta Especial, 07: Dinero Electrónico
        /// </summary>
        public string str_tipo_cta_benef { get; set; }
        public string str_nombre_benef { get; set; }
        public string str_num_cta_benef { get; set; }
        public string str_cta_bce_ifi_benef { get; set; }
        public string str_nombre_ifi_benef { get; set; }
        public string str_desc_tipo_cta_benef { get; set; }
        public string str_correo_benef { get; set; }
        public string str_alias_cta_benef { get; set; }
        public string str_desc_tip_tarj_cre_benef { get; set; }
        public int int_tipo_benef { get; set; }
        public int int_tipo_tarj_cred_benef { get; set; }


        /// <summary>
        /// Consutla->CON, Transferencia Ahorros->TRAH, Transferencia Corriente->TRCO, Tarjeta de Crédito->TRTC
        /// </summary>
        public string str_tipo_tran { get; set; }
        public int int_secuencial { get; set; }
        /// <summary>
        /// maximo de 10 caracteres
        /// </summary>
        public string str_observaciones { get; set; }
        public int int_secuencial_cobis { get; set; }
        public string str_info_adicional { get; set; }
        public decimal dec_monto_tran { get; set; }

        public int int_id_cta_beneficiario { get; set; }

        public decimal dec_comision { get; set; }
        public int int_id_debito { get; set; }
        public string str_fecha_transac { get; set; }
        public string str_fecha_inicio { get; set; }
        public string str_fecha_fin { get; set; }
        public string str_hora { get; set; }
        public int int_id_comprobar_transfer { get; set; }
        public string str_tipo_transferencia { get; set; }
        public int int_num_referencia { get; set; }
        public int int_id_comision { get; set; }
        public int int_id_otra_comision { get; set; }
        public int int_estado { get; set; }
        public int int_enviar_banred { get; set; }

    }
}
