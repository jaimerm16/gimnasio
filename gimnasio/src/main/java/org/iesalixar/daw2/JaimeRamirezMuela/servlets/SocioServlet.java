package org.iesalixar.daw2.JaimeRamirezMuela.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.iesalixar.daw2.JaimeRamirezMuela.dao.SocioDAOImpl;
import org.iesalixar.daw2.JaimeRamirezMuela.dao.PagoDAOImpl;
import org.iesalixar.daw2.JaimeRamirezMuela.entity.Socio;
import org.iesalixar.daw2.JaimeRamirezMuela.entity.Pago;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/SocioServlet")
public class SocioServlet extends HttpServlet {

    private SocioDAOImpl socioDAO = new SocioDAOImpl();
    private PagoDAOImpl pagoDAO = new PagoDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) action = "listar";

        switch (action) {
            case "nuevo":
                request.getRequestDispatcher("socio-form.jsp").forward(request, response);
                break;

            case "editar":
                int id = Integer.parseInt(request.getParameter("id"));
                Socio socio = socioDAO.getSocioById(id);
                request.setAttribute("socio", socio);
                request.getRequestDispatcher("socio-form.jsp").forward(request, response);
                break;

            case "eliminar":
                socioDAO.deleteSocio(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("SocioServlet");
                break;

            case "pagos":
                int socioId = Integer.parseInt(request.getParameter("id"));
                List<Pago> pagosSocio = pagoDAO.getPagosBySocio(socioId);
                request.setAttribute("listaPagos", pagosSocio);
                request.setAttribute("socioId", socioId);
                request.getRequestDispatcher("pago.jsp").forward(request, response);
                break;

            default: // listar
                List<Socio> lista = socioDAO.getAllSocios();
                request.setAttribute("listaSocios", lista);
                request.getRequestDispatcher("socio.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int codSocio = Integer.parseInt(request.getParameter("codSocio"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String tipoMembresia = request.getParameter("tipoMembresia");
        Date fechaInscripcion = Date.valueOf(request.getParameter("fechaInscripcion"));

        Socio socio = new Socio();
        socio.setCodSocio(codSocio);
        socio.setNombre(nombre);
        socio.setApellido(apellido);
        socio.setEdad(edad);
        socio.setTelefono(telefono);
        socio.setCorreo(correo);
        socio.setDireccion(direccion);
        socio.setTipoMembresia(tipoMembresia);
        socio.setFechaInscripcion(fechaInscripcion);

        // Si viene con "editar"
        String hidden = request.getParameter("hiddenAction");
        if ("editar".equals(hidden)) {
            socioDAO.updateSocio(socio);
        } else {
            socioDAO.insertSocio(socio);
        }
        response.sendRedirect("SocioServlet");
    }
}
