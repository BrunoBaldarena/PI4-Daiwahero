package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Imagem;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ImagemDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    public int inserir(Imagem imagem) {

        int pk_id = 0;

        try {

            String SQL = "INSERT INTO IMAGEM (IMAGEM, FK_PRODUTO) VALUES (?,?);";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, imagem.getImagem());
            ps.setInt(5, imagem.getFk_produto());

            ps.execute();

            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return pk_id;
    }

    // Metodo para editar categoria
    public void Editar(Imagem imagem) {

        try {

            String SQL = "UPDATE IMAGEM SET IMAGEM_1=?,IMAGEM_2=?,IMAGEM_3=?,IMAGEM_4=?, FK_PRODUTO=? WHERE PK_IMAGEM=?";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setInt(5, imagem.getFk_produto());
            ps.setInt(6, imagem.getPk_imagem());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    public ArrayList<Imagem> listar() {
        String SQL = "SELECT * FROM IMAGEM WHERE IMAGEMPERFIL = 1;";
        ArrayList<Imagem> lista = new ArrayList<>();
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {
                Imagem imagem = new Imagem();
                imagem.setPk_imagem(rs.getInt("PK_IMAGEM"));
                imagem.setImagem(rs.getString("DIRETORIO"));
                imagem.setFk_produto(rs.getInt("FK_PRODUTO"));
                lista.add(imagem);
            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public ArrayList<Imagem> listarID(int id) {
        String SQL = "SELECT * FROM IMAGEM WHERE FK_PRODUTO = " + id + ";";
        ArrayList<Imagem> lista = new ArrayList<>();
        try {

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {
                Imagem imagem = new Imagem();
                imagem.setPk_imagem(rs.getInt("PK_IMAGEM"));
                imagem.setImagem(rs.getString("DIRETORIO"));
                imagem.setFk_produto(rs.getInt("FK_PRODUTO"));
                lista.add(imagem);
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
