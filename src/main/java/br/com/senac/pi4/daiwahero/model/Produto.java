package br.com.senac.pi4.daiwahero.model;

public class Produto{
    private int pk_produto;
    private String nome;
    private String valor;
    private String descricao;
    private String breveDescricao;
    private int status;
    private int fk_categoria;
    
   public Produto(){
        
    }

    public Produto(int pk_produto, String nome, String valor, String descricao, String breveDescricao, int status, int fk_categoria) {
        this.pk_produto = pk_produto;
        this.nome = nome;
        this.valor = valor;
        this.descricao = descricao;
        this.breveDescricao = breveDescricao;
        this.status = status;
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


    public int getPk_produto() {
        return pk_produto;
    }

    public void setPk_produto(int pk_produto) {
        this.pk_produto = pk_produto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
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
