<%@ page import="java.sql.*" %>
<%@ page import="java.security.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.codec.binary.Hex" %>

<%
    String dbURL = "jdbc:mysql://localhost:3306/perfiles";
    String dbUser = "root";
    String dbPass = "";

    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("registrarse") != null) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        // Validación básica
        if (nombre == null || nombre.trim().isEmpty() ||
            apellido == null || apellido.trim().isEmpty() ||
            correo == null || !correo.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$") ||
            contrasena == null || contrasena.trim().isEmpty()) {
            request.setAttribute("error", "Por favor complete todos los campos correctamente");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return;
        }

        // Mejorar seguridad de contraseña
        try {
            SecureRandom random = new SecureRandom();
            byte[] salt = new byte[16];
            random.nextBytes(salt);
            
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt);
            byte[] hash = md.digest(contrasena.getBytes("UTF-8"));
            String hashedPassword = Hex.encodeHexString(hash);
            String saltStr = Hex.encodeHexString(salt);

            // Usar try-with-resources
            try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                 PreparedStatement pstmt = conn.prepareStatement(
                     "INSERT INTO registros (nombre, apellido, correo, contrasena, salt) VALUES (?, ?, ?, ?, ?)")) {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                pstmt.setString(1, nombre);
                pstmt.setString(2, apellido);
                pstmt.setString(3, correo);
                pstmt.setString(4, hashedPassword);
                pstmt.setString(5, saltStr);

                int resultado = pstmt.executeUpdate();

                if (resultado > 0) {
                    response.sendRedirect("registro-exitoso.jsp");
                } else {
                    request.setAttribute("error", "Error al registrar");
                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Error en la base de datos");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            request.setAttribute("error", "Error en el sistema");
            request.getRequestDispatcher("registro.jsp").forward(request, response);
        }
    }
%>
