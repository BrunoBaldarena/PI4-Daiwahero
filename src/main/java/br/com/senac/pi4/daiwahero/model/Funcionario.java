package br.com.senac.pi4.daiwahero.model;

public class Funcionario extends Pessoa {

    private String Cargo;
    private int habilitado;

    public Funcionario()
    {
        
    }
    
    public Funcionario(String Cargo, int habilitado)
    {
        this.Cargo = Cargo;
        this.habilitado = habilitado;
    }
    
    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String Cargo) {
        this.Cargo = Cargo;
    }

    public int getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(int habilitado) {
        this.habilitado = habilitado;
    }
}
