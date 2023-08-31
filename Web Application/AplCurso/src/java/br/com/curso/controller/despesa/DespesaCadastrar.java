package br.com.curso.controller.despesa;

import br.com.curso.dao.DespesaDAO;
import br.com.curso.model.Despesa;
import br.com.curso.utils.Conversao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DespesaCadastrar", urlPatterns = {"/DespesaCadastrar"})
public class DespesaCadastrar extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        String msg = "";
        try{
            Despesa oDespesa = new Despesa();
            oDespesa.setIddespesa(Integer.parseInt(request.getParameter("iddespesa")));
            oDespesa.setDescricao(request.getParameter("descricao"));
            oDespesa.setValordespesa(Conversao.valorDinheiro(request.getParameter("valordespesa")));
            oDespesa.setValorpago(Conversao.valorDinheiro(request.getParameter("valorpago")));
            oDespesa.setDatadocumento(Date.valueOf(request.getParameter("datadocumento")));
            oDespesa.setImagemdocumento(request.getParameter("imagemdocumento"));
            DespesaDAO dao = new DespesaDAO();
            
            if(dao.cadastrar(oDespesa)){
                response.getWriter().write("1");
            }else{
                response.getWriter().write("0");
            }
        }catch(Exception ex){
            System.out.println("Problemas no Servlet Cadastrar Despesa! Erro " + ex.getMessage());
            ex.printStackTrace();
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
