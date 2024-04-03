/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

/**
 *
 * @author Benjimal
 */
public class editStaffServlet extends HttpServlet {

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
            out.println("<title>Servlet editStaff</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editStaff at " + request.getContextPath() + "</h1>");
            out.println("<h1>Servlet Name : " + request.getParameter("adminName") + "</h1>");
            out.println("<h1>Servlet Role : " + request.getParameter("role") + "</h1>");
            out.println("<h1>Servlet AdminID : " + request.getParameter("adminID") + "</h1>");
            out.println("<h1>Servlet StaffID : " + request.getParameter("staffID") + "</h1>");
            
        List<Staff> ls = StaffDao.getAllStaffs();
        request.setAttribute("s", ls);
        request.setAttribute("name", request.getParameter("adminName"));
        request.setAttribute("role", request.getParameter("role"));
        request.setAttribute("adminID", request.getParameter("adminID"));
        request.setAttribute("staffID", request.getParameter("staffID"));
        Staff s = StaffDao.getStaffById(request.getParameter("staffID"));
        request.setAttribute("staffName", s.getName());
        request.setAttribute("staffEmail", s.getEmail());
        request.setAttribute("staffPassword", s.getPassword());
        request.setAttribute("staffPhone", s.getPhone());
        request.setAttribute("staffRole", s.getRole());
        request.setAttribute("staffStatus", s.getStatus());
        request.setAttribute("staffAddress", s.getAddress());
        request.setAttribute("staffLicense", s.getLicense());
        
            out.println("<h1>Servlet StaffID : " + 123 + "</h1>");
            out.println("<h1>Servlet StaffID : " + s.toString() + "</h1>");
        request.getRequestDispatcher("editStaff.jsp").forward(request, response);
            out.println("</body>");
            out.println("</html>");
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
            Logger.getLogger(editStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(editStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(editStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
