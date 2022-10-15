<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AUTENTICACION DE USUARIO</title>
    </head>
    <body>
        <h1>AUTENTICACION DE USUARIOS</h1>
        <div id="container">
            <c:if test="${not empty param.msg}">
                <p style="color:red;">Error: ${param.msg}</p>
            </c:if>
            <form name="login" action="verificar.jsp" method="post">
                <!-- Username -->
                <label for="usuario">Login:</label>
                <input name="usuario" id="usuario" type="input" value=""/>
                <!-- Password -->
                <label for="clave">Clave:</label>
                    <input name="clave" id="clave" type="password"/>
                <div id="lower">
                   <input type="submit" value="Ingresar"/>
                </div>
            </form>       
        </div>
    </body>
</html>
