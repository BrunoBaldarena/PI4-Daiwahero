/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senac.pi4.daiwahero.controller;


import br.com.senac.pi4.daiwahero.DAO.FuncionarioDAO;
import br.com.senac.pi4.daiwahero.model.Funcionario;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        List<Funcionario> funcionario = null;
         try {
             funcionario = dao.buscarTodos();
         } catch (ParseException ex) {
             Logger.getLogger(FuncionarioServletBusca.class.getName()).log(Level.SEVERE, null, ex);
         }
       
        
        
        RequestDispatcher rd = request.getRequestDispatcher("/jsp/ConsultaFuncionario.jsp");
        request.setAttribute("funcionario", funcionario);
        rd.forward(request, response);
    }


}
