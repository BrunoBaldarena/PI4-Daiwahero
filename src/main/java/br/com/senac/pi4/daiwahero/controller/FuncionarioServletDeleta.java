/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.FuncionarioDAO;
import java.io.IOException;
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
@WebServlet(name = "FuncionarioServletDeleta", urlPatterns = {"/FuncionarioServletDeleta"})
public class FuncionarioServletDeleta extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        FuncionarioDAO dao = new FuncionarioDAO();
        try {
            dao.inativar(Integer.parseInt(id));
        } catch (Exception ex) {
            Logger.getLogger(FuncionarioServletDeleta.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher("FuncionarioServletBusca");
        dispatcher.forward(request, response);
    }

}
