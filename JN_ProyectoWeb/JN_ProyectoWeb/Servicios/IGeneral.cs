using JN_ProyectoWeb.Models;

namespace JN_ProyectoWeb.Servicios
{
    public interface IGeneral
    {
        HttpResponseMessage ConsultarDatosPuestos(long Id);
        HttpResponseMessage ConsultarDatosOfertas(long Id);

        HttpResponseMessage ConsultarDatosOfertasDisponibles();
        string Encrypt(string texto);
    }
}
