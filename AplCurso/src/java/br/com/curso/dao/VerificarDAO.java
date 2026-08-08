
package br.com.curso.dao;

import br.com.curso.utils.SingleConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class VerificarDAO extends EstadoDAO{
    public int VerificarVinculo(int codigoDoEstado)
    {
        
         try 
        {
            PreparedStatement preparedStatement = null;
            preparedStatement = conexao.prepareStatement("select count(idcidade) as qtde from cidade where idestado = ?");
            preparedStatement.setInt(1, codigoDoEstado);
            ResultSet rs = null;
            rs = preparedStatement.executeQuery();
            while(rs.next())
            {
                int qtdeDeCidadesVinculadasAoEstado = rs.getInt("qtde");
                if(qtdeDeCidadesVinculadasAoEstado != 0)
                    return 2;
                else
                    return 1; 
            }
        } 
        catch (SQLException exception) 
        {
            System.out.println("Erro ao buscar cidades associadas ao estado." + exception.getMessage());
            return 0;
        }
        return 0;
    }
     public VerificarDAO() throws Exception 
    {
        
    }
   
}
