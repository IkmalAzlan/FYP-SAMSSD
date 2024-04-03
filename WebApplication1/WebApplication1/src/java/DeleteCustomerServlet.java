/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.dao.Customer;
import com.dao.CustomerDao;
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
import model.Admin;
import model.Comment;
import model.Staff;

/**
 *
 * @author Benjimal
 */
public class DeleteCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getParameter("id") + "</h1>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getParameter("name") + "</h1>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getParameter("adminName") + "</h1>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getParameter("role") + "</h1>");
            out.println("<h1>Servlet DeleteCustomerServlet at " + request.getParameter("cID") + "</h1>");

            int result = CustomerDao.deleteAllReviewByCustomerId(request.getParameter("cID"));

            if (result > 0) {
                out.print("<script type=\'text/javascript\' defer>");
                out.print("alert('Customer has been successfully deleted');");
                out.print("</script>");

            } else {
                out.print("<script type=\'text/javascript\' defer>");
                out.print("alert('Operation failed');");
                out.print("</script>");
            }
            List<Staff> ls = StaffDao.getAllStaffs();
            request.setAttribute("s", ls);
            List<Customer> lc = CustomerDao.getAllCustomers();
            Admin a = StaffDao.getAdminById(request.getParameter("cID"));
//            List<Staff> ls = StaffDao.getAllStaffs();
            request.setAttribute("s", ls);
//            List<Customer> lc = CustomerDao.getAllCustomers();
            request.setAttribute("c", lc);
            request.setAttribute("a", a);
            request.setAttribute("name", request.getParameter("adminName"));
            request.setAttribute("phone", a.getPhone());
            request.setAttribute("role", a.getRole());
            request.setAttribute("adminID", a.getID());

            List<Comment> allR = StaffDao.getAllReplies();
            request.setAttribute("allR", allR);

            CustomerDao.deleteCustomer(request.getParameter("cID"));
            lc = CustomerDao.getAllCustomers();
            request.setAttribute("c", lc);

            out.println("<h1>Servlet DeleteCustomerServlet at " + a.toString() + "</h1>");
            request.getRequestDispatcher("Admin.jsp").forward(request, response);

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
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
