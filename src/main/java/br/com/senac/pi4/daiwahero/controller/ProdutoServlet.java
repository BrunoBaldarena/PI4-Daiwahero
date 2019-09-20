package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.CategoriaDAO;
import br.com.senac.pi4.daiwahero.DAO.EstoqueDAO;
import br.com.senac.pi4.daiwahero.DAO.ImagemDAO;
import br.com.senac.pi4.daiwahero.DAO.ProdutoDAO;
import br.com.senac.pi4.daiwahero.model.Categoria;
import br.com.senac.pi4.daiwahero.model.Estoque;
import br.com.senac.pi4.daiwahero.model.Imagem;
import br.com.senac.pi4.daiwahero.model.Produto;
import java.io.IOException;
import java.util.ArrayList;
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
 * @author Guto
 */
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/produtoSalvar", "/carregarPage", "/produtoConsultar"})
public class ProdutoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String pagina = request.getRequestURI();

        try {
            if (pagina.endsWith("carregarPage")) {
                carregarPage(request, response);
            }else if(pagina.endsWith("produtoConsultar")){
                produtoConsultar(request, response);
                
            }

        } catch (IOException | ServletException ex) {
            throw new ServletException(ex.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String pagina = request.getRequestURI();

        try {
            if (pagina.endsWith("produtoSalvar")) {
                produtoSalvar(request, response);
            }
        } catch (IOException | ServletException ex) {
            throw new ServletException(ex.getMessage());
        }

    }

    protected void carregarPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoriaDAO dao = new CategoriaDAO();

        ArrayList<Categoria> categoria = dao.listarTudo();

        RequestDispatcher rd = request.getRequestDispatcher("./jsp/Produto.jsp");
        request.setAttribute("categoria", categoria);
        rd.forward(request, response);

    }

    protected void produtoSalvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String breve = request.getParameter("breve");
        String valor = request.getParameter("valor");
        int quantidade = Integer.parseInt(request.getParameter("qtd"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        int status = Integer.parseInt(request.getParameter("status"));
        String imagem1 = request.getParameter("imagem1");
        String imagem2 = request.getParameter("imagem2");
        String imagem3 = request.getParameter("imagem3");
        String imagem4 = request.getParameter("imagem4");

        Produto produto = new Produto();
        Imagem imagem = new Imagem();
        Estoque estoque = new Estoque();
        ImagemDAO imagemDAO = new ImagemDAO();
        EstoqueDAO estoqueDAO = new EstoqueDAO();
        ProdutoDAO produtoDAO = new ProdutoDAO();

        produto.setNome(nome);
        produto.setDescricao(descricao);
        produto.setBreveDescricao(breve);
        produto.setValor(valor);
        produto.setStatus(status);
        produto.setFk_categoria(categoria);

        int pk_produto = produtoDAO.salvar(produto);

        imagem.setImagem1(imagem1);
        imagem.setImagem2(imagem2);
        imagem.setImagem3(imagem3);
        imagem.setImagem4(imagem4);
        imagem.setFk_produto(pk_produto);

        estoque.setFk_produto(pk_produto);
        estoque.setQuantidade(quantidade);
        estoqueDAO.inserir(estoque);

        response.sendRedirect("./carregarPage");

    }
    
     protected void produtoConsultar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoDAO produtoDAO = new ProdutoDAO();
        
        EstoqueDAO estoqueDAO = new EstoqueDAO();
        
        ArrayList<Produto> produto = produtoDAO.buscarTodos();

        

        RequestDispatcher rd = request.getRequestDispatcher("./jsp/ConsultaProduto.jsp");
        request.setAttribute("produto", produto);    
        rd.forward(request, response);

    }
     
      protected void categoriaInativar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int cod = Integer.parseInt(request.getParameter("cod"));
            
            Produto produto = new Produto();
            
            produto.setPk_produto(cod);
            
            ProdutoDAO dao = new ProdutoDAO();
            
            dao.inativar(produto);
            response.sendRedirect("./produtoConsultar");
        } catch (Exception ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      
      
}
    
     
    


