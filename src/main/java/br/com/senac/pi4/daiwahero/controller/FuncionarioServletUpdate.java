package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.FuncionarioDAO;
import br.com.senac.pi4.daiwahero.model.Funcionario;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FuncionarioServletUpdate", urlPatterns = {"/FuncionarioServletUpdate"})
public class FuncionarioServletUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        FuncionarioDAO dao = new FuncionarioDAO();
        Funcionario funcionario = null;
        try {
            funcionario = dao.buscarID(Integer.parseInt(id));
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioServletUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("funcionario", funcionario);

        RequestDispatcher destino = request.getRequestDispatcher("./jsp/FuncionarioUpdate.jsp");
        destino.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String msg;

        String id = request.getParameter("id");
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String genero = request.getParameter("genero");
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

        funcionario.setId(Integer.parseInt(id));
        funcionario.setNome(nome);
        funcionario.setCpf(cpf);
        funcionario.setEmail(email);
        funcionario.setSenha(senha);
        funcionario.setGenero(genero);
        funcionario.setTelefone(telefone);
        funcionario.setDataNasc(dataNasc);
        funcionario.setCep(cep);
        funcionario.setEndereco(endereco);
        funcionario.setBairro(bairro);
        funcionario.setCidade(cidade);
        funcionario.setUf(uf);
        funcionario.setComplemento(complemento);
        funcionario.setNumero(numero);
        funcionario.setCargo(cargo);

        boolean retorno = false;
        try {
            retorno = dao.Editar(funcionario);
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioServletUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (retorno == true) {
            msg = "Alteração realizada com sucesso";
        } else {
            msg = "Erro ao executar a alteração";
        }

        request.setAttribute("msg", msg);

        RequestDispatcher dispatcher
                = request.getRequestDispatcher("./jsp/FuncionarioUpdate.jsp");
        dispatcher.forward(request, response);
    }

}
