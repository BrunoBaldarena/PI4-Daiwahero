package br.com.senac.pi4.daiwahero.model;

public class Imagem {

    private int pk_imagem;
    private String imagem;
    private int fk_produto;

    public Imagem() {

    }

    public Imagem(int pk_imagem, String imagem, int fk_produto) {
        this.pk_imagem = pk_imagem;
        this.imagem = imagem;
        this.fk_produto = fk_produto;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    public int getPk_imagem() {
        return pk_imagem;
    }

    public void setPk_imagem(int pk_imagem) {
        this.pk_imagem = pk_imagem;
    }

    public int getFk_produto() {
        return fk_produto;
    }

    public void setFk_produto(int fk_produto) {
        this.fk_produto = fk_produto;
    }
}
