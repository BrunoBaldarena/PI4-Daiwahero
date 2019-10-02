<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="${pageContext.request.contextPath}/FuncionarioServletUpdate" method="post">
            <div>
                ${msg}
            </div>
            <br>
            <br>
            <br>

            <labe>Código:</labe><br>
            <input type="text" name="id" value="${funcionario.getId()}"><br><br>

            <labe>Nome:</labe><br>
            <input type="text" name="nome" value="${funcionario.getNome()}"><br><br>

            <labe>CPF:</labe><br>
            <input type="text" name="cpf" value="${funcionario.getCpf()}"><br><br>

            <labe>Email:</labe><br>
            <input type="text" name="email" value="${funcionario.getEmail()}"><br><br>

            <labe>Senha:</labe><br>
            <input type="text" name="senha" value="${funcionario.getSenha()}"><br><br>

            <labe>Genero:</labe><br>
            <input type="text" name="genero" value="${funcionario.getGenero()}"><br><br>

            <labe>Telefone:</labe><br>
            <input type="text" name="telefone" value="${funcionario.getTelefone()}"><br><br>

            <labe>Data Nascimento:</labe><br>
            <input type="text" name="dataNasc" value="${funcionario.getDataNasc()}"><br><br>

            <labe>Endereço></labe><br>
            <input type="text" name="endereco" value="${funcionario.getEndereco()}"><br><br>

            <labe>Bairro:</labe><br>
            <input type="text" name="bairro" value="${funcionario.getBairro()}"><br><br>

            <labe>Cidade:</labe><br>
            <input type="text" name="cidade" value="${funcionario.getCidade()}"><br><br>

            <labe>UF:</labe><br>
            <input type="text" name="uf" value="${funcionario.getUf()}"><br><br>

            <labe>Complemento:</labe><br>
            <input type="text" name="complemento" value="${funcionario.getComplemento()}"><br><br>

            <labe>Numero:</labe><br>
            <input type="text" name="numero" value="${funcionario.getNumero()}"><br><br>

            <labe>Cargo:</labe>
            <select name="cargo" placeholder="Qual?" value="${funcionario.getCargo()}">
                <option>Administrador</option>  
                <option>Auxiliar</option>  
            </select><br><br>

            <button type="submit">Salvar</button>
        </form>
    </body>
</html>
