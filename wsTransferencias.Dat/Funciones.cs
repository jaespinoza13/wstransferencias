using AccesoDatosGrpcAse.Neg;
using System.Text.Json;
using wsTransferencias.Dto;
using wsTransferencias.Model;

namespace wsTransferencias.Dat
{
    public static class Funciones
    {
        /// <summary>
        /// Obtiene el conjunto de datos formateados
        /// </summary>
        /// <param name="resultado"></param>
        /// <returns></returns>
        public static ConjuntoDatos ObtenerDatos ( DatosRespuesta resultado )
        {
            ConjuntoDatos cd = new ConjuntoDatos();
            var lst_tablas = new List<Tabla>();
            for (int k = 0; k < resultado.ListaTablas.Count; k++)
            {
                var lst_filas = new List<Dto.Fila>();
                for (int i = 0; i < resultado.ListaTablas[k].ListaFilas.Count; i++)
                {
                    Dto.Fila fila = new Dto.Fila();

                    for (int j = 0; j < resultado.ListaTablas[k].ListaFilas[i].ListaColumnas.Count; j++)
                    {

                        fila.nombre_valor.Add(resultado.ListaTablas[k].ListaFilas[i].ListaColumnas[j].NombreCampo, resultado.ListaTablas[k].ListaFilas[i].ListaColumnas[j].Valor);
                    }
                    lst_filas.Add(new Dto.Fila { nombre_valor = fila.nombre_valor });
                }
                lst_tablas.Add(new Tabla { lst_filas = lst_filas });
            }
            cd.lst_tablas = lst_tablas;
            return cd;
        }


        public static void SaveExcepcionDataBaseSybase(SettingsApi _settingsApi, Header transaction, String str_metodo, Exception excepcion, string str_clase)
        {
            try
            {
                InfoLog infoLog = new();
                infoLog.str_clase = str_clase;
                infoLog.str_operacion = transaction.str_id_servicio;
                infoLog.str_objeto = transaction;
                infoLog.str_metodo = str_metodo;
                infoLog.str_fecha = DateTime.Now;

                Random random = new Random();
                RespuestaTransaccion res_tran_logs = new LogsMongoDat(_settingsApi).GuardarExcepcionesDataBase(transaction, excepcion);
                string str_id_transaccion = res_tran_logs.codigo.Equals("000") ? (String)res_tran_logs.cuerpo : new string(Enumerable.Repeat("0123456789", 20).Select(s => s[random.Next(s.Length)]).ToArray());
                infoLog.str_id_transaccion = str_id_transaccion;
                infoLog.str_tipo = "e:<";



                if (!File.Exists(_settingsApi.path_logs_errores))
                {
                    Directory.CreateDirectory(_settingsApi.path_logs_errores);
                }

                string fileName = Path.Combine(_settingsApi.path_logs_errores, DateTime.Now.ToString("yyyyMMdd") + ".txt");

                using (var fs = File.Open(fileName, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                {
                    using (var writer = new StreamWriter(fs))
                    {
                        writer.WriteLine(DateTime.Now.ToString("HHmmssff") + " " + infoLog.str_tipo + JsonSerializer.Serialize(excepcion.ToString()) + " ");
                    }
                    fs.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }


       
    }
}
