using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace wsTransferencias.Model
{
    public class Cabecera
    {
        public int int_sistema { get; set; }
        public string str_usuario { get; set; }
        public int int_perfil { get; set; }
        public int int_oficina { get; set; }
        public int int_canal { get; set; }
        public string str_nemonico_canal { get; set; }
        public string str_ip { get; set; }
        public string str_session { get; set; }
        public string str_mac { get; set; }
        public string str_nombre_canal { get; set; }
        public Cabecera()
        {

        }
        public override string ToString()
        {
            return base.ToString() + " int_sistema: " + int_sistema +
                                    " str_usuario: " + str_usuario +
                                    " int_perfil: " + int_perfil +
                                    " int_oficina: " + int_oficina +
                                    " int_canal: " + int_canal +
                                    " str_nemonico_canal: " + str_nemonico_canal +
                                    " str_ip: " + str_ip +
                                    " str_session: " + str_session +
                                    " str_mac: " + str_mac +
                                    " str_nombre_canal: " + str_nombre_canal;
        }

    }
}
