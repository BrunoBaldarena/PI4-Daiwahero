package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.ImagemDAO;
import br.com.senac.pi4.daiwahero.DAO.ProdutoDAO;
import br.com.senac.pi4.daiwahero.model.Imagem;
import br.com.senac.pi4.daiwahero.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
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
 * @author Johnathan.mbmata
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ImagemDAO daoImagem = new ImagemDAO();
        ProdutoDAO daoProduto = new ProdutoDAO();

        ArrayList<Produto> produtos = daoProduto.listarTudo();

        ArrayList<Imagem> imagens = daoImagem.listar();

        RequestDispatcher rd = request.getRequestDispatcher("/test.jsp");
        request.setAttribute("produtos", produtos);
        request.setAttribute("imagens", imagens);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
