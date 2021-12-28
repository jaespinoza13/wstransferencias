using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wsTransferencias.Dto;

namespace wsTransferencias.Neg.Utils
{
    public static class Utils
    {

        #region Métodos "Conversión de Conjunto de Datos a un objeto/Lista de una Clase"
        /// <summary>
        /// Convierte un Conjunto de datos a una lista de una Clase específica
        /// </summary>
        /// <param name="int_longitud"></param>
        /// <returns></returns>
        public static List<T> ConvertConjuntoDatosToListClass<T>(ConjuntoDatos cuerpo)
        {
            List<T> lst_array = new List<T>();

            ConjuntoDatos conjuntoDatos = cuerpo;

            foreach (var item in conjuntoDatos.lst_tablas[0].lst_filas)
            {
                T obj = (T)Converting.MapDictToObj(item.nombre_valor, typeof(T));
                lst_array.Add(obj);
            }

            return lst_array;
        }


        /// <summary>
        /// Convierte un Conjunto de datos a un objeto de una Clase específica
        /// </summary>
        /// <param name="int_longitud"></param>
        /// <returns></returns>
        public static T? ConvertConjuntoDatosToClass<T>(ConjuntoDatos cuerpo)
        {
            ConjuntoDatos conjuntoDatos = cuerpo;
            T? obj = default(T);
            foreach (var item in conjuntoDatos.lst_tablas[0].lst_filas)
            {
                obj = (T)Converting.MapDictToObj(item.nombre_valor, typeof(T));
            }

            return obj;
        }
        #endregion

        #region Método "Generar número aleatorio"
        /// <summary>
        /// Genera un número aleatorio en string
        /// </summary>
        /// <returns></returns>
        internal static string GeneraCadenaAleatoria()
        {
            Random random = new Random();
            const string characters = "0123456789";
            return new string(Enumerable.Repeat(characters, 20)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        #endregion

    }
}
