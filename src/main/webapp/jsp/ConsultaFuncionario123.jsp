<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <table>
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>E-MAIL</th>
                    <th>TELEFONE</th>
                    <th>CARGO</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>


                <c:forEach items="${funcionario}" var="funcionario">

                    <tr>
                        <td><c:out value="${funcionario.getId()}"/></td>
                        <td><c:out value="${funcionario.getNome()}"/></td>
                        <td><c:out value="${funcionario.getCpf()}"/></td>
                        <td><c:out value="${funcionario.getEmail()}"/></td>
                        <td><c:out value="${funcionario.getTelefone()}"/></td>
                        <td><c:out value="${funcionario.getCargo()}"/></td>
                <form method="post" action="${pageContext.request.contextPath}/FuncionarioServletDeleta">
                    <td><button class="buttomDeletar" type="submit" value="${funcionario.getId()}" name="id" style="width: 70px; height: 30px">Delete</button></td>
                </form>
                <td><a href="FuncionarioServletUpdate?id=${funcionario.getId()}"><button class="buttomUpdate" type="submit" value="${funcionario.getId()}" name="id" style="width: 70px; height: 30px">Atualizar</button></a></td>

            </tr>

        </c:forEach>

    </tbody>
</table>
</body>
</html>
