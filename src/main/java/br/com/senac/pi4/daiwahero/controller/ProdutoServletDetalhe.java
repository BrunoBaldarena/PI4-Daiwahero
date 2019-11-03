package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.ImagemDAO;
import br.com.senac.pi4.daiwahero.DAO.ProdutoDAO;
import br.com.senac.pi4.daiwahero.model.Imagem;
import br.com.senac.pi4.daiwahero.model.Produto;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProdutoServletDetalhe", urlPatterns = {"/ProdutoServletDetalhe"})
public class ProdutoServletDetalhe extends HttpServlet {

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
                
                String indicators = null;
                String inner = null;
                int count = 0;
                
                for (Imagem item : imagens) {
                    if (count == 0) {
                        indicators = "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\"" + count + "\" class=\"active\"></li><br>";
                        inner = "<div class=\"carousel-item active\"><img src=\"" + item.getImagem() + "\" style=\"width: 400px; right: 300px;\"></div>";
                    }else
                    {
                        indicators = indicators + "<li data-target=\"#carouselExampleIndicators\" data-slide-to=\"" + count + "\"></li><br>";
                        inner = inner + "<div class=\"carousel-item\"><img src=\"" + item.getImagem() + "\" style=\"width: 400px; right: 300px;\"></div>";
                    }
                    
                    count++;
                }

                request.setAttribute("produto", produto);
                request.setAttribute("indicators", indicators);
                request.setAttribute("inner", inner);

                if (produto.getQuantidade_estoque() > 1) {
                    request.setAttribute("estoque", "Em Estoque");
                }
                else
                {
                    request.setAttribute("estoque", "Sem Estoque");
                }
                
                request.setAttribute("valor", produto.getValor().replace(".", ",").toString());
                DecimalFormat df = new DecimalFormat("0.00");
                Float valor = Float.parseFloat(produto.getValor());
                valor = valor/12;
                request.setAttribute("dividido", df.format(valor).replace(".", ",").toString());
                
                pagina = "/jsp/ProdutoDetalhe.jsp";
            }
        }
        RequestDispatcher destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }
}
