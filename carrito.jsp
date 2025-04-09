<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, javax.servlet.http.*" %>
<%
    HttpSession sessionCarrito = request.getSession();
    List<Map<String, Object>> carrito = (List<Map<String, Object>>) sessionCarrito.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
        sessionCarrito.setAttribute("carrito", carrito);
    }

    // Eliminar producto del carrito
    String eliminar = request.getParameter("eliminar");
    if (eliminar != null) {
        int indice = Integer.parseInt(eliminar);
        if (indice >= 0 && indice < carrito.size()) {
            carrito.remove(indice);
        }
    }

    // Vaciar carrito
    if (request.getParameter("vaciar") != null) {
        carrito.clear();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="css/estilos.css">
</head>
<body>
<div class="content">
    <div class="titulo">
        <font size="6">
            <b><i>
                <h1 style="color:rgb(203, 253, 228)">Carrito de compras</h1>
            </i></b>
        </font>
    </div>

    <% if (carrito.isEmpty()) { %>
        <p>Tu carrito está vacío.</p>
        <a href="catalogo.jsp"><button>Agregar productos</button></a>
    <% } else { %>
        <table border="1" cellspacing="0" cellpadding="10">
            <tr>
                <th>Producto</th>
                <th>Precio</th>
                <th>Cantidad</th>
                <th>Total</th>
                <th>Acción</th>
            </tr>
            <% double total = 0; %>
            <% for (int i = 0; i < carrito.size(); i++) {
                Map<String, Object> producto = carrito.get(i);
                String nombre = (String) producto.get("nombre");
                double precio = (double) producto.get("precio");
                int cantidad = (int) producto.get("cantidad");
                double subtotal = precio * cantidad;
                total += subtotal;
            %>
                <tr>
                    <td><%= nombre %></td>
                    <td>$<%= String.format("%.2f", precio) %></td>
                    <td><%= cantidad %></td>
                    <td>$<%= String.format("%.2f", subtotal) %></td>
                    <td>
                        <a href="?eliminar=<%= i %>" onclick="return confirm('¿Eliminar este producto?')">Eliminar</a>
                    </td>
                </tr>
            <% } %>
        </table>

        <h3>Total: $<%= String.format("%.2f", total) %></h3>

        <form method="get" style="display:inline;">
            <button type="submit" name="vaciar" onclick="return confirm('¿Vaciar el carrito?')">Vaciar carrito</button>
        </form>

        <a href="catalogo.jsp"><button>Agregar más productos</button></a>
        <a href="principal.jsp"><button>Regresar al inicio</button></a>
        <a href="pagar.jsp"><button>Pagar</button></a>
    <% } %>
</body>
</html>
