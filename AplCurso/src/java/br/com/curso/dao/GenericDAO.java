
package br.com.curso.dao;

import  java.util.List;

public interface GenericDAO {
    
    public Boolean cadastrar(Object object);
    public Boolean inserir(Object object);
    public Boolean alterar(Object object);
    public Boolean excluir(int numero);
    public Object carregar(int numero);
    public List<Object> listar();
}
