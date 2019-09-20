package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Produto;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    public void salvar(Produto produto) {

        try {
            String SQL = "INSERT INTO PRODUTO (NOME, DESCRICAO,BREVEDESCRICAO, VALOR,FK_ESTOQUE,FK_IMAGEM, FK_CATEGORIA, STATUS, TG_STATUS) VALUES (?,?,?,?,?,?,?,?,0);";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, produto.getNome_produto());
            ps.setString(2, produto.getDescricao());
            ps.setString(3, produto.getBreveDescricao());
            ps.setString(4, produto.getValor());
            ps.setInt(5, produto.getFk_estoque());
            ps.setInt(6, produto.getFk_imagem());
            ps.setInt(7, produto.getFk_categoria());
            ps.setInt(8, produto.getStatus());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

    }

    public List<Produto> buscarTodos() {

        List<Produto> produtos = new ArrayList<>();

        try {

            String SQL = "SELECT * FROM PRODUTO WHERE TG_STATUS=0";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Produto produto = new Produto();
                produto.setPk_produto(rs.getInt("PK_PRODUTO"));
                produto.setNome_produto(rs.getString("NOME"));
                produto.setValor(rs.getString("VALOR"));
                produto.setFk_categoria(rs.getInt("FK_CATEGORIA"));
                produto.setFk_estoque(rs.getInt("FK_ESTOQUE"));
                produto.setFk_imagem(rs.getInt("FK_IMAGEM"));
                produto.setStatus(rs.getInt("STATUS"));

                produtos.add(produto);
            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return produtos;
    }
    
    public List<Produto> buscarNome(String nome) {

        List<Produto> produtos = new ArrayList<>();

        try {

            String SQL = "SELECT * FROM PRODUTO WHERE TG_STATUS=0 AND NOME="+nome+";";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Produto produto = new Produto();
                produto.setPk_produto(rs.getInt("PK_PRODUTO"));
                produto.setNome_produto(rs.getString("NOME"));
                produto.setValor(rs.getString("VALOR"));
                produto.setFk_categoria(rs.getInt("FK_CATEGORIA"));
                produto.setFk_estoque(rs.getInt("FK_ESTOQUE"));
                produto.setFk_imagem(rs.getInt("FK_IMAGEM"));
                produto.setStatus(rs.getInt("STATUS"));

                produtos.add(produto);
            }
            st.close();
            connection.close();
            rs.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return produtos;
    }
    
    
     // Metodo que seta 0 para TG_STATUS inativando logicamente o elemento
    public void inativar(Produto produto)
            throws SQLException, Exception {
        try {
            String sql = "UPDATE PRODUTO SET TG_STATUS =1 WHERE PK_PRODUTO = ?";

            PreparedStatement pst = connection.prepareStatement(sql);
            pst.setInt(1, produto.getPk_produto());

            pst.execute();
            pst.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    
     // Metodo para editar categoria
    public void Editar(Produto produto) {

        try {

            String SQL = "UPDATE PRODUTO SET NOME = ?, DESCRICAO = ?, BREVEDESCRICAO = ?, VALOR = ?, FK_CATEGORIA=?, STATUS = ? WHERE ID = ?";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, produto.getNome_produto());
            ps.setString(2, produto.getDescricao());
            ps.setString(3, produto.getBreveDescricao());
            ps.setString(4, produto.getValor());
            ps.setInt(5, produto.getFk_categoria());
            ps.setInt(6, produto.getStatus());
            ps.setInt(7, produto.getPk_produto());


            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
