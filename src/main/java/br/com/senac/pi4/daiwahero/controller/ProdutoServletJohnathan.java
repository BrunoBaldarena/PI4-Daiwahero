package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.ImagemDAO;
import br.com.senac.pi4.daiwahero.DAO.ProdutoDAO;
import br.com.senac.pi4.daiwahero.model.Imagem;
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

@WebServlet(name = "ProdutoServletJohnathan", urlPatterns = {"/ProdutoServletJohnathan"})
public class ProdutoServletJohnathan extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("action");
        String pagina;
        pagina = "index.jsp";
        switch (acao) {
            case "prod": {
                String id = request.getParameter("id");

                ImagemDAO daoImagem = new ImagemDAO();
                ProdutoDAO dao = new ProdutoDAO();

                ArrayList<Imagem> imagens = daoImagem.listarID(Integer.parseInt(id));
                Produto produto = dao.produto(Integer.parseInt(id));

                request.setAttribute("produto", produto);
                request.setAttribute("imagens", imagens);

                if (produto.getQuantidade_estoque() < 1) {
                    request.setAttribute("estoque", "Em Estoque");
                }
                else
                {
                    request.setAttribute("estoque", "Sem Estoque");
                }
                
                request.setAttribute("valor", produto.getValor().replace(".", ",").toString());
                
                pagina = "/jsp/ProdutoDetalhe.jsp";
            }
        }
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }
}
