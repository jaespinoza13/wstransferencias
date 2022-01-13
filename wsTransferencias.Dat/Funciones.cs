using AccesoDatosGrpcAse.Neg;
using wsTransferencias.Dto;

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


       
    }
}
