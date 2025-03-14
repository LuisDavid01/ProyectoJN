using JN_ProyectoWeb.Models;

namespace JN_ProyectoWeb.Servicios
{
    public interface IGeneral
    {
        List<PuestosModel> ConsultarDatosPuestos(long Id);
        List<OfertasModel> ConsultarDatosOfertas(long Id);
    }
}
