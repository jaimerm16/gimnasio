<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista de Socios</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 50px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            overflow: hidden;
        }
        h2 { color: #343a40; font-weight: 700; margin-bottom: 20px; }
        .card-container {
            width: 95%;
            max-width: 1000px;
            background-color: rgba(255,255,255,0.95);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            backdrop-filter: blur(5px);
            position: relative;
            z-index: 2;
        }
        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(75, 108, 183, 0.15);
            animation: float 15s linear infinite;
            z-index: 1;
        }
        .bubble:nth-child(1) { width: 150px; height: 150px; top: 10%; left: 5%; animation-duration: 20s; }
        .bubble:nth-child(2) { width: 100px; height: 100px; top: 70%; left: 10%; animation-duration: 25s; }
        .bubble:nth-child(3) { width: 200px; height: 200px; top: 40%; left: 80%; animation-duration: 30s; }
        .bubble:nth-child(4) { width: 120px; height: 120px; top: 20%; left: 60%; animation-duration: 22s; }
        .bubble:nth-child(5) { width: 80px; height: 80px; top: 80%; left: 50%; animation-duration: 28s; }
        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-50px) rotate(180deg); }
            100% { transform: translateY(0) rotate(360deg); }
        }
        table { width: 100%; border-collapse: collapse; }
        th, td { text-align: center; vertical-align: middle; }
        th { background: linear-gradient(90deg, #4b6cb7, #182848); color: white; }
        td { background-color: rgba(75,108,183,0.05); }
        .btn-custom { font-size: 0.9rem; padding: 6px 12px; border-radius: 8px; transition: all 0.3s ease; margin: 2px; display: inline-block; }
        .btn-add { background: linear-gradient(90deg, #11998e, #38ef7d); border: none; color: #fff; }
        .btn-edit { background: linear-gradient(90deg, #f7971e, #ffd200); border: none; color: #343a40; }
        .btn-delete { background: linear-gradient(90deg, #e52d27, #b31217); border: none; color: #fff; }
        .btn-pagos { background: linear-gradient(90deg, #4b6cb7, #182848); border: none; color: #fff; }
    </style>
</head>
<body>

    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <div class="card-container">
        <h2 class="text-center">Lista de Socios</h2>

        <div class="text-center mb-4">
            <a href="SocioServlet?action=nuevo" class="btn btn-add btn-custom">Nuevo Socio</a>
        </div>

        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Edad</th>
                        <th>Acciones</th>
                        <th>Pagos</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${listaSocios}">
                        <tr>
                            <td>${s.codSocio}</td>
                            <td>${s.nombre}</td>
                            <td>${s.apellido}</td>
                            <td>${s.edad}</td>
                            <td>
                                <a href="SocioServlet?action=editar&id=${s.codSocio}" class="btn btn-edit btn-custom">Editar</a>
                                <a href="SocioServlet?action=eliminar&id=${s.codSocio}" class="btn btn-delete btn-custom"
                                   onclick="return confirm('¿Seguro que quieres eliminar este socio?')">Eliminar</a>
                            </td>
                            <td>
                                <a href="PagoServlet?action=listar&codSocio=${s.codSocio}" class="btn btn-pagos btn-custom">Ver Pagos</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>