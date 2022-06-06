using Application.Common.Exceptions;
using Application.Common.ISO20022.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;


namespace WebUI.Filters
{
    public class ApiExceptionFilterAttribute : ExceptionFilterAttribute
    {
        private readonly IDictionary<Type, Action<ExceptionContext>> _exceptionHandlers;
        private readonly ResBadRequestException resBadRequestException = new();
        private readonly ResException resException = new();

        private readonly ILogger<ApiExceptionFilterAttribute> logger;

        public ApiExceptionFilterAttribute(ILogger<ApiExceptionFilterAttribute> logger)
        {
            this.logger = logger;
            _exceptionHandlers = new Dictionary<Type, Action<ExceptionContext>>
            {
                { typeof(NullReferenceException), HandleNullReferenceException },
                { typeof(ArgumentException), HandleArgumentException },
                { typeof(ValidationException), HandleValidationException },
                { typeof(NotFoundException), HandleNotFoundException },
                { typeof(UnauthorizedAccessException), HandleUnauthorizedAccessException },
                { typeof(ForbiddenAccessException), HandleForbiddenAccessException },
            };
        }

        public override void OnException(ExceptionContext context)
        {
            logger.LogError( context.Exception, context.Exception.Message );
            HandleException( context );

            base.OnException( context );
        }

        private void HandleException(ExceptionContext context)
        {
            Type type = context.Exception.GetType();

            if (_exceptionHandlers.ContainsKey( type ))
            {
                _exceptionHandlers[type].Invoke( context );
            }

            if (!context.ModelState.IsValid)
            {
                HandleInvalidModelStateException( context );
            }
        }

        private void HandleNullReferenceException(ExceptionContext context)
        {
            resException.str_id_transaccion = "NullReferenceException";
            resException.dt_res_fecha_msj_crea = DateTime.Now;
            resException.str_res_codigo = "001";
            resException.str_res_id_servidor = System.Net.HttpStatusCode.InternalServerError.ToString();
            resException.str_res_estado_transaccion = "ERR";
            resException.str_res_info_adicional = "Ocurrio un problema, intente nuevamente más tarde";

            context.HttpContext.Response.StatusCode = (int)System.Net.HttpStatusCode.InternalServerError;
            context.Result = new ObjectResult( resException );
            context.ExceptionHandled = true;
        }

        private void HandleArgumentException(ExceptionContext context)
        {
            var exception = (ArgumentException)context.Exception;

            resException.str_id_transaccion = exception.Message;
            resException.dt_res_fecha_msj_crea = DateTime.Now;
            resException.str_res_codigo = "001";
            resException.str_res_id_servidor = System.Net.HttpStatusCode.InternalServerError.ToString();
            resException.str_res_estado_transaccion = "ERR";
            resException.str_res_info_adicional = "Ocurrio un problema, intente nuevamente más tarde";

            context.HttpContext.Response.StatusCode = (int)System.Net.HttpStatusCode.InternalServerError;
            context.Result = new ObjectResult( resException );
            context.ExceptionHandled = true;
        }

        private void HandleInvalidModelStateException(ExceptionContext context)
        {
            var details = new ValidationProblemDetails( context.ModelState );

            resBadRequestException.dt_res_fecha_msj_crea = DateTime.Now;
            resBadRequestException.str_res_codigo = "001";
            resBadRequestException.str_res_id_servidor = System.Net.HttpStatusCode.BadRequest.ToString();
            resBadRequestException.str_res_estado_transaccion = "ERR";
            resBadRequestException.str_res_info_adicional = "Petición Inválida";

            resBadRequestException.obj_res_detalle_errores = (Dictionary<string, string[]>)details.Errors;

            context.Result = new BadRequestObjectResult( resBadRequestException );
            context.ExceptionHandled = true;
        }


        private void HandleValidationException(ExceptionContext context)
        {
            var exception = (ValidationException)context.Exception;

            var details = new ValidationProblemDetails( exception.Errors );

            resBadRequestException.dt_res_fecha_msj_crea = DateTime.Now;
            resBadRequestException.str_res_codigo = "001";
            resException.str_res_id_servidor = System.Net.HttpStatusCode.BadRequest.ToString();
            resBadRequestException.str_res_estado_transaccion = "ERR";
            resBadRequestException.str_res_info_adicional = "Petición Inválida";

            resBadRequestException.obj_res_detalle_errores = (Dictionary<string, string[]>)details.Errors;

            context.Result = new BadRequestObjectResult( resException );
            context.ExceptionHandled = true;
        }

        private void HandleUnauthorizedAccessException(ExceptionContext context)
        {
            var details = new ProblemDetails
            {
                Status = StatusCodes.Status401Unauthorized,
                Title = "Unauthorized",
                Type = "https://tools.ietf.org/html/rfc7235#section-3.1"
            };

            context.Result = new ObjectResult( details )
            {
                StatusCode = StatusCodes.Status401Unauthorized
            };

            context.ExceptionHandled = true;
        }

        private void HandleForbiddenAccessException(ExceptionContext context)
        {
            var details = new ProblemDetails
            {
                Status = StatusCodes.Status403Forbidden,
                Title = "Forbidden",
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.3"
            };

            context.Result = new ObjectResult( details )
            {
                StatusCode = StatusCodes.Status403Forbidden
            };

            context.ExceptionHandled = true;
        }

        private void HandleNotFoundException(ExceptionContext context)
        {
            var exception = (NotFoundException)context.Exception;

            var details = new ProblemDetails()
            {
                Type = "https://tools.ietf.org/html/rfc7231#section-6.5.4",
                Title = "The specified resource was not found.",
                Detail = exception.Message
            };

            context.Result = new NotFoundObjectResult( details );

            context.ExceptionHandled = true;
        }
    }
}
