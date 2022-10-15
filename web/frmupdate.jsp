<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.io.*,java.util.*,java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<%@include file="conection.jsp"%>
<c:set var="pageId" value="Actualizar"/>
<c:set var="standalone" value="not"/>
<%@include file= "seguridad.jsp"%>
<%@include file = "header.jsp"%>

<c:if test="${empty param.id}">
    <c:redirect url="error.jsp">
        <c:param name="tipo" value="parametro"/>
        <c:param name="destino" value="index.jsp"/>
    </c:redirect>
</c:if> 

<jsp:useBean id="now" class="java.util.Date" scope="page"/>

<sql:query dataSource = "${fuenteDatos}" var = "result">
    SELECT * FROM libros WHERE Id=?;
    <sql:param value="${param.id}"/>
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
        <title>Formulario de Actualización</title>
    </head>
    <body>
        <div>
            <h1>Formulario de actualización</h1>
            <p style="color:darkblue;font-weight:bold;">Realice las modificaciones necesarias y haga clic en el boton 'actualizar'.</p>
        </div>
        <div>
            <form id="form-actualizar" name="form-actualizar" method="post" action="update.jsp">
                <table>
                    <tr>
                        <td>
                            <label>ID:</label>
                            <input id="input-id" name="id" class="input-text" type="text" value="${id}" required="true" title="ID del registro" readonly="true"/>
                        </td>
                        <td>
                            <label>ISBN:</label>
                            <input id="input-isbn" name="isbn" class="input-text" type="text" value="${isbn}" pattern="[0-9]+" minlength="13" maxlength="13" title="Codigo ISBN de 13 digitos" required="true" placeholder="0000-0000-0000-0" onkeyup="evaluarCampos()"/>
                        </td>
                        <td>
                            <label>Título:</label>
                            <input id="input-titulo" name="titulo" class="input-text" type="text" value="${titulo}" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" minlength="3" maxlength="120" title="Titulo del escrito" required="true" placeholder="Titulo aquí" onkeyup="evaluarCampos"/>
                        </td>
                        <td>
                            <label>Autor:</label>
                            <input id="input-autor" name="autor" class="input-text" type="text" value="${autor}" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" minlength="3" maxlength="120" title="Autor del escrito" required="true" placeholder="Autor aquí" onkeyup="evaluarCampos()"/>
                        </td>
                        <td>
                            <label>Editorial:</label>
                            <input id="input-editorial" name="editorial" class="input-text" type="text" value="${editorial}" pattern="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" minlength="3" maxlength="120" title="Introduzca la Editorial" required="true" placeholder="Autor aquí" onkeyup="evaluarCampos()"/>
                        </td>
                        <td>
                            <label>Año:</label>
                            <input id="input-anio" name="anio" class="input-text" type="number" step="1" value="${anio}" pattern="[0-9]+" min="1800" max="<fmt:formatDate pattern = "yyyy" value = "${now}"/>" title="Introduzca el año" required="true" placeholder="Año aquí" onkeyup="evaluarCampos()"/>
                        </td>
                        <td>
                            <input id="boton-submit" name="boton" class="boton-submit" type="submit" value="Actualizar"/>
                        </td>
                    </tr>
                </table>
            </form>
            <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
            <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
        </div>
    </body>
</html>