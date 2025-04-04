<%@ page import="java.util.*" %>

<%
    class Nodo {
        int id, x, y;
        Integer padre;
        String texto;

        public Nodo(int id, String texto, Integer padre, int x, int y) {
            this.id = id;
            this.texto = texto;
            this.padre = padre;
            this.x = x;
            this.y = y;
        }
    }

    List<Nodo> mapa = Arrays.asList(
        new Nodo(1, "Atheria System", null, 400, 50),
        new Nodo(2, "Misión", 1, 200, 200),
        new Nodo(3, "Visión", 1, 600, 200),
        new Nodo(4, "Solucionar", 2, 100, 350),
        new Nodo(5, "Atender", 2, 300, 350),
        new Nodo(6, "Producir", 3, 500, 350),
        new Nodo(7, "Satisfacer", 3, 700, 350)
    );
%>