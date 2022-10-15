<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@page import = "javax.servlet.http.*,javax.servlet.*"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@include file = "conection.jsp"%>
<c:set var="pageId" value = "Index"/>
<c:set var="standalone" value = "not"/>
<%@include file = "seguridad.jsp"%>
<%@include file = "header.jsp"%>

<jsp:useBean id="now" class="java.util.Date" scope="page"/>

<sql:query dataSource = "${fuenteDatos}" var = "result">
    SELECT * from libros;
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matenimiento de Libros</title>
    </head>
    <body>
        <h1>Mantenimiento de Libros</h1>
        <c:if test="${sessionScope.nivel eq 1}">
            <div>
                <form id="form-insertar" name="form-insertar" method="post" action="insert.jsp">
                    <table>
                            <tr>
                                <td>
                                <label>ISBN:</label>
                                <input id="input-isbn" name="isbn" class="input-text" type="text" value="" pattern="[0-9]+" minlength="13" maxlength="13" title="Codigo ISBN de 13 digitos" required="true" placeholder="0000-0000-0000-0" onkeyup="evaluarCampos()"/>
                            </td>
                            <td>
                                <label>Título:</label>
                                <input id="input-titulo" name="titulo" class="input-text" type="text" value="" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" minlength="3" maxlength="120" title="Titulo del escrito" required="true" placeholder="Titulo aquí" onkeyup="evaluarCampos"/>
                            </td>
                            <td>
                                <label>Autor:</label>
                                <input id="input-autor" name="autor" class="input-text" type="text" value="" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" minlength="3" maxlength="120" title="Autor del escrito" required="true" placeholder="Autor aquí" onkeyup="evaluarCampos()"/>
                            </td>
                            <td>
                                <label>Editorial:</label>
                                <input id="input-editorial" name="editorial" class="input-text" type="text" value="" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" minlength="3" maxlength="120" title="Introduzca la Editorial" required="true" placeholder="Autor aquí" onkeyup="evaluarCampos()"/>
                            </td>
                            <td>
                                <label>Año:</label>
                                <input id="input-anio" name="anio" class="input-text" type="number" step="1" value="" pattern="[0-9]+" min="1800" max="<fmt:formatDate pattern = "yyyy" value = "${now}"/>" title="Introduzca el año" required="true" placeholder="Año aquí" onkeyup="evaluarCampos()"/>
                            </td>
                            <td>
                                <input id="boton-submit" name="boton" class="boton-submit" type="submit" value="Insertar"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </c:if>
        <div>
            <c:if test="${sessionScope.nivel eq 0 or sessionScope.nivel eq 1}">
                <table border = "1" width = "100%">
                    <tr>
                        <th>ISBN</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Editorial</th>
                        <th>Año</th>
                    </tr>
                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <td><c:out value = "${row.isbn}"/></td>
                            <td><c:out value = "${row.titulo}"/></td>
                            <td><c:out value = "${row.autor}"/></td>
                            <td><c:out value = "${row.editorial}"/></td>
                            <td><c:out value = "${row.anio}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${sessionScope.nivel eq 2}">
                <table border = "1" width = "100%">
                    <tr>
                        <th>ISBN</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Editorial</th>
                        <th>Año</th>
                        <th>Acciones</th>
                    </tr>
                    <c:forEach var = "row" items = "${result.rows}">
                        <tr>
                            <td><c:out value = "${row.isbn}"/></td>
                            <td><c:out value = "${row.titulo}"/></td>
                            <td><c:out value = "${row.autor}"/></td>
                            <td><c:out value = "${row.editorial}"/></td>
                            <td><c:out value = "${row.anio}"/></td>
                            <td><a href="frmupdate.jsp?id=${row.id}">Actualizar</a></br><a href="delete.jsp?id=${row.id}">Eliminar</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </body>
</html>
