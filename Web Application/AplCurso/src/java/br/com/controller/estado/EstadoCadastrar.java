package br.com.controller.estado;

import br.com.curso.dao.EstadoDAO;
import br.com.curso.dao.GenericDAO;
import br.com.curso.model.Estado;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EstadoCadastrar", urlPatterns = {"/EstadoCadastrar"})
public class EstadoCadastrar extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        int idEstado = Integer.parseInt(request.getParameter("idEstado"));
        String nomeEstado = request.getParameter("nomeEstado");
        String siglaEstado = request.getParameter("siglaEstado");
        String mensagem = null;
        
        Estado oEstado = new Estado();
        oEstado.setIdEstado(idEstado);
        oEstado.setNomeEstado(nomeEstado);
        oEstado.setSiglaEstado(siglaEstado);
        try{
            GenericDAO dao = new EstadoDAO();
            if(dao.cadastrar(oEstado)){
                mensagem = "Estado cadastrado com sucesso";
            }else{
                mensagem = "Problemas ao cadastrar Estado.Verifique os d ados informados e tente novamente";
            }
            request.setAttribute("mensagem", mensagem);
            response.sendRedirect("EstadoListar");
    }catch (Exception ex){
            System.out.println("Problemas no Servlet ao cadastrar Estado! Erro: "+ ex.getMessage());
            
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
