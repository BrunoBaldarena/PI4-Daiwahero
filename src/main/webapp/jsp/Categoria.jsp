<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria</title>
    </head>
    <body>
        
        <form action="${pageContext.request.contextPath}/categoriaSalvar" method="post">
            <label>Categoria:</label>
            <input type="text" name="nome">
            <button type="submit">Salvar</button>
        </form>

        
            <form>
            <br>
            <table>
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th></th>


                        </tr>
                    </thead>
                    <tbody>


                        <c:forEach items="${categoria}" var="categoria">
                            <tr>
                                <td><c:out value="${categoria.getId()}"/></td>
                                <td><c:out value="${categoria.getNome()}"/></td>
                               
                                <td>
                                    
                                    <a href="${pageContext.request.contextPath}/categoriaEditar01?cod=<c:out value='${categoria.getId()}'/>"><input type="button"  value="Editar"></a>
                                    <a href="${pageContext.request.contextPath}/categoriaInativar?cod=<c:out value='${categoria.getId()}'/>"><input type="button"  value="Excluir"></a>

                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            
            
            </form>
            
       
        
        
    </body>
</html>
