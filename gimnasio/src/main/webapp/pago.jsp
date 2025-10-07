<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Pagos del Socio</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f4f8; padding: 50px 0; }
        .card-container {
            width: 95%; max-width: 1000px; margin: auto;
            background-color: rgba(255,255,255,0.95); padding: 30px; border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2); backdrop-filter: blur(5px);
        }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { text-align: center; vertical-align: middle; padding: 8px; }
        th { background: linear-gradient(90deg, #4b6cb7, #182848); color: white; }
        td { background-color: rgba(75,108,183,0.05); }
        .btn-back { background: linear-gradient(90deg, #11998e, #38ef7d); color: #fff; padding: 6px 12px; border-radius: 8px; text-decoration: none; }
    </style>
</head>
<body>

    <div class="card-container">
        <h2 class="text-center">Pagos del Socio</h2>

        <div class="text-center mb-4">
            <a href="SocioServlet" class="btn-back">Volver a Socios</a>
        </div>

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Código Pago</th>
                        <th>Monto</th>
                        <th>Fecha</th>
                        <th>Método</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${listaPagos}">
                        <tr>
                            <td>${p.codPago}</td>
                            <td>${p.monto}</td>
                            <td>${p.fechaPago}</td>
                            <td>${p.metodoPago}</td>
                            <td>${p.estadoPago}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty listaPagos}">
                        <tr>
                            <td colspan="5">No hay pagos registrados para este socio.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
