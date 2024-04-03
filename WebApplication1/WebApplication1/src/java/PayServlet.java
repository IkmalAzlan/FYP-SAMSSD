/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.dao.Customer;
import com.dao.CustomerDao;
import com.dao.ReservationDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.reservation;

/**
 *
 * @author Benjimal
 */
public class PayServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayServlet assdfsdft " + request.getContextPath() + "</h1>");
            out.println("<h1>Servlet Phone " + request.getParameter("phone") + "</h1>");
            out.println("<h1>Action " + request.getParameter("action") + "</h1>");
            out.println("<h1>Name  " + request.getParameter("cName") + "</h1>");
            out.println("<h1>ID  " + request.getParameter("id") + "</h1>");
            
            reservation r = ReservationDao.getReservationById(request.getParameter("id"));
            r.setStatus("RESERVED");
            r.setId(request.getParameter("id"));
            ReservationDao.updateReservation(r);
            
            
            out.println("<h1>Status  " + r.getStatus() + "</h1>");
            out.println("<h1>Status  " + r.toString() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
//            request.setAttribute("c", c);
//            request.setAttribute("name", "GUEST");
            request.setAttribute("phone", request.getParameter("phone"));
//            request.setAttribute("role", request.getParameter("role"));

            if(request.getParameter("action").equalsIgnoreCase("customerPay"))
            {
                
                request.setAttribute("action", request.getParameter("customerPay"));
            }
            
            List<reservation> lr = ReservationDao.getAllReservations();
            request.setAttribute("s", lr);
            request.getRequestDispatcher("checkReserveGuest.jsp").forward(request, response);
            
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PayServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PayServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PayServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PayServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
