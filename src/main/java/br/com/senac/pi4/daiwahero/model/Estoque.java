package br.com.senac.pi4.daiwahero.model;

public class Estoque{
    private int pk_estoque;
    private int quantidade;
    private int fk_produto;

    public Estoque(){
        
    }

    public Estoque(int pk_estoque, int quantidade, int fk_produto) {
        this.pk_estoque = pk_estoque;
        this.quantidade = quantidade;
        this.fk_produto = fk_produto;
    }
    

    public int getFk_produto() {
        return fk_produto;
    }

    public void setFk_produto(int fk_produto) {
        this.fk_produto = fk_produto;
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
