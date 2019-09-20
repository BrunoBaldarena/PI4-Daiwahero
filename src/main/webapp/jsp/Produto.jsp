<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Produto</h1>
        <form action="${pageContext.request.contextPath}/produtoSalvar" method="post">

            <label>Nome</label>
            <input type="text" name="nome" >
            <label>Descrição</label>
            <input type="text" name="descricao" >
            <label>Breve Descrição</label>
            <input type="text" name="breve" >
            <label>Valor</label>
            <input type="text" name="valor" >
            <label>Quantidade</label>
            <input type="text" name="qtd" >
            <label>Status</label>
            <input  type="text" name="status">

           
                <select name="categoria" placeholder="Qual?">
                     <c:forEach items="${categoria}" var="categoria">
                    <option value="${categoria.getId()}">${categoria.getNome()}</option>  
                      </c:forEach>
                </select>


            <button type="submit">Salvar</button>

        </form>



    </body>
</html>
