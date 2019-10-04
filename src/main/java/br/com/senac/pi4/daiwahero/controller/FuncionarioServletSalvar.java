package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.FuncionarioDAO;
import br.com.senac.pi4.daiwahero.model.Funcionario;
import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FuncionarioServletSalvar", urlPatterns = {"/FuncionarioServletSalvar"})
public class FuncionarioServletSalvar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("./jsp/CadastroFuncionario.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String genero = request.getParameter("sexo");
        String telefone = request.getParameter("telefone");
        String dataNasc = request.getParameter("dataNasc");
        String cep = request.getParameter("cep");
        String endereco = request.getParameter("endereco");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String uf = request.getParameter("uf");
        String complemento = request.getParameter("complemento");
        String numero = request.getParameter("numero");
        String cargo = request.getParameter("cargo");
     
        Funcionario funcionario = new Funcionario();
        FuncionarioDAO dao = new FuncionarioDAO();
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");

        Date data = null;
        try {
            data = formato.parse(dataNasc);
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioServletSalvar.class.getName()).log(Level.SEVERE, null, ex);
        }

        funcionario.setNome(nome);
        funcionario.setCpf(cpf);
        funcionario.setEmail(email);
        funcionario.setSenha(senha);
        funcionario.setGenero(genero);
        funcionario.setTelefone(telefone);
        funcionario.setDataNasc(data);
        funcionario.setCep(cep);
        funcionario.setEndereco(endereco);
        funcionario.setBairro(bairro);
        funcionario.setCidade(cidade);
        funcionario.setUf(uf);
        funcionario.setComplemento(complemento);
        funcionario.setNumero(numero);
        funcionario.setCargo(cargo);
    

        int pk_funcionario = dao.salvar(funcionario);

        String msg;
        
        if (pk_funcionario != 0) {
            msg = "Funcionário cadastrado com sucesso!";
        } else {
            msg = "Erro ao cadastrar o funcionário. Tente novamente!";
        }

        request.setAttribute("msg", msg);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("./jsp/CadastroFuncionario.jsp");
        dispatcher.forward(request, response);
    }

}
