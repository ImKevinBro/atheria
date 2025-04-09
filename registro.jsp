<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="css/estilos.css">  
</head>
<body>
    <div class="login-container">
        <h2>Registro</h2>
        <form action="conexion.jsp" method="POST">
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="text" name="apellido" placeholder="Apellidos" required>
            <input type="email" name="correo" placeholder="Correo" required>
            <input type="password" name="contrasena" placeholder="Contraseña" required>
            <input type="password" name="confirmar_contrasena" placeholder="Confirme su contraseña" required>
            <button type="submit" name="registrarse">Registrarse</button>
        </form>
    </div> 
</body>
</html>

<%@ page import="java.io.*, java.sql.*" %>
<%
if (request.getMethod().equals("POST")) {
    String nombre = request.getParameter("nombre");
    String apellidos = request.getParameter("apellido");
    String correo = request.getParameter("correo");
    String contrasena = request.getParameter("contrasena");
    String confirmarContrasena = request.getParameter("confirmar_contrasena");
    
    if (!contrasena.equals(confirmarContrasena)) {
        out.println("Las contraseñas no coinciden.");
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tu_base_de_datos", "usuario", "password");
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO usuarios (nombre, apellido, correo, contrasena) VALUES (?, ?, ?, ?)");
            stmt.setString(1, nombre);
            stmt.setString(2, apellidos);
            stmt.setString(3, correo);
            stmt.setString(4, contrasena);
            stmt.executeUpdate();
            response.sendRedirect("principal.jsp");
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
%>
