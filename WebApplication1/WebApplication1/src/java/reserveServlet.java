/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.dao.ReservationDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class reserveServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet reserveServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet reserveServlet at " + request.getContextPath() + "</h1>");
//            out.println("<h1>Date :  " + request.getParameter("date") + "</h1>");
//            out.println("<h1>SS :  " + request.getParameter("ss") + "</h1>");
//            out.println("<h1>PS :  " + request.getParameter("ps") + "</h1>");
//            out.println("<h1>PN :  " + request.getParameter("phone") + "</h1>");
//            out.println("</body>");
//            out.println("</html>");

            reservation r = new reservation("0", request.getParameter("phone"), request.getParameter("date"), request.getParameter("ss"), request.getParameter("ps"), "PENDING PAYMENT");
            //ReservationDao rd = new ReservationDao();

//            out.println("<h1>55 :  " + request.getParameter("phone") + "</h1>");
            String status = ReservationDao.addReservation(r);

            String role = request.getParameter("role");
            String rid = "";

            if (role.equals("") || role.equals("Null") || role.equals("null") || role == null) {

                int num = ReservationDao.getReservationId();
                rid = String.valueOf(num);
                String name = request.getParameter("guestName");
                String email = request.getParameter("guestEmail");
                String phone = request.getParameter("phone");
                String emergency = request.getParameter("emergencyPhone");

                ReservationDao.addGuestReservationInfo(num, name, email, phone, emergency);
            }

            if (status.equals("1") && role.equals("Customer")) {
                int num = ReservationDao.getReservationId();
                String name = request.getParameter("guestName");
                String email = request.getParameter("guestEmail");
                String phone = request.getParameter("phone");
                String emergency = request.getParameter("emergencyPhone");

                ReservationDao.addCustomerReservationInfo(num, name, email, phone, emergency);
            }

            List<reservation> lr = ReservationDao.getAllReservations();
            request.setAttribute("s", lr);
            request.setAttribute("name", request.getParameter("name"));
            request.setAttribute("phone", request.getParameter("phone"));
            request.setAttribute("role", request.getParameter("role"));

//            out.println("<h1>58 :  " + request.getParameter("phone") + "</h1>");
            if ("1".equals(status)) {
                request.setAttribute("id", request.getParameter("id"));

                if (role.equals("Customer")) {
                    out.println("<script>");
                    out.print("confirm(\"Reservation successful! Welcome!\");");
                    out.println("</script>");
                    request.getRequestDispatcher("Customer.jsp").forward(request, response);
                } else {
                    out.println("<script>");
                    out.print("confirm(\"Reservation successful! Welcome!\");");
                    out.print("window.location = \"index.jsp\"");
                    out.println("</script>");
                }
//            request.setAttribute("phone", request.getParameter("phone"));
//            request.setAttribute("date", request.getParameter("date"));
//            request.setAttribute("session", request.getParameter("session"));
//            request.setAttribute("passenger", request.getParameter("passenger"));
//            request.setAttribute("role", request.getParameter("role"));
//            request.setAttribute("status", request.getParameter("status"));
//            request.setAttribute("rName", request.getParameter("rName"));
//            request.setAttribute("name", request.getParameter("rName")); 
//            List<reservation> lr = ReservationDao.getAllReservations();
//            request.setAttribute("s", lr);
                //request.getRequestDispatcher("Customer.jsp").forward(request, response);

                //request.getRequestDispatcher("Customer.jsp").forward(request, response);
            } else {

                out.println("<script>");
                out.print("confirm(\"Reservation failed, please contact staff or admin.\");");
                out.println("</script>");

                request.setAttribute("date", request.getParameter("date"));
                List<reservation> rs = ReservationDao.getAllReservations();
                request.setAttribute("r", rs);
                request.getRequestDispatcher("checkDates.jsp").include(request, response);
                //response.sendRedirect("index.jsp");
            }

//            out.println("<h1>77 :  " + request.getParameter("phone") + "</h1>");
//            if (request.getParameter("role") != null) {
//                if (request.getParameter("role").toString().equalsIgnoreCase("Customer")) {
//                    request.getRequestDispatcher("Customer.jsp").forward(request, response);
//                }
//            }
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
            Logger.getLogger(reserveServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reserveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(reserveServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(reserveServlet.class.getName()).log(Level.SEVERE, null, ex);
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
