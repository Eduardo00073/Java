
package br.com.curso.controller.estado;

import br.com.curso.dao.VerificarDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstadoExcluir", urlPatterns = {"/EstadoExcluir"})
public class EstadoExcluir extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charsetiso-8859-1");
        int idEstado = Integer.parseInt(request.getParameter("idEstado"));    
      try 
      {
        VerificarDAO dao = new VerificarDAO();
            
        if(dao.VerificarVinculo(idEstado) == 2)
            response.getWriter().write("2");
        else
        {
            dao.excluir(idEstado);
            response.getWriter().write("1");
        }
      } 
      catch (Exception ex)
      {
          System.out.println("Problemas no servelt ao excluir Estado! Estado "+ ex.getMessage());
          response.getWriter().write("0");
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
