<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
<%
    String dbURL = "jdbc:mysql://localhost:3306/perfiles";
    String dbUser = "root";
    String dbPass = "";

    Connection conn = null;
    PreparedStatement pstmt = null;

    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("registrarse") != null) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        if (nombre == null || nombre.isEmpty() ||
            apellido == null || apellido.isEmpty() ||
            correo == null || correo.isEmpty() ||
            contrasena == null || contrasena.isEmpty()) {
            out.println("Todos los campos son obligatorios.");
        } else {
            try {
                // Conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                // Encriptar contraseña (alternativa simple con SHA-256)
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                byte[] hash = md.digest(contrasena.getBytes("UTF-8"));
                String hashedPassword = DatatypeConverter.printHexBinary(hash);

                // Insertar datos con PreparedStatement para evitar inyección SQL
                String sql = "INSERT INTO registros (nombre, apellido, correo, contrasena) VALUES (?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombre);
                pstmt.setString(2, apellido);
                pstmt.setString(3, correo);
                pstmt.setString(4, hashedPassword);

                int resultado = pstmt.executeUpdate();

                if (resultado > 0) {
                    out.println("Registro exitoso.");
                } else {
                    out.println("Error al registrar.");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
                try { if (conn != null) conn.close(); } catch (Exception e) {}
            }
        }
    }
%>