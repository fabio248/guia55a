<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@include file="conection.jsp"%>
<c:set var="pageId" value="Eliminar"/>
<c:set var="standalone" value="not"/>
<%@ include file="seguridad.jsp"%>

<c:if test="${empty param.id}">
    <c:redirect url="error.jsp">
        <c:param name="tipo" value="parametro"/>
        <c:param name="destino" value="index.jsp"/>
    </c:redirect>
</c:if>
    
<sql:query dataSource = "${fuenteDatos}" var = "result">
    SELECT * from libros where Id = ?;
    <sql:param value = "${param.id}"/>
</sql:query>

<c:forEach var = "row" items = "${result.rows}">
    <c:set var = "id" scope = "page" value = "${row.id}"/>
    <c:set var = "isbn" scope = "page" value = "${row.isbn}"/>
    <c:set var = "titulo" scope = "page" value = "${row.titulo}"/>
    <c:set var = "autor" scope = "page" value = "${row.autor}"/>
    <c:set var = "editorial" scope = "page" value = "${row.editorial}"/>
    <c:set var = "anio" scope = "page" value = "${row.anio}"/>
</c:forEach>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar un Registro</title>
    </head>
    <body>
        <div>
            <h1>SE HA ELIMINADO UN REGISTRO</h1> 
            <sql:update dataSource = "${fuenteDatos}" var = "count">
                DELETE FROM libros WHERE Id = ?;
                <sql:param value = "${id}"/>
            </sql:update>
            <table>
                <tr>
                    <td>
                        Se ha elminado el siguiente registro:</br>
                        ID: ${id}</br>
                        ISBN: ${isbn}</br>
                        Titulo: ${titulo}</br>
                        Autor: ${autor}</br>
                        Editorial: ${editorial}</br>
                        Año: ${anio}</br>
                    </td>
                </tr>
            </table>
            <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
            <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
        </div>
    </body>
</html>
