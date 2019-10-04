<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        <h1>Editar Produto</h1>
        <form action="${pageContext.request.contextPath}/produtoEditar02" method="post">
            <c:forEach items="${produto}" var="produto">

                <input type="hidden" name="cod" value="${produto.getPk_produto()}">
                <label>Nome</label><br>
                <input type="text" name="nome" value="${produto.getNome()}" ><br>
                <label>Descrição</label><br>
                <input type="text" name="descricao" value="${produto.getDescricao()}" ><br>
                <label>Breve Descrição</label><br>
                <input type="text" name="breve" value="${produto.getBreveDescricao()}"><br>
                <label>Valor</label><br>
                <input type="text" name="valor" value="${produto.getValor()}"><br>
                <label>Quantidade</label><br>
                <input type="text" name="qtd" value="${produto.getQuantidade_estoque()}" ><br>
                <label>Status</label><br>
                <input  type="text" name="status" value="${produto.getStatus()}"><br>

                <label>Categoria</label><br>
                <select name="categoria" placeholder="Qual?">
                    
                <c:forEach items="${categoria}" var="categoria">
                    
                <c:if test = "${produto.getFk_categoria() eq categoria.getId()}">
                    <option value="${produto.getFk_categoria()}" selected="selected">${categoria.getNome()}</option>  
                </c:if> 
                    <option value="${categoria.getId()}">${categoria.getNome()}</option>  
                    
                 </c:forEach>
                </select>
                
                
                <button type="submit">Salvar</button>

            </c:forEach>

                
        </form>
    </body>
</html>
