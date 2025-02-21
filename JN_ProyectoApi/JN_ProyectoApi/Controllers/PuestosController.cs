using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JN_ProyectoApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PuestosController : ControllerBase
    {
        [Authorize]
        [HttpGet]
        [Route("ConsultarPuestos")]
        public IActionResult ConsultarPuestos() 
        {
            return Ok();
        }
    }
}
