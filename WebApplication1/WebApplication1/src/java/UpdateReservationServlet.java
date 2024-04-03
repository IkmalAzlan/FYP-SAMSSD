/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class UpdateReservationServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateReservationServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Staff ID " + request.getParameter("staffID") + "</h1>");
            out.println("<h1>Staff Name " + request.getParameter("staffName") + "</h1>");
            out.println("<h1>Reservation ID " + request.getParameter("id") + "</h1>");
            out.println("<h1>Phone " + request.getParameter("phone") + "</h1>");
            out.println("<h1>Date " + request.getParameter("date") + "</h1>");
            out.println("<h1>Session " + request.getParameter("session") + "</h1>");
            out.println("<h1>Passenger " + request.getParameter("passenger") + "</h1>");
            out.println("<h1>Passenger " + request.getParameter("status") + "</h1>");
            out.println("<h1>Name " + request.getParameter("rName") + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
//            request.setAttribute("staffID", request.getParameter("staffID"));
//            request.setAttribute("staffName", request.getParameter("staffName"));
//            request.setAttribute("id", request.getParameter("id"));
//            request.setAttribute("phone", request.getParameter("phone"));
//            request.setAttribute("date", request.getParameter("date"));
//            request.setAttribute("session", request.getParameter("session"));
//            request.setAttribute("passenger", request.getParameter("passenger"));
//            request.setAttribute("status", request.getParameter("status"));
//            request.setAttribute("rName", request.getParameter("rName"));
            out.println("</body>");
            out.println("</html>");
            
            reservation rs = new reservation(request.getParameter("id"), request.getParameter("phone"), request.getParameter("date"), request.getParameter("session"),
            request.getParameter("passenger"), request.getParameter("status"));
            ReservationDao.updateReservation(rs);
            Staff s = StaffDao.getStaffById(request.getParameter("staffID"));
            
            List<reservation> r = ReservationDao.getAllReservations();
            request.setAttribute("s", r);
            request.setAttribute("name", s.getName());
            request.setAttribute("id", s.getID());
            request.setAttribute("phone", s.getPhone());
            request.setAttribute("role", s.getRole());
            request.getRequestDispatcher("Staff.jsp").forward(request, response);
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
            Logger.getLogger(UpdateReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdateReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateReservationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
