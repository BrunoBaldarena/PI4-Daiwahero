<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
          <form>
            <br>
            <table>
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>Valor</th>
                            <th>Categoria</th>
                            <th>Quantidade</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>


                        <c:forEach items="${produto}" var="produto">
              
                            <tr>
                                <td><c:out value="${produto.getPk_produto()}"/></td>
                                <td><c:out value="${produto.getNome()}"/></td>
                                <td><c:out value="${produto.getValor()}"/></td>
                                <td><c:out value="${produto.getNome_categoria()}"/></td>
                                <td><c:out value="${produto.getQuantidade_estoque()}"/></td>
                                <td><c:out value="${produto.getStatus()}"/></td>
                                
                            </tr>
                         
                        </c:forEach>

                    </tbody>
                </table>
            
            
            </form>
            
       
    </body>
</html>
