package br.com.senac.pi4.daiwahero.model;

public class Produto{
    private int pk_produto;
    private String nome_produto;
    private String valor;
    private String descricao;
    private String breveDescricao;
    private int status;
    private int fk_estoque;
    private int fk_imagem; 

    public int getFk_estoque() {
        return fk_estoque;
    }

    public void setFk_estoque(int fk_estoque) {
        this.fk_estoque = fk_estoque;
    }

    public int getFk_imagem() {
        return fk_imagem;
    }

    public void setFk_imagem(int fk_imagem) {
        this.fk_imagem = fk_imagem;
    }
    
    
   public Produto(){
        
    }

    public Produto(int pk_produto, String nome_produto, String valor, String descricao, String breveDescricao, int status, int fk_estoque, int fk_imagem, int fk_categoria) {
        this.pk_produto = pk_produto;
        this.nome_produto = nome_produto;
        this.valor = valor;
        this.descricao = descricao;
        this.breveDescricao = breveDescricao;
        this.status = status;
        this.fk_estoque = fk_estoque;
        this.fk_imagem = fk_imagem;
        this.fk_categoria = fk_categoria;
    }
   
   

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }



    public String getBreveDescricao() {
        return breveDescricao;
    }

    public void setBreveDescricao(String breveDescricao) {
        this.breveDescricao = breveDescricao;
    }
    private int fk_categoria;

 
    


    public int getPk_produto() {
        return pk_produto;
    }

    public void setPk_produto(int pk_produto) {
        this.pk_produto = pk_produto;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome) {
        this.nome_produto = nome_produto;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getFk_categoria() {
        return fk_categoria;
    }

    public void setFk_categoria(int fk_categoria) {
        this.fk_categoria = fk_categoria;
    }
    
}
