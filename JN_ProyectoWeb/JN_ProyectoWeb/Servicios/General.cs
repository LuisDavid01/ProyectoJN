using JN_ProyectoWeb.Models;
using Microsoft.Extensions.Configuration;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text.Json;

namespace JN_ProyectoWeb.Servicios
{
    public class General : IGeneral
    {
        private readonly IHttpClientFactory _httpClient;
        private readonly IConfiguration _configuration;
        private readonly IHttpContextAccessor _contextAccessor;
        public General(IHttpClientFactory httpClient, IConfiguration configuration, IHttpContextAccessor contextAccessor)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _contextAccessor = contextAccessor;
        }

        public List<PuestosModel> ConsultarDatosPuestos(long Id)
        {
            using (var http = _httpClient.CreateClient())
            {
                var url = _configuration.GetSection("Variables:urlWebApi").Value + "Puestos/ConsultarPuestos?Id=" + Id;

                http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _contextAccessor.HttpContext!.Session.GetString("Token"));
                var response = http.GetAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    var result = response.Content.ReadFromJsonAsync<RespuestaModel>().Result;

                    if (result != null && result.Indicador)
                    {
                        return JsonSerializer.Deserialize<List<PuestosModel>>((JsonElement)result.Datos!)!;
                    }
                }

                return new List<PuestosModel>();
            }
        }

        public List<OfertasModel> ConsultarDatosOfertas(long Id)
        {
            using (var http = _httpClient.CreateClient())
            {
                var url = _configuration.GetSection("Variables:urlWebApi").Value + "Ofertas/ConsultarOfertas?Id=" + Id;

                http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", _contextAccessor.HttpContext!.Session.GetString("Token"));
                var response = http.GetAsync(url).Result;

                if (response.IsSuccessStatusCode)
                {
                    var result = response.Content.ReadFromJsonAsync<RespuestaModel>().Result;

                    if (result != null && result.Indicador)
                    {
                        return JsonSerializer.Deserialize<List<OfertasModel>>((JsonElement)result.Datos!)!;
                    }
                }
            }

            return new List<OfertasModel>();
        }

    }
}
