<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@include file="conection.jsp"%>
<c:set var="pageId" value="Insertar"/>
<c:set var="standalone" value="not"/>
<%@include file="seguridad.jsp"%>
<%@include file="header.jsp"%>

<c:if test="${empty param.isbn or empty param.titulo or empty param.autor or empty param.editorial or empty param.anio}">
    <c:redirect url="error.jsp">
        <c:param name="tipo" value="parametro"/>
        <c:param name="destino" value="index.jsp"/>
    </c:redirect>
</c:if>

<sql:update dataSource = "${fuenteDatos}" var = "result">
    INSERT INTO libros (isbn, titulo, autor, editorial, anio) VALUES (?,?,?,?,?);
    <sql:param value = "${param.isbn}"/>
    <sql:param value = "${param.titulo}"/>
    <sql:param value = "${param.autor}"/>
    <sql:param value = "${param.editorial}"/>
    <sql:param value = "${param.anio}"/>
</sql:update>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERTAR UN REGISTRO EN LA TABLA</title>
    </head>
    <body>
        <h1>SE HA CREADO UN NUEVO REGISTRO</h1>
        <p>
            Se ha insertado un nuevo registro en la base de datos:</br>
            ISBN: ${param.isbn}</br>
            Titulo: ${param.titulo}</br>
            Autor: ${param.autor}</br>
            Editorial: ${param.editorial}</br>
            Año: ${param.anio}</br>
        </p>
        <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
