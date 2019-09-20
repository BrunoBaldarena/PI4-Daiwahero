package br.com.senac.pi4.daiwahero.model;

public class Estoque{
    private int pk_estoque;
    private int quantidade;

    public Estoque(){
        
    }
    
    public Estoque(int pk_estoque, int quantidade) {
        this.pk_estoque = pk_estoque;
        this.quantidade = quantidade;
    }

    public int getPk_estoque() {
        return pk_estoque;
    }

    public void setPk_estoque(int pk_estoque) {
        this.pk_estoque = pk_estoque;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
}
