package br.com.senac.pi4.daiwahero.model;

import java.util.Date;

public class Pessoa extends Endereco {

    private int id;
    private String nome;
    private String genero;
    private String email;
    private String senha;
    private String cpf;
    private String telefone;
    private Date dataNasc;
    private int tgStatus;

    public Pessoa() {

    }

    public Pessoa(String nome, String genero, String email, String senha, String cpf, String telefone, Date dataNasc) {
        this.nome = nome;
        this.genero = genero;
        this.email = email;
        this.senha = senha;
        this.cpf = cpf;
        this.telefone = telefone;
        this.dataNasc = dataNasc;
    }

    public Pessoa(int id, String nome, String genero, String email, String senha, String cpf, String telefone, Date dataNasc) {
        this.id = id;
        this.nome = nome;
        this.genero = genero;
        this.email = email;
        this.senha = senha;
        this.cpf = cpf;
        this.telefone = telefone;
        this.dataNasc = dataNasc;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public int getTgStatus() {
        return tgStatus;
    }

    public void setTgStatus(int tgStatus) {
        this.tgStatus = tgStatus;
    }

}
