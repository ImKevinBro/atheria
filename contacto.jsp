<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto - Atheria System</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
    <div class="container">
        <div class="titulo">
            <font size="6">
                <b><i>
                    <h1 style="color:rgb(208, 247, 202)">Bienvenido a Contactos</h1>
                </i></b>
            </font>
        </div>
        <h2>Haznos saber tu comentario o reclamo, estamos para mejorar</h2>
        <form id="contactForm">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre" placeholder="Tu nombre" required>
            
            <label for="email">Correo Electrónico</label>
            <input type="email" id="email" name="email" placeholder="Tu correo electrónico" required>
            
            <label for="mensaje">Mensaje</label>
            <textarea id="mensaje" name="mensaje" rows="20" placeholder="Escribe tu mensaje aquí..." required></textarea>
            
            <button type="submit">Enviar</button>
        </form>
    </div>

    <script>
        document.getElementById('contactForm').addEventListener('submit', async function (event) {
            event.preventDefault(); // Previene el envío estándar del formulario

            // Recolectar los datos del formulario
            const formData = new FormData(this);

            try {
                // Enviar los datos usando Fetch
                const response = await fetch('enviar_contacto.js', {
                    method: 'POST',
                    body: formData
                });

                const result = await response.json();
                if (result.success) {
                    alert('¡Mensaje enviado exitosamente!');
                    // Opcional: Limpiar el formulario
                    document.getElementById('contactForm').reset();
                } else {
                    alert('Hubo un problema al enviar el mensaje, por favor inténtalo de nuevo.');
                }
            } catch (error) {
                console.error('Error al enviar el mensaje:', error);
                alert('Error al enviar el mensaje, por favor intenta nuevamente.');
            }
        });
    </script>
</body>
</html>
