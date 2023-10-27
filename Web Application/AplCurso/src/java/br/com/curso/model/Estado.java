
package br.com.curso.model;


public class Estado {
    
    private int idEstado;
    private String nomeEstado;
    private String SiglaEstado;
    

    public Estado() {
        this.idEstado = 0;
        this.nomeEstado = "";
        this.SiglaEstado = "";
    }

    public Estado(int idEstado, String nomeEstado, String SiglaEstado) {
        this.idEstado = idEstado;
        this.nomeEstado = nomeEstado;
        this.SiglaEstado = SiglaEstado;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    public String getNomeEstado() {
        return nomeEstado;
    }

    public void setNomeEstado(String nomeEstado) {
        this.nomeEstado = nomeEstado;
    }

    public String getSiglaEstado() {
        return SiglaEstado;
    }

    public void setSiglaEstado(String SiglaEstado) {
        this.SiglaEstado = SiglaEstado;
    }
    
    
    
}
