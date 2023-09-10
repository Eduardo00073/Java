package br.com.curso.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {
    private static Connection conexao = null;
    private static String servidor = "jdbc:postgresql://localhost:5432/ba2?autoReconnect=true";
    private static String usuario = "postgres";
    private static String senha = "123456";
    
    static {
        try {
            conectar();
        }catch (Exception ex){
            System.out.println("Erro ao Conectar ao Banco de dados");
            ex.printStackTrace();
        }
    }
    
    public SingleConnection()throws Exception{
        conectar();
    }
    
    public static void conectar() throws Exception {
        try {
         if (conexao == null) {
             Class.forName("org.postgresql.Driver");
             conexao = DriverManager.getConnection(servidor, usuario, senha);
             conexao.setAutoCommit (false);
         }
        }catch (Exception ex) {
            throw new Exception (ex.getMessage());
        }
    }
    
    public static Connection getConnection(){
        return conexao;
    }
}
