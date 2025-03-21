using Dapper;
using JN_ProyectoApi.Models;
using JN_ProyectoApi.Servicios;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Reflection;

namespace JN_ProyectoApi.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    [Route("api/[controller]")]
    [ApiController]
    public class ErrorController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IGeneral _general;
        public ErrorController(IConfiguration configuration, IGeneral general)
        {
            _configuration = configuration;
            _general = general;
        }

        [Route("CapturarError")]
        public IActionResult CapturarError()
        {
            var ex = HttpContext.Features.Get<IExceptionHandlerFeature>();

            using (var context = new SqlConnection(_configuration.GetSection("ConnectionStrings:BDConnection").Value))
            {
                var IdUsuario = _general.ObtenerUsuarioFromToken(User.Claims);
                var Mensaje = ex!.Error.Message;
	            var Origen = ex.Path;

                context.Execute("RegistrarError", new { IdUsuario, Mensaje, Origen });
            }

            var respuesta = new RespuestaModel();
            respuesta.Indicador = false;
            respuesta.Mensaje = "Se presentó un problema en el sistema.";

            return Ok(respuesta);
        }

    }
}
