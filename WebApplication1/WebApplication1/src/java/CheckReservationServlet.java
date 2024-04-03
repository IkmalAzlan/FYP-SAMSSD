/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.dao.Customer;
import com.dao.CustomerDao;
import com.dao.ReservationDao;
import com.dao.StaffDao;
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
import model.Staff;
import model.reservation;

/**
 *
 * @author Benjimal
 */
public class CheckReservationServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Customer c = CustomerDao.getCustomerById(request.getParameter("phone"));
            
            request.setAttribute("c", c);
            request.setAttribute("name", request.getParameter("name"));
            request.setAttribute("phone", request.getParameter("phone"));
            request.setAttribute("role", request.getParameter("role"));
            
            if(request.getParameter("action").toString().equalsIgnoreCase("home"))
            {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else if(request.getParameter("action").toString().equalsIgnoreCase("guest"))
            {
                List<reservation> lr = ReservationDao.getAllReservations();
                request.setAttribute("s", lr);
                request.getRequestDispatcher("checkReserveGuest.jsp").forward(request, response);
            }
            else if(request.getParameter("action").toString().equalsIgnoreCase("guestPay"))
            {
                List<reservation> lr = ReservationDao.getAllReservations();
                
                for(reservation r : lr)
                {
                    if(r.getId().equalsIgnoreCase(request.getParameter("reservationID")))
                    {
                        r.setStatus("RESERVED");
                        ReservationDao.updateReservation(r);
                    }
                }
                request.setAttribute("s", lr);
                request.getRequestDispatcher("checkReserveGuest.jsp").forward(request, response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("customerPay"))
            {
                List<reservation> lr = ReservationDao.getAllReservations();
                
                for(reservation r : lr)
                {
                    if(r.getId().equalsIgnoreCase(request.getParameter("reservationID")))
                    {
                        r.setStatus("RESERVED");
                        ReservationDao.updateReservation(r);
                    }
                }
                request.setAttribute("s", lr);
                request.setAttribute("id", c.getId());
                request.getRequestDispatcher("Customer.jsp").forward(request, response);
            }
            else
            {
                List<reservation> lr = ReservationDao.getAllReservations();
                request.setAttribute("s", lr);
                request.getRequestDispatcher("Customer.jsp").forward(request, response);
            }
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
            Logger.getLogger(CheckReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CheckReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CheckReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CheckReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
