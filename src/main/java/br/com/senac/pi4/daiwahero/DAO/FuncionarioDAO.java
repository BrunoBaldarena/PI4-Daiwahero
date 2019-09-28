package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Funcionario;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FuncionarioDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    public int salvar(Funcionario funcionario) {

        int pk_id = 0;
        try {

            String SQL = "INSERT INTO FUNCIONARIO (NOME, CPF, EMAIL, SENHA, "
                    + "GENERO, TELEFONE, DATANASC, ENDERECO, BAIRRO, CIDADE, UF,"
                    + "COMPLEMENTO, NUMERO, CARGO, HABILITADO)"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,1);";

            try (PreparedStatement ps = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, funcionario.getNome());
                ps.setString(2, funcionario.getCpf());
                ps.setString(3, funcionario.getEmail());
                ps.setString(4, funcionario.getSenha());
                ps.setString(5, funcionario.getGenero());
                ps.setString(6, funcionario.getTelefone());
                ps.setDate(7, funcionario.getDataNasc());
                ps.setString(8, funcionario.getEndereco());
                ps.setString(9, funcionario.getBairro());
                ps.setString(10, funcionario.getUf());
                ps.setString(11, funcionario.getComplemento());
                ps.setString(12, funcionario.getNumero());
                ps.setString(13, funcionario.getCargo());
                ps.execute();
                
                ResultSet rs = ps.getGeneratedKeys();
                
                if (rs.next()) {
                    pk_id = rs.getInt(1);
                }
            }
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return pk_id;
    }
}
