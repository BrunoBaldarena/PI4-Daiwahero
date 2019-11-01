package br.com.senac.pi4.daiwahero.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/*
Abrir conexão com banco de dados MySQL

 */
public class ConnectionUtils {

    //Metodo conecta com o Banco de dados
    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/DAIWAHERO", "root", "");

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);

        }

    }

}
