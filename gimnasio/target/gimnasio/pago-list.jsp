<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Pagos de Gimnasio</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f4f8; padding: 20px; }
        h2 { text-align: center; margin-bottom: 20px; color: #343a40; }
        table { width: 100%; background: #fff; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        th, td { padding: 12px; text-align: center; }
        th { background: linear-gradient(90deg, #4b6cb7, #182848); color: white; }
        tr:nth-child(even) { background: #f5f5f5; }
        .total { font-weight: bold; margin-top: 15px; text-align: right; font-size: 1.2rem; }
    </style>
</head>
<body>

<h2>Listado de Pagos</h2>

<table class="table table-hover">
    <tr>
        <th>ID Pago</th>
        <th>Cod Socio</th>
        <th>Monto</th>
        <th>Fecha</th>
        <th>Método</th>
        <th>Estado</th>
    </tr>
    <c:forEach var="p" items="${listaPagos}">
        <tr>
            <td>${p.codPago}</td>
            <td>${p.codSocio}</td>
            <td>€ ${p.monto}</td>
            <td>${p.fechaPago}</td>
            <td>${p.metodoPago}</td>
            <td>${p.estadoPago}</td>
        </tr>
    </c:forEach>
</table>

<div class="total">
    Total Pagado: € <c:out value="${totalPagado}" />
</div>

</body>
</html>
