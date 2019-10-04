package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Estoque;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EstoqueDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    public void inserir(Estoque estoque) {

        int pk_estoque = 0;
        try {

            String SQL = "INSERT INTO ESTOQUE (QUANTIDADE,FK_PRODUTO) VALUES (?,?);";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setInt(1, estoque.getQuantidade());
            ps.setInt(2, estoque.getFk_produto());

            ps.execute();

            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

    }

    // Metodo para editar categoria
    public void Editar(Estoque estoque) {

        try {

            String SQL = "UPDATE ESTOQUE SET QUANTIDADE=? WHERE FK_PRODUTO=?";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setInt(1, estoque.getQuantidade());
            ps.setInt(2, estoque.getFk_produto());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    
     public ArrayList<Estoque> listarID(int id) {
        String SQL = "SELECT * FROM ESTOQUE WHERE FK_PRODUTO = " + id + ";";
        ArrayList<Estoque> lista = new ArrayList<>();
        
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setQuantidade(rs.getInt("QUANTIDADE"));
                lista.add(estoque);

            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
     
     public ArrayList<Estoque> listarTudo() {
        String SQL = "SELECT * FROM ESTOQUE";
        
        
        ArrayList<Estoque> lista = new ArrayList<>();
        
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {
                Estoque estoque = new Estoque();
                estoque.setQuantidade(rs.getInt("QUANTIDADE"));
                lista.add(estoque);

            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }
    
}
