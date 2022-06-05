
using Domain.Parameters;

namespace Application.Common.Interfaces;
public interface IParametersInMemory
{
    List<Parametro> lst_errores();
    List<Parametro> lst_parametros();
    void ValidaParametros();
    void LoadConfiguration();
    Parametro FindErrorCode(string str_codigo);
    Parametro FindParametro(string str_nemonico);
}