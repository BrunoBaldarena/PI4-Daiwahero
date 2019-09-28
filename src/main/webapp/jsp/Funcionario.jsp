<%-- 
    Document   : Funcionario
    Created on : 27/09/2019, 20:26:43
    Author     : johnathan.mbmata
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="${pageContext.request.contextPath}/funcionarioSalvar" method="post">
            <labe>Nome:</labe><br>
            <input type="text" name="nome" ><br><br>

            <labe>CPF:</labe><br>
            <input type="text" name="cpf" ><br><br>

            <labe>Email:</labe><br>
            <input type="text" name="email" ><br><br>

            <labe>Senha:</labe><br>
            <input type="text" name="senha" ><br><br>

            <labe>Genero:</labe><br>
            <input type="text" name="genero" ><br><br>

            <labe>Telefone:</labe><br>
            <input type="text" name="telefone" ><br><br>

            <labe>Data Nascimento:</labe><br>
            <input type="text" name="dataNasc" ><br><br>

            <labe>Endereço></labe><br>
            <input type="text" name="endereco" ><br><br>

            <labe>Bairro:</labe><br>
            <input type="text" name="bairro" ><br><br>

            <labe>Cidade:</labe><br>
            <input type="text" name="cidade" ><br><br>

            <labe>UF:</labe><br>
            <input type="text" name="uf" ><br><br>

            <labe>Complemento:</labe><br>
            <input type="text" name="complemento" ><br><br>

            <labe>Numero:</labe><br>
            <input type="text" name="numero" ><br><br>

            <labe>Cargo:</labe>
            <select name="cargo" placeholder="Qual?">
                <option>Administrador</option>  
                <option>Auxiliar</option>  
            </select>
        </form>
    </body>
</html>
