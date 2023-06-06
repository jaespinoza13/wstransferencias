using AccesoDatosGrpcAse.Neg;
using Application.Common.Interfaces;
using Application.Common.Models;
using Application.Transferencias;
using Application.Transferencias.Consulta;
using Infrastructure.Common.Funciones;
using Microsoft.Extensions.Options;
using System.Reflection;
using static AccesoDatosGrpcAse.Neg.DAL;

namespace Infrastructure.gRPC_Clients.Sybase
{
    internal class ConsultaTransferenciasDat : IConsultaTransferencias
    {

        private readonly ApiSettings _settings;
        private readonly DALClient _objClienteDal;
        private readonly ILogs _logsService;
        private readonly string str_clase;

        public ConsultaTransferenciasDat(IOptionsMonitor<ApiSettings> options, ILogs logsService, DALClient objClienteDal)
        {
            _settings = options.CurrentValue;
            _logsService = logsService;

            this.str_clase = GetType().FullName!;

            _objClienteDal = objClienteDal;

        }

        public async Task<RespuestaTransaccion> ConsultaTransferencias(ReqConsultaTransferencias reqConsultaTransferencias)
        {
            RespuestaTransaccion respuesta = new RespuestaTransaccion();

            try
            {

                DatosSolicitud ds = new DatosSolicitud();
                Funciones.llenar_datos_auditoria_salida( ds, reqConsultaTransferencias );

                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_num_cta_ordenante", TipoDato = TipoDato.VarChar, ObjValue = reqConsultaTransferencias.str_num_cta_ordenante.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dt_fecha_ini", TipoDato = TipoDato.VarChar, ObjValue = reqConsultaTransferencias.str_fecha_inicio.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@dt_fecha_fin", TipoDato = TipoDato.VarChar, ObjValue = reqConsultaTransferencias.str_fecha_fin.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_filtro", TipoDato = TipoDato.VarChar, ObjValue = reqConsultaTransferencias.str_filtro.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@str_filtro_nem_canal", TipoDato = TipoDato.VarChar, ObjValue = reqConsultaTransferencias.str_filtro_nem_canal.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_ultimos_movimientos", TipoDato = TipoDato.Integer, ObjValue = reqConsultaTransferencias.int_ultimos_movimientos.ToString() } );
                ds.ListaPEntrada.Add( new ParametroEntrada { StrNameParameter = "@int_iteracion", TipoDato = TipoDato.Integer, ObjValue = reqConsultaTransferencias.int_iteracion.ToString() } );

                ds.ListaPSalida.Add( new ParametroSalida { StrNameParameter = "@int_num_registros", TipoDato = TipoDato.Integer } );

                ds.NombreSP = "get_con_transferencias_v2";

                ds.NombreBD = _settings.DB_meg_servicios;

                var resultado = await _objClienteDal.ExecuteDataSetAsync( ds );
                var lst_valores = new List<ParametroSalidaValores>();

                foreach (var item in resultado.ListaPSalidaValores) lst_valores.Add( item );
                var str_codigo = lst_valores.Find( x => x.StrNameParameter == "@int_o_error_cod" )!.ObjValue;
                var str_error = lst_valores.Find( x => x.StrNameParameter == "@str_o_error" )!.ObjValue.Trim();
                var num_total_pag = lst_valores.Find( x => x.StrNameParameter == "@int_num_registros" )!.ObjValue.Trim();

                respuesta.codigo = str_codigo.ToString().Trim().PadLeft( 3, '0' );
                respuesta.cuerpo = Funciones.ObtenerDatos( resultado );
                respuesta.diccionario.Add( "str_error", str_error.ToString() );
                respuesta.diccionario.Add( "int_num_registros", num_total_pag.ToString() );

            }
            catch (Exception exception)
            {
                respuesta.codigo = "001";
                respuesta.diccionario.Add( "str_error", exception.ToString() );
                _logsService.SaveExcepcionDataBaseSybase( reqConsultaTransferencias, MethodBase.GetCurrentMethod()!.Name, exception, str_clase );
                throw new Exception( reqConsultaTransferencias.str_id_transaccion )!;

            }
            return respuesta;
        }

    }


}
