package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.CategoriaDAO;
import br.com.senac.pi4.daiwahero.DAO.FuncionarioDAO;
import br.com.senac.pi4.daiwahero.model.Categoria;
import br.com.senac.pi4.daiwahero.model.Funcionario;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "FuncionarioServlet", urlPatterns = {"/funcionarioSalvar"})
public class FuncionarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String pagina = request.getRequestURI();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String pagina = request.getRequestURI();

        try {
            if (pagina.endsWith("funcionarioSalvar")) {
                funcionarioSalvar(request, response);
            }
        } catch (IOException | ServletException ex) {
            throw new ServletException(ex.getMessage());
        } catch (ParseException ex) {
            Logger.getLogger(FuncionarioServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void carregarPageFuncionario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("./jsp/Funcionario.jsp");
        rd.forward(request, response);

    }

    protected void funcionarioSalvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String genero = request.getParameter("genero");
        String telefone = request.getParameter("telefone");
        String dataNasc = request.getParameter("dataNasc");
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

        Date data = (Date) formato.parse(dataNasc);

        funcionario.setNome(nome);
        funcionario.setCpf(cpf);
        funcionario.setEmail(email);
        funcionario.setSenha(senha);
        funcionario.setGenero(genero);
        funcionario.setTelefone(telefone);
        funcionario.setDataNasc(data);
        funcionario.setEndereco(endereco);
        funcionario.setBairro(bairro);
        funcionario.setCidade(cidade);
        funcionario.setUf(uf);
        funcionario.setComplemento(complemento);
        funcionario.setNumero(numero);
        funcionario.setCargo(cargo);

        int pk_funcionario = dao.salvar(funcionario);

        response.sendRedirect("./funcionarioSalvar");

    }
}
