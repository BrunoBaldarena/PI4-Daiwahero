<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <c:forEach items="${categoria}" var="categoria">
        <form action="${pageContext.request.contextPath}/categoriaEditar02" method="post">
            <label>Categoria:</label>
             <input type="hidden" name="cod" value="${categoria.getId()}">
            <input type="text" name="nome" value="${categoria.getNome()}">
            <button type="submit">Salvar</button>
        </form>
        </c:forEach>
    </body>
</html>
