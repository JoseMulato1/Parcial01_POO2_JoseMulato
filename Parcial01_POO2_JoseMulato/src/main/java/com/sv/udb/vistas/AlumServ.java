package com.sv.udb.vistas;

import com.sv.udb.controlador.AlumCtrl;
import com.sv.udb.modelo.Alumnos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author joseph
 */
@WebServlet(name = "AlumServ", urlPatterns = {"/AlumServ"})
public class AlumServ extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean esValido = request.getMethod().equals("POST");
        if(esValido)
        {
            String mens = "";
            String CRUD = request.getParameter("AlumBton");
            if(CRUD.equals("Guardar"))
            {
                Alumnos obje = new Alumnos();
                obje.setNombAlum(request.getParameter("nombAlum"));
                obje.setApelAlum(request.getParameter("apelAlum"));
                obje.setFechNaciAlum(java.sql.Date.valueOf(request.getParameter("fechNaciAlum")));
                obje.setMailAlum(request.getParameter("mailAlum"));
                obje.setTeleAlum(request.getParameter("teleAlum"));
                obje.setDireAlum(request.getParameter("direAlum"));
                obje.setGeneAlum(request.getParameter("geneAlum").charAt(0));
                mens = new AlumCtrl().guar(obje) ? "Datos guardados exitosamente" : "Datos NO guardados";
                
            }
        request.setAttribute("mensAler", mens);
        request.getRequestDispatcher("/alumnos.jsp").forward(request, response);
        }
        else{
            response.sendRedirect(request.getContextPath() + "/alumnos.jsp");
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
