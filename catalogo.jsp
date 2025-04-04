<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, javax.servlet.http.*" %>
<%
    HttpSession sessionCarrito = request.getSession();
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) sessionCarrito.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
        sessionCarrito.setAttribute("carrito", carrito);
    }

    // Definir productos
    List<Map<String, Object>> productos = new ArrayList<>();
    String[][] datosProductos = {
        {"1", "Teclado Inalámbrico", "12000", "teclado.jpg"},
        {"2", "Libro de Programación", "500", "libro2.jpg"},
        {"3", "Libro de Diseño UX", "1500", "libro1.jpg"},
        {"4", "Monitor LED 24\"", "3000", "monitor.jpg"},
        {"5", "Auriculares Gaming", "900", "auriculares.jpg"},
        {"6", "Sistema iOS Actualizado", "2000", "ios.jpg"},
        {"7", "Ebook Avanzado", "300", "libro3.jpg"},
        {"8", "Servidor en la Nube", "4500", "nube.jpg"},
        {"9", "Servidor Dedicado Pro", "3200", "servidor2.jpg"},
        {"10", "Router de Alta Velocidad", "6000", "router1.jpg"},
        {"11", "Teclado Inalámbrico", "12000", "teclado.jpg"},
        {"12", "Libro de Programación", "500", "libro2.jpg"},
        {"13", "Libro de Diseño UX", "1500", "libro1.jpg"},
        {"14", "Monitor LED 24\"", "3000", "monitor.jpg"},
        {"15", "Auriculares Gaming", "900", "auriculares.jpg"},
        {"16", "Sistema iOS Actualizado", "2000", "ios.jpg"},
        {"17", "Ebook Avanzado", "300", "libro3.jpg"},
        {"18", "Servidor en la Nube", "4500", "nube.jpg"},
        {"19", "Servidor Dedicado Pro", "3200", "servidor2.jpg"},
        {"20", "Router de Alta Velocidad", "6000", "router1.jpg"}
        {"21", "Teclado Inalámbrico", "12000", "teclado.jpg"},
        {"22", "Libro de Programación", "500", "libro2.jpg"},
        {"23", "Libro de Diseño UX", "1500", "libro1.jpg"},
        {"24", "Monitor LED 24\"", "3000", "monitor.jpg"},
        {"25", "Auriculares Gaming", "900", "auriculares.jpg"},
        {"26", "Sistema iOS Actualizado", "2000", "ios.jpg"},
        {"27", "Ebook Avanzado", "300", "libro3.jpg"},
        {"28", "Servidor en la Nube", "4500", "nube.jpg"},
        {"29", "Servidor Dedicado Pro", "3200", "servidor2.jpg"},
        {"30", "Router de Alta Velocidad", "6000", "router1.jpg"}
    };

    for (String[] datos : datosProductos) {
        Map<String, Object> producto = new HashMap<>();
        producto.put("id", Integer.parseInt(datos[0]));
        producto.put("nombre", datos[1]);
        producto.put("precio", Double.parseDouble(datos[2]));
        producto.put("imagen", datos[3]);
        productos.add(producto);
    }

    // Agregar producto al carrito
    if (request.getParameter("agregar") != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String imagen = request.getParameter("imagen");

        boolean existe = false;
        for (Map<String, Object> producto : carrito) {
            if ((int) producto.get("id") == id) {
                producto.put("cantidad", (int) producto.get("cantidad") + 1);
                existe = true;
                break;
            }
        }

        if (!existe) {
            Map<String, Object> nuevoProducto = new HashMap<>();
            nuevoProducto.put("id", id);
            nuevoProducto.put("nombre", nombre);
            nuevoProducto.put("precio", precio);
            nuevoProducto.put("imagen", imagen);
            nuevoProducto.put("cantidad", 1);
            carrito.add(nuevoProducto);
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Productos</title>
    <link rel="stylesheet" href="estilos.css">
    <style>
        .contenedor {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .producto {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
        }
        img {
            width: 100%;
            max-height: 150px;
            border-radius: 8px;
        }
        button {
            background-color: rgb(52, 116, 57);
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="contenedor">
        <% for (Map<String, Object> producto : productos) { %>
            <div class="producto">
                <img src="imagenes/<%= producto.get("imagen") %>" alt="<%= producto.get("nombre") %>">
                <h3><%= producto.get("nombre") %></h3>
                <p>$<%= String.format("%.2f", producto.get("precio")) %></p>
                <form method="post">
                    <input type="hidden" name="id" value="<%= producto.get("id") %>">
                    <input type="hidden" name="nombre" value="<%= producto.get("nombre") %>">
                    <input type="hidden" name="precio" value="<%= producto.get("precio") %>">
                    <input type="hidden" name="imagen" value="<%= producto.get("imagen") %>">
                    <button type="submit" name="agregar">Comprar</button>
                </form>
            </div>
        <% } %>
    </div>
    <div class="botones">
        <a href="carrito.jsp"><button>Ver carrito</button></a>
        <a href="principal.jsp"><button>Regresar</button></a>
    </div>
</body>
</html>
