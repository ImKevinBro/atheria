<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.Collectors" %>

<%
    String seccion = request.getParameter("seccion");
    if (seccion == null) {
        seccion = "default";
    }

    // Simulación de datos (esto podría venir de una base de datos)
    class Nodo {
        int id, x, y;
        Integer padre;
        String texto;

        public Nodo(int id, int x, int y, Integer padre, String texto) {
            this.id = id;
            this.x = x;
            this.y = y;
            this.padre = padre;
            this.texto = texto;
        }
    }

    List<Nodo> mapa = new ArrayList<>();
    mapa.add(new Nodo(1, 100, 100, null, "Inicio"));
    mapa.add(new Nodo(2, 200, 200, 1, "Nodo 1"));
    mapa.add(new Nodo(3, 300, 300, 1, "Nodo 2"));
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Información - Atheria System</title>
    <link rel="stylesheet" href="css/estilos.css">
    <style>
        .btn-regresar {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            background-color: rgb(63, 88, 65);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .btn-regresar:hover {
            background-color: #21867a;
        }
    </style>
</head>
<body>

<div class="content">
    <div class="titulo">
        <h1 style="color:rgb(203, 253, 228)">Información de Atheria System</h1>
    </div>

    <% if ("vision".equals(seccion)) { %>
        <div class="info">
            <h2>Nuestra Visión</h2>
            <p>Ser la empresa líder en sistemas distribuidos a nivel global, reconocida por nuestra capacidad de innovación, seguridad y eficiencia.</p>
            <div class="mapa">
                <svg class="canvas">
                    <% for (Nodo nodo : mapa) {
                        if (nodo.padre != null) {
                            Nodo padre = mapa.stream().filter(n -> n.id == nodo.padre).findFirst().orElse(null);
                            if (padre != null) {
                    %>
                    <line x1="<%= padre.x %>" y1="<%= padre.y %>" x2="<%= nodo.x %>" y2="<%= nodo.y %>" stroke="black" stroke-width="2" marker-end="url(#arrow)" />
                    <% } } } %>
                    <defs>
                        <marker id="arrow" markerWidth="10" markerHeight="10" refX="6" refY="3" orient="auto">
                            <polygon points="0 0, 6 3, 0 6" fill="black"/>
                        </marker>
                    </defs>
                    <% for (Nodo nodo : mapa) { %>
                        <circle cx="<%= nodo.x %>" cy="<%= nodo.y %>" r="40" fill="#4CAF50" />
                        <text x="<%= nodo.x %>" y="<%= nodo.y %>" dominant-baseline="middle" text-anchor="middle" fill="white" font-size="12"><%= nodo.texto %></text>
                    <% } %>
                </svg>
            </div>
        </div>
    <% } else if ("mision".equals(seccion)) { %>
        <div class="info">
            <h2>Nuestra Misión</h2>
            <p>En Atheria System, nos dedicamos a diseñar e implementar soluciones de sistemas distribuidos de alto rendimiento.</p>
            <div class="mapa">
                <svg class="canvas">
                    <% for (Nodo nodo : mapa) {
                        if (nodo.padre != null) {
                            Nodo padre = mapa.stream().filter(n -> n.id == nodo.padre).findFirst().orElse(null);
                            if (padre != null) {
                    %>
                    <line x1="<%= padre.x %>" y1="<%= padre.y %>" x2="<%= nodo.x %>" y2="<%= nodo.y %>" stroke="black" stroke-width="2" marker-end="url(#arrow)" />
                    <% } } } %>
                    <defs>
                        <marker id="arrow" markerWidth="10" markerHeight="10" refX="6" refY="3" orient="auto">
                            <polygon points="0 0, 6 3, 0 6" fill="black"/>
                        </marker>
                    </defs>
                    <% for (Nodo nodo : mapa) { %>
                        <circle cx="<%= nodo.x %>" cy="<%= nodo.y %>" r="40" fill="#4CAF50" />
                        <text x="<%= nodo.x %>" y="<%= nodo.y %>" dominant-baseline="middle" text-anchor="middle" fill="white" font-size="12"><%= nodo.texto %></text>
                    <% } %>
                </svg>
            </div>
        </div>
    <% } %>

    <a href="principal.jsp" class="btn-regresar">Regresar</a>
</div>

</body>
</html>
