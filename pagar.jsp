<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Métodos de Pago - Atheria System</title>
    <link rel="stylesheet" href="css/estilos.css">
    <style>
        /* Estilo para el modal */
        #modalPago {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-contenido {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            width: 50%;
            text-align: center;
            border-radius: 10px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color:rgb(74, 107, 75);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color:rgb(74, 107, 75);
        }

        #infoCuenta {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="titulo">
            <font size="6">
                <b><i>
                    <h1 style="color:rgb(208, 247, 202)">Pagos</h1>
                    <br> ______________________________________________________
                </i></b>
            </font>
            <br>
            <h2>Selecciona tu método de pago</h2>
        </div>

        <form action="carrito.jsp" method="get">
            <button type="submit">Regresar</button>
        </form>

        <div class="login.container">
            <form id="formPago" onsubmit="return procesarPago()">
                <!-- Opción de Tarjeta de Crédito/Débito -->
                <div class="metodo">
                    <input type="radio" id="tarjeta" name="metodo_pago" value="tarjeta" required>
                    <label for="tarjeta">Tarjeta de Crédito/Débito</label>
                    <div id="tarjeta-info" class="info oculto">
                        <input type="text" name="nombre_tarjeta" placeholder="Nombre en la tarjeta" required>
                        <input type="text" name="numero_tarjeta" placeholder="Número de tarjeta" required>
                        <input type="text" name="expiracion" placeholder="MM/AA" required>
                        <input type="text" name="cvv" placeholder="CVV" required>
                    </div>
                </div>

                <!-- Opción de PayPal -->
                <div class="metodo">
                    <input type="radio" id="paypal" name="metodo_pago" value="paypal" required>
                    <label for="paypal">PayPal</label>
                </div>

                <!-- Opción de Transferencia Bancaria -->
                <div class="metodo">
                    <input type="radio" id="transferencia" name="metodo_pago" value="transferencia" onclick="mostrarInfo(true)">
                    <label for="transferencia">Transferencia Bancaria</label>
                </div>

                <!-- Información de la cuenta bancaria -->
                <div id="infoCuenta">
                    <p><strong>Número de Cuenta:</strong> 1234-5678-9101-1121</p>
                    <p><strong>Banco:</strong> Bancomer.</p>
                </div>

                <!-- Botón para pagar -->
                <button type="submit">Pagar</button>
            </form>
        </div>
    </div>

    <!-- Modal de pago exitoso -->
    <div id="modalPago">
        <div class="modal-contenido">
            <h2>✅ Pago realizado con éxito</h2>
            <p>¡Gracias por tu compra!</p>
            <button onclick="regresar()">Regresar a la página principal</button>
        </div>
    </div>

    <script>
        // Mostrar información de tarjeta si es seleccionada
        document.querySelectorAll('input[name="metodo_pago"]').forEach((input) => {
            input.addEventListener('change', function () {
                const tarjetaInfo = document.getElementById('tarjeta-info');
                if (this.value === 'tarjeta') {
                    tarjetaInfo.classList.remove('oculto');
                } else {
                    tarjetaInfo.classList.add('oculto');
                }
            });
        });

        // Mostrar información bancaria si seleccionan transferencia
        function mostrarInfo(mostrar) {
            var infoCuenta = document.getElementById("infoCuenta");
            if (mostrar) {
                infoCuenta.style.display = "block";
            } else {
                infoCuenta.style.display = "none";
            }
        }

        // Procesar pago y mostrar modal
        function procesarPago() {
            // Mostrar el modal de pago
            document.getElementById('modalPago').style.display = 'block';
            // Evita que el formulario se envíe
            return false;
        }

        // Redirigir a la página principal
        function regresar() {
            window.location.href = "principal.jsp"; // Cambia por la ruta de tu página principal
        }
    </script>
</body>
</html>
