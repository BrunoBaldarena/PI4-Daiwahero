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
        
        boolean cond = false;
        try {
            cond = dao.inativar(Integer.parseInt(id));
        } catch (Exception ex) {
            Logger.getLogger(FuncionarioServletDeleta.class.getName()).log(Level.SEVERE, null, ex);
        }
        String msg;

        if (cond == true) {
            msg = "Funcionário deletado com sucesso!";
        } else {
            msg = "Erro ao deleta o funcionário. Tente novamente!";
        }

        request.setAttribute("msg", msg);

        response.sendRedirect("./FuncionarioServletBusca");

        /*RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher("FuncionarioServletBusca");
        dispatcher.forward(request, response);*/
    }

}
