using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Log
{
    public class LogServicios
    {
        private static object objetoBloqueo = new object();
        private static object objetoBloqueoJson = new object();
        public static void RegistrarTramas(string strTramaRequest, string rutaArchivo)
        {
            try
            {
                lock (objetoBloqueo)
                {
                    string fileName = rutaArchivo + DateTime.Now.ToString("yyyyMMdd") + ".txt";
                    using (var fs = File.Open(fileName, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                    {
                        using (var writer = new StreamWriter(fs))
                        {
                            writer.WriteLine(DateTime.Now.ToString("HHmmssff") + " " + strTramaRequest + " ");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

        }
        public static void RegistrarTramas(String str_tipo, Object obj, string rutaArchivo)
        {
            try
            {
                lock (objetoBloqueoJson)
                {
                    string fileName = rutaArchivo + DateTime.Now.ToString("yyyyMMdd") + ".txt";
                    using (var fs = File.Open(fileName, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
                    {
                        using (var writer = new StreamWriter(fs))
                        {
                            writer.WriteLine(DateTime.Now.ToString("HHmmssff") + " " + str_tipo + JsonConvert.SerializeObject(obj) + " ");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

        }
    }
}
