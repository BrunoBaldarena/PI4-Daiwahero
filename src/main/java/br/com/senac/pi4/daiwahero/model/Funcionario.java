package br.com.senac.pi4.daiwahero.model;

public class Funcionario extends Pessoa {

    private String Cargo;
    

    public Funcionario()
    {
        
    }
    
    public Funcionario(String Cargo, int habilitado)
    {
        this.Cargo = Cargo;
       
    }
    
    public String getCargo() {
        return Cargo;
    }

    public void setCargo(String Cargo) {
        this.Cargo = Cargo;
    }


   
}
