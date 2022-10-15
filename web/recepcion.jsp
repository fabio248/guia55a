<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de Acceso</title>
    </head>
    <body>
        <h1>Control de Accesos</h1>
        <c:choose>
            <c:when test="${param.logeado eq 'not'}">
                Hemos detectado que ud. 
                intenta realizar  la operacion: 
                <span style="color:blue;">${param.operacion}</span> sin haberse logeado.
                A continuación se le permite ingresar como Anonimo, pero
                solo tiene derechos para realizar Consultas.               
            </c:when>
            <c:when test="${param.logeado eq 'yes'}">
                Hemos detectado que ud. 
                intenta realizar  la 
                operacion: <span style="color:blue;">${param.operacion}</span>
                pero su nivel de seguridad es:
                <span style="color:red;">${sessionScope.nivel}</span></br>
                El cual solo le permite realizar:
                <c:set var="permiso" value="${sessionScope.nivel}"/>
                <c:choose>
                    <c:when test="${permiso eq '0'}">
                        Consultas
                    </c:when>
                    <c:when test="${permiso eq '1'}">
                        Consultas e Inserciones
                    </c:when>
                    <c:when test="${permiso eq '2'}">
                        Consultas, Actualizaciones, Eliminaciones
                    </c:when>     
                </c:choose>
            </c:when>                
        </c:choose>
        <p style="color:red;">Dentro de unos segundos sera redirigido a la pagina de INICIO</p>
        <script>
            setTimeout(function () {
                location.href = "index.jsp";
            }, 5000);
        </script>
    </body>
</html>