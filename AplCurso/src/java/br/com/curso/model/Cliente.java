
package br.com.curso.model;

import br.com.curso.utils.Conversao;
import java.text.ParseException;
import java.util.Date;


public class Cliente  extends Pessoa{
    private int idCliente;
    private String observacao;
    private String situacao;
    private String permiteLogin;

    public Cliente(int idCliente, String permiteLogin, String situacao, String observacao, int idPessoa, 
            String cpfCnpj, String nome, Date dataNascimento, Cidade cidade, String login, 
            String senha, String foto) {
        super(idPessoa, cpfCnpj, nome, dataNascimento, cidade, login, senha, foto);
        this.idCliente = idCliente;
        this.observacao = observacao;
        this.situacao = situacao;
        this.permiteLogin = permiteLogin;
    }
    public static Cliente clienteVazio() throws ParseException{
        Cidade oCidade = new Cidade();
        Date dataNascimento = Conversao.dataAtual();
        Cliente oCliente = new Cliente(0,"S","A","",0,"","",dataNascimento,oCidade,"","",null);
        return oCliente;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public String getPermiteLogin() {
        return permiteLogin;
    }

    public void setPermiteLogin(String permiteLogin) {
        this.permiteLogin = permiteLogin;
    }
    
}
