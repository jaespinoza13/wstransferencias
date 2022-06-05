using Application.Common.Interfaces;
using Domain.Parameters;

namespace Application.Common.Validations;

public interface IParametersToValidate
{
    Parametro FindParametro(string str_nemonico);
}

public class ParametersToValidate : IParametersToValidate
{
    private readonly IParametersInMemory _memoryCache;
    public ParametersToValidate(IParametersInMemory memory)
    {
        _memoryCache = memory;
    }

    public Parametro FindParametro(string str_nemonico) => _memoryCache.FindParametro(str_nemonico);
    //public Parametro FindErrorCode(string str_codigo) => _memoryCache.FindErrorCode(str_codigo);
}