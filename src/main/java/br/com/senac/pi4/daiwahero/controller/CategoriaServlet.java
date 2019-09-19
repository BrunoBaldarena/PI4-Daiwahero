package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.CategoriaDAO;
import br.com.senac.pi4.daiwahero.model.Categoria;
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

@WebServlet(name = "CategoriaServlet", urlPatterns = {"/categoriaSalvar", 
    "/categoriaEditar01","/categoriaEditar02","/categoriaInativar", "/categoriaConsultar"})
public class CategoriaServlet extends HttpServlet {

    
    // Metodo doget & dopost, quando é chamado uma requisicao ela eh direcionada para o seu devido method
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String pagina = request.getRequestURI();
        
        
        try {
            if (pagina.endsWith("categoriaConsultar")) {
                categoriaConsultar(request, response);
            }  else if (pagina.endsWith("categoriaInativar")) {
                categoriaInativar(request, response);
            } else if (pagina.endsWith("categoriaEditar01")) {
                categoriaEditar01(request, response);
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
            if (pagina.endsWith("categoriaSalvar")) {
                categoriaSalvar(request, response);
            } else if (pagina.endsWith("categoriaEditar02")) {
                categoriaEditar02(request, response);

            }
        } catch (IOException | ServletException ex) {
            throw new ServletException(ex.getMessage());
        }

    }
    
    
    // Metodo que pega os dados da pagina e salva no banco de dados

    protected void categoriaSalvar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        Categoria categoria = new Categoria();
        categoria.setNome(nome);

        CategoriaDAO dao = new CategoriaDAO();

        dao.inserir(categoria);
        response.sendRedirect("./categoriaConsultar");
       
    }

    //Metodo que lista os dados do banco e aprensenta na pagina
    protected void categoriaConsultar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoriaDAO dao = new CategoriaDAO();
        ArrayList<Categoria> categoria = dao.listarTudo();

        RequestDispatcher rd = request.getRequestDispatcher("./jsp/Categoria.jsp");
        request.setAttribute("categoria", categoria);
        rd.forward(request, response);

    }

    /*
    protected void categoriaConsultarId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        CategoriaDAO dao = new CategoriaDAO();
        ArrayList<Categoria> categoria = dao.listarTudo();

        RequestDispatcher rd = request.getRequestDispatcher("./jsp");
        request.setAttribute("categoria", categoria);
        rd.forward(request, response);
    }
   */
    
    // Metodo que pega o ID do produto que será editado e apresenta os dados a serem editados
    protected void categoriaEditar01(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cod = Integer.parseInt(request.getParameter("cod"));
        
        CategoriaDAO dao = new CategoriaDAO(); 
        
        ArrayList<Categoria> categoria = dao.listarID(cod);
        
        RequestDispatcher rd = request.getRequestDispatcher("./jsp/CategoriaEdit.jsp");
        request.setAttribute("categoria", categoria);
        rd.forward(request, response);

    }

    //Metodo que pega os dados alterados da pagina e atualiza no banco de dados
    protected void categoriaEditar02(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int cod = Integer.parseInt(request.getParameter("cod"));

         String nome = request.getParameter("nome");
         
         Categoria categoria = new Categoria();
         categoria.setNome(nome);
         categoria.setId(cod);
         
        CategoriaDAO dao = new CategoriaDAO();

        dao.Editar(categoria);
        response.sendRedirect("./categoriaConsultar");
         

    }

    // Metodo que inativa logicamente o item do banco de dados
    protected void categoriaInativar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int cod = Integer.parseInt(request.getParameter("cod"));
            
            Categoria categoria = new Categoria();
            
            categoria.setId(cod);
            
            CategoriaDAO dao = new CategoriaDAO();
            dao.inativar(categoria);
            response.sendRedirect("./categoriaConsultar");
        } catch (Exception ex) {
            Logger.getLogger(CategoriaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
