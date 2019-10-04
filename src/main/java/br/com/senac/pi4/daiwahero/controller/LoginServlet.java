package br.com.senac.pi4.daiwahero.controller;


import br.com.senac.pi4.daiwahero.DAO.LoginDAO;
import br.com.senac.pi4.daiwahero.model.Funcionario;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String senha = request.getParameter("senha");

        LoginDAO dao = new LoginDAO();
        Funcionario login = new Funcionario();
        login.setEmail(usuario);
        login.setSenha(senha);
        ArrayList<Funcionario> cargo = dao.cargo(login.getEmail());

        boolean retorno = dao.login(login);

        if (retorno == true) {

            HttpSession sessao = request.getSession();
            HttpSession sessao2 = request.getSession();
            
            sessao2.setAttribute("cargo", cargo);
            sessao.setAttribute("usuario", usuario);
            
            response.sendRedirect("./home.jsp");

        } else {
            response.sendRedirect("./index.html");

        }
    }

}
