package br.com.senac.pi4.daiwahero.model;

public class Imagem {
    
    private int pk_imagem;
    private String imagem1;
    private String imagem2;
    private String imagem3;
    private String imagem4;
    
    public Imagem(){
        
    }

    public Imagem(int pk_imagem, String imagem1, String imagem2, String imagem3, String imagem4) {
        this.pk_imagem = pk_imagem;
        this.imagem1 = imagem1;
        this.imagem2 = imagem2;
        this.imagem3 = imagem3;
        this.imagem4 = imagem4;
    }

    public int getPk_imagem() {
        return pk_imagem;
    }

    public void setPk_imagem(int pk_imagem) {
        this.pk_imagem = pk_imagem;
    }

    public String getImagem1() {
        return imagem1;
    }

    public void setImagem1(String imagem1) {
        this.imagem1 = imagem1;
    }

    public String getImagem2() {
        return imagem2;
    }

    public void setImagem2(String imagem2) {
        this.imagem2 = imagem2;
    }

    public String getImagem3() {
        return imagem3;
    }

    public void setImagem3(String imagem3) {
        this.imagem3 = imagem3;
    }

    public String getImagem4() {
        return imagem4;
    }

    public void setImagem4(String imagem4) {
        this.imagem4 = imagem4;
    }
    
    
    
}
