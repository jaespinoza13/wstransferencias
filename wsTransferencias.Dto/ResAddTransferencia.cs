using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Model;

namespace wsTransferencias.Dto
{
	public class ResAddTransferencia : ResComun
	{
		public AddTransferencia objAddTransferencia { get; set; }

		public class AddTransferencia
		{
			public int int_id_cta_ordenante { get; set; }
			public string str_descrip_tipo_cta_ordenante { get; set; }
			public string str_num_cta_ordenante { get; set; }
			public int int_ente { get; set; }
			public string str_num_doc_ordenante { get; set; }
			public string str_nombre_ordenante { get; set; }
			public string str_descrip_moneda_ordenante { get; set; }
			public int int_id_cta_beneficiario { get; set; }
			public string str_nombre_ifi_benef { get; set; }
			public string str_cta_bce_ifi_benef { get; set; }
			public string str_tipo_cta_benef { get; set; }
			public string str_desc_tipo_cta_benef { get; set; }
			public string str_num_cta_benef { get; set; }
			public int int_tipo_benef { get; set; }
			public int int_tipo_tarj_cred_benef { get; set; }
			public string str_desc_tip_tarj_cre_benef { get; set; }
			public string str_alias_cta_benef { get; set; }
			public string str_nombre_benef { get; set; }
			public string str_num_doc_benef { get; set; }
			public string str_correo_benef { get; set; }
			public decimal dec_monto_tran { get; set; }
			public decimal dec_comision { get; set; }
			public int int_id_comprobar_transfer { get; set; }
			public int int_enviar_banred { get; set; }
			public int int_num_referencia { get; set; }
			public string str_fecha_transac { get; set; }

		}

	}
}
