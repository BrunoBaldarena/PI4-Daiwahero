/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.EstoqueDAO;
import br.com.senac.pi4.daiwahero.DAO.FuncionarioDAO;
import br.com.senac.pi4.daiwahero.DAO.ProdutoDAO;
import br.com.senac.pi4.daiwahero.model.Funcionario;
import br.com.senac.pi4.daiwahero.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Johnathan
 */
@WebServlet(name = "FuncionarioServletBusca", urlPatterns = {"/FuncionarioServletBusca"})
public class FuncionarioServletBusca extends HttpServlet {


  
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FuncionarioDAO dao = new FuncionarioDAO();
        List<Funcionario> funcionario = dao.buscarTodos();
        
        
        request.setAttribute("funcionario", funcionario);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("./jsp/ConsultaFuncionario.jsp");
        dispatcher.forward(request, response);
    }


}
