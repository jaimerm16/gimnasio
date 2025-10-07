<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Formulario de Pago</title></head>
<body>
<h2><c:choose>
        <c:when test="${not empty pago}">Editar Pago</c:when>
        <c:otherwise>Nuevo Pago</c:otherwise>
    </c:choose></h2>

<form action="PagoServlet" method="post">
    <input type="hidden" name="hiddenAction" value="${not empty pago ? 'editar' : 'nuevo'}"/>
    <label>ID Pago:</label>
    <input type="number" name="codPago" value="${pago.codPago}" required/><br/>
    <label>Cod Socio:</label>
    <input type="number" name="codSocio" value="${pago.codSocio}" required/><br/>
    <label>Monto:</label>
    <input type="number" step="0.01" name="monto" value="${pago.monto}" required/><br/>
    <label>Fecha:</label>
    <input type="date" name="fechaPago" value="${pago.fechaPago}" required/><br/>
    <label>Método de Pago:</label>
    <input type="text" name="metodoPago" value="${pago.metodoPago}" required/><br/>
    <label>Estado:</label>
    <input type="text" name="estadoPago" value="${pago.estadoPago}" required/><br/>
    <input type="submit" value="Guardar"/>
</form>
</body>
</html>
