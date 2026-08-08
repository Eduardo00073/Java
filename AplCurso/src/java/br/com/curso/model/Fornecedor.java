
package br.com.curso.model;

import br.com.curso.utils.Conversao;
import java.text.ParseException;
import java.util.Date;

public class Fornecedor  extends Pessoa{
    private int idFornecedor;
    private String enderecoweb;
    private String situacao;
    private String permiteLogin;

    public Fornecedor(int idFornecedor, String permiteLogin, String situacao, String enderecoweb, int idPessoa, 
            String cpfCnpj, String nome, Date dataNascimento, Cidade cidade, String login, 
            String senha, String foto) {
        super(idPessoa, cpfCnpj, nome, dataNascimento, cidade, login, senha, foto);
        this.idFornecedor = idFornecedor;
        this.enderecoweb = enderecoweb;
        this.situacao = situacao;
        this.permiteLogin = permiteLogin;
    }
    public static Fornecedor fornecedorVazio() throws ParseException{
        Cidade oCidade = new Cidade();
        Date dataNascimento = Conversao.dataAtual();
        Fornecedor oFornecedor = new Fornecedor(0,"S","A","",0,"","",dataNascimento,oCidade,"","",null);
        return oFornecedor;
    }

    public int getIdFornecedor() {
        return idFornecedor;
    }

    public void setIdFornecedor(int idFornecedor) {
        this.idFornecedor = idFornecedor;
    }

    public String getEnderecoweb() {
        return enderecoweb;
    }

    public void setEnderecoweb(String enderecoweb) {
        this.enderecoweb = enderecoweb;
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
