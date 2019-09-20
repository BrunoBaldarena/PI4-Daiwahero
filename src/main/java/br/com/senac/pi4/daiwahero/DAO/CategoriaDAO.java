package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import br.com.senac.pi4.daiwahero.model.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoriaDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    //Método que insere categoria no banco de dados
    public void inserir(Categoria categoria) {

        try {

            String SQL = "INSERT INTO CATEGORIA (NOME,TG_STATUS) VALUES(?,0)";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, categoria.getNome());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    //Metodo que busca todos os dados da categoria e adiciona em uma lista
    public ArrayList<Categoria> listarTudo() {
        String SQL = "SELECT * FROM CATEGORIA WHERE TG_STATUS=0";
        ArrayList<Categoria> lista = new ArrayList<>();
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("PK_CATEGORIA"));
                categoria.setNome(rs.getString("NOME"));
                lista.add(categoria);

            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    //Metodo que busca por categoria atraves do ID
    public ArrayList<Categoria> listarID(int id) {
        String SQL = "SELECT * FROM CATEGORIA WHERE PK_CATEGORIA = " + id + " AND TG_STATUS=0";
        ArrayList<Categoria> lista = new ArrayList<>();
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(rs.getInt("PK_CATEGORIA"));
                categoria.setNome(rs.getString("NOME"));
                lista.add(categoria);

            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    // Metodo para editar categoria
    public void Editar(Categoria categoria) {

        try {

            String SQL = "UPDATE CATEGORIA SET NOME=? WHERE PK_CATEGORIA=?";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, categoria.getNome());
            ps.setInt(2, categoria.getId());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
    
    // Metodo que seta 0 para TG_STATUS inativando logicamente o elemento
    public void inativar(Categoria categoria)
            throws SQLException, Exception {
        try {
            String sql = "UPDATE CATEGORIA SET TG_STATUS =1 WHERE PK_CATEGORIA = ?";

            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, categoria.getId());

            pst.execute();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
