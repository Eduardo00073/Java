package br.com.curso.model;

import br.com.curso.utils.Conversao;
import java.util.Date;

public class Despesa {
    private int iddespesa;
    private String descricao;
    private Date datadocumento;
    private double valordespesa;
    private double valorpago;
    private String imagemdocumento;

    public Despesa() {
        this.iddespesa = 0;
        this.descricao = "";
        this.datadocumento = Conversao.dataAtual();
        this.valordespesa = 0.0;
        this.valorpago = 0.0;
    }

    public Despesa(int iddespesa, String descricao, Date datadocumento, double valordespesa, double valorpago, String imagemdocumento) {
        this.iddespesa = iddespesa;
        this.descricao = descricao;
        this.datadocumento = datadocumento;
        this.valordespesa = valordespesa;
        this.valorpago = valorpago;
        this.imagemdocumento = imagemdocumento;
    }

    public int getIddespesa() {
        return iddespesa;
    }

    public void setIddespesa(int iddespesa) {
        this.iddespesa = iddespesa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Date getDatadocumento() {
        return datadocumento;
    }

    public void setDatadocumento(Date datadocumento) {
        this.datadocumento = datadocumento;
    }

    public double getValordespesa() {
        return valordespesa;
    }

    public void setValordespesa(double valordespesa) {
        this.valordespesa = valordespesa;
    }

    public double getValorpago() {
        return valorpago;
    }

    public void setValorpago(double valorpago) {
        this.valorpago = valorpago;
    }

    public String getImagemdocumento() {
        return imagemdocumento;
    }

    public void setImagemdocumento(String imagemdocumento) {
        this.imagemdocumento = imagemdocumento;
    }
    
    
}
