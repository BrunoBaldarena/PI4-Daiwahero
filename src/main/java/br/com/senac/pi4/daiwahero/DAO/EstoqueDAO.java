package br.com.senac.pi4.daiwahero.DAO;

import br.com.senac.pi4.daiwahero.model.Estoque;
import br.com.senac.pi4.daiwahero.utils.ConnectionUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EstoqueDAO {

    //Chama a conexao com o banco de dados 
    Connection connection = ConnectionUtils.getConnection();

    
    public int inserir(Estoque estoque) {

        int pk_estoque =0;
        try {

            String SQL = "INSERT INTO ESTOQUE (QUANTIDADE) VALUES (?);";

            PreparedStatement ps = connection.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);

            
            ps.setInt(1, estoque.getQuantidade());

            ps.execute();
             ResultSet rs = ps.getGeneratedKeys();
             
             if(rs.next()){
                pk_estoque = rs.getInt(1);
            }
             
            
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
        
        return pk_estoque;
    }

    
     // Metodo para editar categoria
    public void Editar(Estoque estoque) {

        try {

            String SQL = "UPDATE ESTOQUE SET QUANTIDADE=? WHERE PK_ESTOQUE=?";

            PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setInt(1, estoque.getQuantidade());
            ps.setInt(2, estoque.getPk_estoque());

            ps.execute();
            ps.close();
            connection.close();

        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
