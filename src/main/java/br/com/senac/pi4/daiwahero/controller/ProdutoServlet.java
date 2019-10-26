package br.com.senac.pi4.daiwahero.controller;

import br.com.senac.pi4.daiwahero.DAO.CategoriaDAO;
import br.com.senac.pi4.daiwahero.DAO.ImagemDAO;
import br.com.senac.pi4.daiwahero.DAO.ProdutoDAO;
import br.com.senac.pi4.daiwahero.model.Categoria;
import br.com.senac.pi4.daiwahero.model.Imagem;
import br.com.senac.pi4.daiwahero.model.Produto;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Guto
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
@WebServlet(name = "ProdutoServlet", urlPatterns = {"/produtoSalvar", "/carregarPage", "/produtoConsultar", "/teste"})
public class ProdutoServlet extends HttpServlet {

    private static final String img = "image";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String pagina = request.getRequestURI();

        try {
            if (pagina.endsWith("carregarPage")) {
                carregarPage(request, response);
            } else if (pagina.endsWith("produtoConsultar")) {
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
        } catch (FileUploadException ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String breve = request.getParameter("breve");
        String valor = request.getParameter("valor");
        int quantidade = Integer.parseInt(request.getParameter("qtd"));
        //int categoria = Integer.parseInt(request.getParameter("categoria"));
        int categoria = 0;
        //int status = Integer.parseInt(request.getParameter("status"));

        Produto produto = new Produto();
        Imagem imagem = new Imagem();
        ImagemDAO imagemDAO = new ImagemDAO();
        ProdutoDAO produtoDAO = new ProdutoDAO();

        produto.setNome(nome);
        produto.setDescricao(descricao);
        produto.setBreveDescricao(breve);
        produto.setValor(valor);
        produto.setQuantidade_estoque(quantidade);
        produto.setStatus(0);
        produto.setFk_categoria(categoria);

        int pk_produto = produtoDAO.salvar(produto);

        
        String jmata = request.getParameter("file");
        //**********************************************************************
        //**************************IMAGEM**************************************
        //**********************************************************************
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        List items = null;

        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException ex) {
            Logger.getLogger(ProdutoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        Iterator itr = items.iterator();
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            if (item.isFormField()) {
            } else {
                try {
                    String fileName = item.getName();

                    //String fileName = extractFileName(part);
                    String[] imgSplit = fileName.replace("\\", "/").split("/");
                    String[] extencao = imgSplit[imgSplit.length - 1].replace(".", "/").split("/");

                    int i = 0;
                    File file;
                    String savePath = null;

                    File fileSaveDir = new File("C:\\temp\\Daiwahero");
                    if (!fileSaveDir.exists()) {
                        fileSaveDir.mkdir();
                    }

                    do {
                        i++;
                        savePath = fileSaveDir + "\\" + img + i + "." + extencao[extencao.length - 1];
                        file = new File(savePath);
                    } while (file.exists() == true);

                    FileChannel sourceChannel = null;
                    FileChannel destinationChannel = null;

                    try {
                        sourceChannel = new FileInputStream(fileName).getChannel();
                        destinationChannel = new FileOutputStream(savePath).getChannel();
                        sourceChannel.transferTo(0, sourceChannel.size(),
                                destinationChannel);

                    } finally {
                        if (sourceChannel != null && sourceChannel.isOpen()) {
                            sourceChannel.close();
                        }
                        if (destinationChannel != null && destinationChannel.isOpen()) {
                            destinationChannel.close();
                        }
                    }

                    imagem.setImagem(savePath);
                    imagem.setPk_imagem(pk_produto);
                    imagemDAO.inserir(imagem);
                } catch (IOException e) {
                }
            }
        }

        response.sendRedirect("./carregarPage");
    }

    protected void produtoConsultar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProdutoDAO produtoDAO = new ProdutoDAO();

        ArrayList<Produto> produto = produtoDAO.listarTudo();

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
