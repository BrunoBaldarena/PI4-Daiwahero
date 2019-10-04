package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Categoria;
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

    public int salvar(Produto produto) {

        int pk_id = 0;
        try {

            String SQL = "INSERT INTO PRODUTO (NOME, DESCRICAO,BREVEDESCRICAO, VALOR, FK_CATEGORIA, STATUS, TG_STATUS) VALUES (?,?,?,?,?,?,0);";

            PreparedStatement ps = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getDescricao());
            ps.setString(3, produto.getBreveDescricao());
            ps.setString(4, produto.getValor());
            ps.setInt(5, produto.getFk_categoria());
            ps.setInt(6, produto.getStatus());

            ps.execute();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                pk_id = rs.getInt(1);
            }

            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        return pk_id;
    }

    //Busca por todos os elementos do banco de dados
    public ArrayList<Produto> listarTudo() {

        ArrayList<Produto> produtos = new ArrayList<>();

        try {

            String SQL = "SELECT P.PK_PRODUTO, P.NOME, P.VALOR, P.STATUS, C.NOME,"
                    + " E.QUANTIDADE FROM ESTOQUE AS E INNER JOIN CATEGORIA AS C "
                    + "INNER JOIN PRODUTO AS P ON P.PK_PRODUTO = E.PK_ESTOQUE"
                    + " AND P.FK_CATEGORIA = C.PK_CATEGORIA WHERE P.TG_STATUS = 0";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Produto produto = new Produto();

                produto.setPk_produto(rs.getInt("P.PK_PRODUTO"));
                produto.setNome(rs.getString("P.NOME"));
                produto.setValor(rs.getString("P.VALOR"));
                produto.setNome_categoria(rs.getString("C.NOME"));
                produto.setQuantidade_estoque(rs.getInt("E.QUANTIDADE"));
                produto.setStatus(rs.getInt("P.STATUS"));

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

    //Filtra os dados da tabela pelo nome
    public List<Produto> listarNome(String nome) {

        List<Produto> produtos = new ArrayList<>();

        try {

            String SQL = "SELECT P.PK_PRODUTO, P.NOME, P.VALOR, P.STATUS, C.NOME,"
                    + " E.QUANTIDADE FROM ESTOQUE AS E INNER JOIN CATEGORIA AS C "
                    + "INNER JOIN PRODUTO AS P ON P.PK_PRODUTO = E.PK_ESTOQUE"
                    + " AND P.FK_CATEGORIA = C.PK_CATEGORIA WHERE P.TG_STATUS = 0";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Produto produto = new Produto();
                produto.setPk_produto(rs.getInt("PK_PRODUTO"));
                produto.setNome(rs.getString("NOME"));
                produto.setValor(rs.getString("VALOR"));
                produto.setFk_categoria(rs.getInt("FK_CATEGORIA"));
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
    
    //Filtra os dados pelo ID
    public ArrayList<Produto> listarID(int id) {

       ArrayList<Produto> produtos = new ArrayList<>();

        try {

            String SQL = "SELECT P.PK_PRODUTO, P.FK_CATEGORIA,P.DESCRICAO, P.BREVEDESCRICAO, P.NOME, P.VALOR, P.STATUS, C.NOME,"
                    + " E.QUANTIDADE FROM ESTOQUE AS E INNER JOIN CATEGORIA AS C "
                    + "INNER JOIN PRODUTO AS P ON P.PK_PRODUTO = E.PK_ESTOQUE"
                    + " AND P.FK_CATEGORIA = C.PK_CATEGORIA WHERE P.PK_PRODUTO="+id+";";

            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(SQL);

            while (rs.next()) {

                Produto produto = new Produto();
                produto.setPk_produto(rs.getInt("P.PK_PRODUTO"));
                produto.setFk_categoria(rs.getInt("P.FK_CATEGORIA"));
                produto.setDescricao(rs.getString("P.DESCRICAO"));
                produto.setBreveDescricao(rs.getString("P.BREVEDESCRICAO"));
                produto.setNome(rs.getString("P.NOME"));
                produto.setValor(rs.getString("P.VALOR"));
                produto.setStatus(rs.getInt("P.STATUS"));
                produto.setNome_categoria(rs.getString("C.NOME"));
                produto.setQuantidade_estoque(rs.getInt("E.QUANTIDADE"));

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

    // Metodo para editar produto
    public void Editar(Produto produto) {

        try {
            
            String SQL="UPDATE PRODUTO SET NOME=?, VALOR=?, STATUS=?, FK_CATEGORIA=? WHERE PK_PRODUTO=?"; 
            PreparedStatement ps = connection.prepareStatement(SQL);
            
            ps.setString(1, produto.getNome());
            ps.setString(2, produto.getValor());
            ps.setInt(3, produto.getStatus());
            ps.setInt(4, produto.getFk_categoria());
            ps.setInt(5, produto.getPk_produto());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
