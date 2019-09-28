package br.com.senac.pi4.daiwahero.model;

public class Funcionario extends Pessoa {

    private String Cargo;
    private boolean habilitado;

    public Funcionario()
    {
        
    }
    
    public Funcionario(String Cargo, boolean habilitado)
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

    public boolean isHabilitado() {
        return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }
}
