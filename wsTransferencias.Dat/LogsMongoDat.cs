using AccesoDatosGrpcMongo.Neg;
using Grpc.Net.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using wsTransferencias.Log;
using wsTransferencias.Model;
using static AccesoDatosGrpcMongo.Neg.DALMongo;

namespace wsTransferencias.Dat
{
	public class LogsMongoDat
	{
		private InfoLog infoLog;
		private const string str_salida_error = "e:< ";
		private readonly DALMongoClient objClienteMongo;
		readonly string str_ruta;

		public LogsMongoDat(ServiceSettings _settings)
		{
			infoLog.str_clase = "LogsMongoDat";
			infoLog.str_tipo = str_salida_error;
			this.str_ruta = _settings.path_logs_consultas;

			var httpHandler = new HttpClientHandler();
			httpHandler.ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;
			var canal = GrpcChannel.ForAddress(_settings.servicio_grpc_mongo);
			objClienteMongo = new DALMongoClient(canal);
		}

		public RespuestaTransaccion GuardarCabeceraMongo(object? cabecera)
		{
			var respuesta = new RespuestaTransaccion();
			var ds = new DatosSolicitud();
			try
			{
				String ser_cabecera = JsonSerializer.Serialize(cabecera);
				ds.StrNameBD = "wsTransferencias";
				ds.NombreColeccion = "peticiones";
				ds.Filter = String.Empty;
				ds.SolTran = ser_cabecera;

				DatosRespuesta res = objClienteMongo.insertar_documento(ds);
				respuesta.codigo = "000";
				respuesta.cuerpo = res.Mensaje;
			}
			catch (Exception ex)
			{
				respuesta.codigo = "001";
				respuesta.diccionario.Add("str_error", ex.ToString());
			}

			return respuesta;
		}


		public RespuestaTransaccion GuardarRespuestaMongo(ResComun obj_respuesta)
		{
			var respuesta = new RespuestaTransaccion();
			var ds = new DatosSolicitud();
			try
			{
				var bjson = new
				{
					idHeader = obj_respuesta.str_id_transaccion,
					rsc_res_original_id_msj = obj_respuesta.str_res_original_id_msj,
					rsc_res_original_id_servicio = obj_respuesta.str_res_original_id_servicio,
					rsc_res_fecha_msj_crea = obj_respuesta.dt_res_fecha_msj_crea,
					rsc_res_estado_transaccion = obj_respuesta.str_res_estado_transaccion,
					rsc_res_codigo = obj_respuesta.str_res_codigo,
					rsc_res_id_servidor = obj_respuesta.str_id_servicio,
					rsc_res_info_adicional = obj_respuesta.str_res_info_adicional
				};

				String ser_cabecera = JsonSerializer.Serialize(bjson);
				ds.StrNameBD = "wsTransferencias";
				ds.NombreColeccion = "respuesta";
				ds.Filter = String.Empty;
				ds.SolTran = ser_cabecera;

				DatosRespuesta res = objClienteMongo.insertar_documento(ds);
				respuesta.codigo = "000";
				respuesta.cuerpo = res.Mensaje;
			}
			catch (Exception ex)
			{
				respuesta.codigo = "001";
				respuesta.diccionario.Add("str_error", ex.ToString());
			}

			return respuesta;
		}

		public RespuestaTransaccion GuardarExcepcionesMongo(ResComun obj_respuesta, object excepcion)
		{
			var respuesta = new RespuestaTransaccion();
			var ds = new DatosSolicitud();
			try
			{
				var bjson = new
				{
					idHeader = obj_respuesta.str_id_transaccion,
					str_id_servicio = obj_respuesta.str_id_servicio,
					str_nemonico_canal = obj_respuesta.str_nemonico_canal,
					dt_fecha_operacion = obj_respuesta.dt_fecha_operacion,
					str_ip_dispositivo = obj_respuesta.str_ip_dispositivo,
					str_login = obj_respuesta.str_login,
					str_id_oficina = obj_respuesta.str_id_oficina,
					rsc_res_info_adicional = obj_respuesta.str_res_info_adicional,
					error = excepcion.ToString()
				};

				String ser_cabecera = JsonSerializer.Serialize(bjson);
				ds.StrNameBD = "wsTransferencias";
				ds.NombreColeccion = "errores";
				ds.Filter = String.Empty;
				ds.SolTran = ser_cabecera;

				DatosRespuesta res = objClienteMongo.insertar_documento(ds);
				respuesta.codigo = "000";
				respuesta.cuerpo = res.Mensaje;
			}
			catch (Exception ex)
			{
				respuesta.codigo = "001";
				respuesta.diccionario.Add("str_error", ex.ToString());
			}

			return respuesta;
		}

	}

}
