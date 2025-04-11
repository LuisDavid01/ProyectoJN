using JN_ProyectoWeb.Models;

namespace JN_ProyectoWeb.Servicios
{
    public interface IGeneral
    {
        HttpResponseMessage ConsultarDatosPuestos(long Id);
        HttpResponseMessage ConsultarDatosOfertas(long Id);
        HttpResponseMessage ConsultarDatosOfertasDisponibles();
        HttpResponseMessage ConsultarDatosOfertasAplicadas();
        HttpResponseMessage ConsultarDatosEstados();
        string Encrypt(string texto);
    }
}
