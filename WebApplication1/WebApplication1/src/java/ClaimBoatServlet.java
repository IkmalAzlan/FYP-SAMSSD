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
import model.Boat;
import model.Staff;
import model.reservation;

/**
 *
 * @author Benjimal
 */
public class ClaimBoatServlet extends HttpServlet {

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
            out.println("<title>Servlet ClaimBoat</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClaimBoat at " + request.getContextPath() + "</h1>");
            out.println("<h1>Servlet ClaimBoat at " + request.getParameter("id") + "</h1>");
            out.println("<h1>Servlet ClaimBoat at " + request.getParameter("staffID") + "</h1>");
//            out.println("</body>");
//            out.println("</html>");

            Staff s = null;
            if (request.getParameter("staffID") != null) {
                s = StaffDao.getStaffById(request.getParameter("staffID"));
            } else {
                s = StaffDao.getStaffById(request.getParameter("id"));
                List<reservation> r = ReservationDao.getAllReservations();
                request.setAttribute("s", r);
                request.setAttribute("name", s.getName());
                request.setAttribute("id", s.getID());
                request.setAttribute("phone", s.getPhone());
                request.setAttribute("role", s.getRole());
            }

            if (request.getParameter("action") != null) {
                if (request.getParameter("action").equalsIgnoreCase("edit")) {
                    Boat b = StaffDao.getBoatByID(request.getParameter("boatID"));
                    request.setAttribute("brand", b.getBrand());
                    request.setAttribute("plate", b.getPlate());
                    request.setAttribute("capacity", b.getCapacity());
                    request.setAttribute("color", b.getColor());
                    request.setAttribute("boatID", b.getId());
//                    request.setAttribute("id", request.getParameter("id"));
                    request.getRequestDispatcher("editBoat.jsp").forward(request, response);
                } else if (request.getParameter("action").equalsIgnoreCase("delete")) {
                    Boat b = StaffDao.getBoatByID(request.getParameter("boatID"));
                    StaffDao.deleteBoat(request.getParameter("boatID"));

                    s = StaffDao.getStaffById(String.valueOf(b.getBoatOwner()));
                    request.setAttribute("name", s.getName());
                    request.setAttribute("id", s.getID());
                    request.setAttribute("phone", s.getPhone());
                    request.setAttribute("role", s.getRole());
                    request.getRequestDispatcher("BoatOwner.jsp").forward(request, response);
                } else {
                    Boat b = StaffDao.getBoatByID(request.getParameter("boatID"));
                    b.setBrand(request.getParameter("brand"));
                    b.setPlate(request.getParameter("plate"));
                    b.setCapacity(Integer.parseInt(request.getParameter("capacity")));
                    b.setColor(request.getParameter("color"));

                    s = StaffDao.getStaffById(String.valueOf(b.getBoatOwner()));
                    request.setAttribute("name", s.getName());
                    request.setAttribute("id", s.getID());
                    request.setAttribute("phone", s.getPhone());
                    request.setAttribute("role", s.getRole());
                    StaffDao.updateBoat(b);
                    request.getRequestDispatcher("BoatOwner.jsp").forward(request, response);
                }
            } else {
                s = StaffDao.getStaffById(request.getParameter("staffID"));
                List<reservation> r = ReservationDao.getAllReservations();
                request.setAttribute("s", r);
                request.setAttribute("name", s.getName());
                request.setAttribute("id", s.getID());
                request.setAttribute("phone", s.getPhone() );
                request.setAttribute("role", s.getRole());
                
                ReservationDao.addBoatClaim(request.getParameter("id"), request.getParameter("staffID"));
                request.getRequestDispatcher("BoatOwner.jsp").forward(request, response);
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
            Logger.getLogger(ClaimBoatServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ClaimBoatServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ClaimBoatServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ClaimBoatServlet.class.getName()).log(Level.SEVERE, null, ex);
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
