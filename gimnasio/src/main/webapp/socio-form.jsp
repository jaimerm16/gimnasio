<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Formulario Socio</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
            overflow-y: auto;
        }

        h2 {
            color: #343a40;
            font-weight: 700;
            margin-bottom: 20px;
            text-align: center;
        }

        .card-container {
            width: 100%;
            max-width: 600px;
            background-color: rgba(255,255,255,0.95);
            padding: 20px 30px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            backdrop-filter: blur(5px);
            overflow-y: auto;
            max-height: 90vh;
        }

        /* Burbujas flotantes */
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

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            margin-top: 20px;
            padding: 12px;
            border-radius: 12px;
            border: none;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(90deg, #4b6cb7, #182848);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        @media (max-width: 640px) {
            .card-container {
                padding: 15px 20px;
            }
        }
    </style>
</head>
<body>

    <!-- Burbujas flotantes -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <div class="card-container">
        <h2>${socio != null ? "Editar Socio" : "Nuevo Socio"}</h2>

        <form action="SocioServlet" method="post">
            <input type="hidden" name="hiddenAction" value="${socio != null ? 'editar' : 'nuevo'}"/>

            <label>Código:</label>
            <input type="text" name="codSocio" value="${socio.codSocio}" required/>

            <label>Nombre:</label>
            <input type="text" name="nombre" value="${socio.nombre}" required/>

            <label>Apellido:</label>
            <input type="text" name="apellido" value="${socio.apellido}" required/>

            <label>Edad:</label>
            <input type="number" name="edad" value="${socio.edad}" required/>

            <label>Teléfono:</label>
            <input type="text" name="telefono" value="${socio.telefono}"/>

            <label>Correo:</label>
            <input type="email" name="correo" value="${socio.correo}"/>

            <label>Dirección:</label>
            <input type="text" name="direccion" value="${socio.direccion}"/>

            <label>Membresía:</label>
            <input type="text" name="tipoMembresia" value="${socio.tipoMembresia}"/>

            <label>Fecha Inscripción:</label>
            <input type="date" name="fechaInscripcion" value="${socio.fechaInscripcion}"/>

            <button type="submit">Guardar</button>
        </form>
    </div>

</body>
</html>
