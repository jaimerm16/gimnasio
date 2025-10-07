package org.iesalixar.daw2.JaimeRamirezMuela.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.iesalixar.daw2.JaimeRamirezMuela.dao.PagoDAO;
import org.iesalixar.daw2.JaimeRamirezMuela.dao.PagoDAOImpl;
import org.iesalixar.daw2.JaimeRamirezMuela.entity.Pago;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/PagoServlet")
public class PagoServlet extends HttpServlet {

    private PagoDAO pagoDAO = new PagoDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        String codSocioParam = request.getParameter("codSocio");

        if (action == null || action.equals("listar")) {
            // 1️⃣ Listar todos los pagos de todos los clientes
            List<Pago> listaPagos = pagoDAO.getAllPagos();
            BigDecimal total = listaPagos.stream()
                    .map(p -> BigDecimal.valueOf(p.getMonto()))
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            request.setAttribute("listaPagos", listaPagos);
            request.setAttribute("totalPagado", total);

            request.getRequestDispatcher("/pago-list.jsp").forward(request, response);
            return;
        }

        if ("verCliente".equals(action) && codSocioParam != null) {
            // 2️⃣ Listar solo los pagos de un cliente
            int codSocio = Integer.parseInt(codSocioParam);
            List<Pago> listaPagos = pagoDAO.getPagosBySocio(codSocio);

            // No se muestra el total aquí, pero puedes calcularlo si quieres
            BigDecimal totalCliente = listaPagos.stream()
                    .map(p -> BigDecimal.valueOf(p.getMonto()))
                    .reduce(BigDecimal.ZERO, BigDecimal::add);

            request.setAttribute("listaPagos", listaPagos);
            request.setAttribute("totalPagado", totalCliente); // opcional, si quieres mostrarlo
            request.setAttribute("soloCliente", true); // marca que es filtrado

            request.getRequestDispatcher("/pago-list.jsp").forward(request, response);
            return;
        }

        // Resto de acciones (nuevo, editar, eliminar) aquí...
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
