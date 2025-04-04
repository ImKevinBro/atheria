<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos.css">
    <title>Arquitectura de Monolitos</title>
</head>
<body>  
<center>
    <div class="login-container">
        <h2>Login</h2>
        <form action="login.jsp" method="POST">
            <input type="email" name="correo" placeholder="Correo" required>
            <input type="password" name="contrasena" placeholder="Contraseña" required>
            <button type="submit">Login</button>
        </form>
    </div>      
    <p>No tienes cuenta? <a href="registro.jsp">Regístrate</a></p>
</center>   
</body>
</html>