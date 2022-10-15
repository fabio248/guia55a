<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CERRAR SESION</title>
    </head>
    <body>
        <h1>ACABA DE CERRAR SESION</h1>
        <c:set var="user" value="" scope="session" />
        <c:set var="nombre" value="" scope="session" />
        <c:set var="nivel" value="-1" scope="session" />
        <p style="color:red;"><br>Sera redirigido a la pagina de INICIO, espere!</p>
        <script>
                setTimeout(function () {
                    location.href = "index.jsp";
                }, 5000);
            </script>
    </body>
</html>
