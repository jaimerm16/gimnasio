<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestión de Gimnasio</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            overflow: hidden;
        }

        h1 {
            color: #343a40;
            font-weight: 700;
            margin-bottom: 30px;
        }

        .btn-custom {
            font-size: 1.2rem;
            padding: 12px;
            border-radius: 12px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.2);
        }

        .btn-primary { background: linear-gradient(90deg, #4b6cb7, #182848); border: none; }
        .btn-success { background: linear-gradient(90deg, #11998e, #38ef7d); border: none; }

        .card-container {
            max-width: 400px;
            width: 100%;
            background-color: rgba(255,255,255,0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            backdrop-filter: blur(5px);
            animation: fadeIn 0.8s ease-in-out;
            position: relative;
            z-index: 2;
            text-align: center;
        }

        @keyframes fadeIn {
            0% {opacity: 0; transform: translateY(-20px);}
            100% {opacity: 1; transform: translateY(0);}
        }

        /* Elementos flotantes */
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
        <h1>Gestión de Gimnasio</h1>
        <hr/>
        <a href="SocioServlet" class="btn btn-primary mb-3 w-100 btn-custom">
            Listar Socios
        </a>
        <a href="PagoServlet" class="btn btn-success mb-3 w-100 btn-custom">
            Listar Pagos y Total
        </a>
    </div>

</body>
</html>
