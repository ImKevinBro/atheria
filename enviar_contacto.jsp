<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comentario Enviado - Atheria System</title>
    <link rel="stylesheet" href="css/estilos.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-align: center;
            width: 200px;
        }
        h2 {
            color: #4CAF50;
        }
        p {
            margin-top: 10px;
            font-size: 16px;
        }
        .btn {
            background-color: rgb(55, 90, 57);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            margin-top: 15px;
            display: inline-block;
        }
        .btn:hover {
            background-color:rgb(55, 90, 57);
        }
    </style>
</head>
<body>

<div class="container">
    <%
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String mensaje = request.getParameter("mensaje");

        // Validar si los campos no están vacíos
        if (nombre != null && !nombre.isEmpty() && email != null && !email.isEmpty() && mensaje != null && !mensaje.isEmpty()) {
            out.println("<h2>¡Gracias por tu comentario, " + nombre + "!</h2>");
            out.println("<p>Responderemos a la brevedad a tu correo: <strong>" + email + "</strong></p>");
        } else {
            out.println("<h2>Oops...</h2>");
            out.println("<p>Todos los campos son obligatorios. Por favor, inténtalo de nuevo.</p>");
        }
    %>
    <a href="principal.jsp" class="btn">Regresar</a>
</div>

</body>
</html>
