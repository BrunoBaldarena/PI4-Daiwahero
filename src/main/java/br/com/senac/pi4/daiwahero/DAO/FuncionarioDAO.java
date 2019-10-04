package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Funcionario;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class FuncionarioDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    public int salvar(Funcionario funcionario) {

        java.sql.Date dataSql = new java.sql.Date(funcionario.getDataNasc().getTime());

        int pk_id = 0;
        try {

            String SQL = "INSERT INTO FUNCIONARIO (NOME, CPF, EMAIL, SENHA, "
                    + "GENERO, TELEFONE, DATANASC, CEP, ENDERECO, BAIRRO, CIDADE, UF,"
                    + "COMPLEMENTO, NUMERO, CARGO, TG_STATUS)"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1);";

            try (PreparedStatement ps = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {
                ps.setString(1, funcionario.getNome());
                ps.setString(2, funcionario.getCpf());
                ps.setString(3, funcionario.getEmail());
                ps.setString(4, funcionario.getSenha());
                ps.setString(5, funcionario.getGenero());
                ps.setString(6, funcionario.getTelefone());
                ps.setDate(7, dataSql);
                ps.setString(8, funcionario.getCep());
                ps.setString(9, funcionario.getEndereco());
                ps.setString(10, funcionario.getBairro());
                ps.setString(11, funcionario.getCidade());
                ps.setString(12, funcionario.getUf());
                ps.setString(13, funcionario.getComplemento());
                ps.setString(14, funcionario.getNumero());
                ps.setString(15, funcionario.getCargo());
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

    public ArrayList<Funcionario> buscarTodos() {

        ArrayList<Funcionario> funcionarios = new ArrayList<>();

        try {

            String SQL = "SELECT * FROM FUNCIONARIO WHERE TG_STATUS = 1";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Funcionario funcionario = new Funcionario();

                funcionario.setId(rs.getInt("PK_FUNCIONARIO"));
                funcionario.setNome(rs.getString("NOME"));
                funcionario.setCpf(rs.getString("CPF"));
                funcionario.setEmail(rs.getString("EMAIL"));
                funcionario.setSenha(rs.getString("SENHA"));
                funcionario.setGenero(rs.getString("GENERO"));
                funcionario.setTelefone(rs.getString("TELEFONE"));
                funcionario.setDataNasc(rs.getDate("DATANASC"));
                funcionario.setCep(rs.getString("CEP"));
                funcionario.setEndereco(rs.getString("ENDERECO"));
                funcionario.setBairro(rs.getString("BAIRRO"));
                funcionario.setCidade(rs.getString("CIDADE"));
                funcionario.setUf(rs.getString("UF"));
                funcionario.setComplemento(rs.getString("COMPLEMENTO"));
                funcionario.setNumero(rs.getString("NUMERO"));
                funcionario.setCargo(rs.getString("CARGO"));
                funcionario.setTgStatus(rs.getInt("TG_STATUS"));

                funcionarios.add(funcionario);
            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return funcionarios;
    }

    // Metodo para editar categoria
    public boolean Editar(Funcionario funcionario) {

        java.sql.Date dataSql = new java.sql.Date(funcionario.getDataNasc().getTime());

        boolean resultado = true;
        try {

            String SQL = "UPDATE FUNCIONARIO SET NOME = ?, CPF = ?, SENHA = ?, GENERO = ?, TELEFONE = ?, DATANASC = ?, CEP = ?,  ENDERECO = ?, BAIRRO = ?, CIDADE = ?, UF = ?, COMPLEMENTO = ?, NUMERO = ?, CARGO = ? WHERE PK_FUNCIONARIO = ?";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, funcionario.getNome());
            ps.setString(2, funcionario.getCpf());
            ps.setString(3, funcionario.getSenha());
            ps.setString(4, funcionario.getGenero());
            ps.setString(5, funcionario.getTelefone());
            ps.setDate(6, dataSql);
            ps.setString(7, funcionario.getCep());
            ps.setString(8, funcionario.getEndereco());
            ps.setString(9, funcionario.getBairro());
            ps.setString(10, funcionario.getCidade());
            ps.setString(11, funcionario.getUf());
            ps.setString(12, funcionario.getComplemento());
            ps.setString(13, funcionario.getNumero());
            ps.setString(14, funcionario.getCargo());
            ps.setInt(15, funcionario.getId());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            resultado = false;
            throw new RuntimeException(ex);
        }

        return resultado;
    }

    public Funcionario buscarID(int id) {

        Funcionario funcionario = new Funcionario();

        try {

            String SQL = "SELECT * FROM FUNCIONARIO WHERE PK_FUNCIONARIO =" + id + ";";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                funcionario.setId(rs.getInt("PK_FUNCIONARIO"));
                funcionario.setNome(rs.getString("NOME"));
                funcionario.setCpf(rs.getString("CPF"));
                funcionario.setEmail(rs.getString("EMAIL"));
                funcionario.setSenha(rs.getString("SENHA"));
                funcionario.setGenero(rs.getString("GENERO"));
                funcionario.setTelefone(rs.getString("TELEFONE"));
                funcionario.setDataNasc(rs.getDate("DATANASC"));
                funcionario.setCep(rs.getString("CEP"));
                funcionario.setEndereco(rs.getString("ENDERECO"));
                funcionario.setBairro(rs.getString("BAIRRO"));
                funcionario.setCidade(rs.getString("CIDADE"));
                funcionario.setUf(rs.getString("UF"));
                funcionario.setComplemento(rs.getString("COMPLEMENTO"));
                funcionario.setNumero(rs.getString("NUMERO"));
                funcionario.setCargo(rs.getString("CARGO"));
              

            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return funcionario;
    }

    // Metodo que seta 0 para TG_STATUS inativando logicamente o elemento
    public boolean inativar(int id)
            throws SQLException, Exception {

        boolean resultado = true;
        try {
            String sql = "UPDATE FUNCIONARIO SET TG_STATUS = 0 WHERE PK_FUNCIONARIO = ?";

            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, id);

            pst.execute();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            resultado = false;
            throw new RuntimeException(e);

        }
        return resultado;
    }

}
