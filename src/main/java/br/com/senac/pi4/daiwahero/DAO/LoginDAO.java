package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Funcionario;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class LoginDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    //Metodo que consulta o banco e verifica se usuario existe, retornando boolean
    public boolean login(Funcionario funcionario) {

        try {
            connection = ConnectionUtils.getConnection();

            String SQL = "select email, senha from funcionario where email= ? and senha = ?";
            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, funcionario.getEmail());
            ps.setString(2, funcionario.getSenha());

            ResultSet rs = ps.executeQuery();

            ps.close();
            connection.close();
            return true;

        } catch (SQLException ex) {
            return false;

        }

    }

 
    public ArrayList<Funcionario> cargo(String email) {

        ArrayList<Funcionario> cargolista = new ArrayList<>();

        try {

            String SQL = "select cargo from funcionario where email='"+email+"';";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Funcionario func = new Funcionario();
                func.setCargo(rs.getString("cargo"));

                cargolista.add(func);
            }
            
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        
        return cargolista;
    }

}
