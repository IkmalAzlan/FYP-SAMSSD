/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.dao.Customer;
import com.dao.CustomerDao;
import com.dao.StaffDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
public class DeleteStaffServlet extends HttpServlet {

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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet DeleteStaffServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DeleteStaffServlet at " + request.getContextPath() + "</h1>");
//            out.println("<h1>Servlet DeleteStaffServlet at " + request.getParameter("action") + "</h1>");
//            out.println("<h1>Servlet DeleteStaffServlet at " + request.getParameter("role") + "</h1>");
//            out.println("<h1>Servlet DeleteStaffServlet at " + request.getParameter("id") + "</h1>");
//            out.println("<h1>Servlet DeleteStaffServlet at " + request.getParameter("name") + "</h1>");
//            out.println("</body>");
//            out.println("</html>");

            if(request.getParameter("operation").equals("deleteStaff")) {
                    Admin a = StaffDao.getAdminById(request.getParameter("adminID"));
                    StaffDao.deleteStaff(request.getParameter("staffID"));
                    request.setAttribute("name", a.getName());
                    request.setAttribute("id", a.getID());
                    request.setAttribute("role", a.getRole());
                    List<Staff> ls = StaffDao.getAllStaffs();
                    List<Customer> lc = CustomerDao.getAllCustomers();
                    request.setAttribute("c", lc);
                    request.setAttribute("s", ls);
                    request.getRequestDispatcher("Admin.jsp").forward(request, response);
            }

            
            if(request.getParameter("action") != null)
            {
//                    CustomerDao.deleteCustomer(request.getParameter("id"));

                    List<Staff> ls = StaffDao.getAllStaffs();
                    request.setAttribute("s", ls);
                    List<Customer> lc = CustomerDao.getAllCustomers();
                    request.setAttribute("c", lc);

                    request.setAttribute("name", request.getParameter("adminName"));
                    
                    int id = StaffDao.reply_id();
                    String comment = " ";
                    if(request.getParameter("reply") != null)
                        comment = request.getParameter("reply");
                    String commentID = request.getParameter("commentID");
                    StaffDao.postReply(id+1, commentID, comment);
                    
                    List<Comment> allReplies = StaffDao.getAllReplies();
                    
                    request.setAttribute("allR", allReplies);

                    request.getRequestDispatcher("Admin.jsp").forward(request, response);
            }
            
            else
                if(request.getParameter("role") != null)
                {
                    out.println("masuk siniii");

                    CustomerDao.deleteCustomer(request.getParameter("id"));

                    List<Staff> ls = StaffDao.getAllStaffs();
                    request.setAttribute("s", ls);
                    List<Customer> lc = CustomerDao.getAllCustomers();
                    request.setAttribute("c", lc);

                    request.setAttribute("name", request.getParameter("adminName"));

//                    request.getRequestDispatcher("Admin.jsp").forward(request, response);
                }
                else if(request.getParameter("action").equalsIgnoreCase("deleteCustomer"))
                {

                    CustomerDao.deleteCustomer(request.getParameter("id"));

                    List<Staff> ls = StaffDao.getAllStaffs();
                    request.setAttribute("s", ls);
                    List<Customer> lc = CustomerDao.getAllCustomers();
                    request.setAttribute("c", lc);

                    request.setAttribute("name", request.getParameter("adminName"));
                    
                    
                    List<Comment> allR = StaffDao.getAllReplies();
                    request.setAttribute("allR", allR);

//                    request.getRequestDispatcher("Admin.jsp").forward(request, response);
                }
                else
                {
                    Admin a = StaffDao.getAdminById(request.getParameter("adminID"));
                    StaffDao.deleteStaff(request.getParameter("staffID"));
                    request.setAttribute("name", a.getName());
                    request.setAttribute("id", a.getID());
                    request.setAttribute("role", a.getRole());
                    List<Staff> ls = StaffDao.getAllStaffs();
                    List<Customer> lc = CustomerDao.getAllCustomers();
                    request.setAttribute("c", lc);
                    request.setAttribute("s", ls);
                    request.getRequestDispatcher("Admin.jsp").forward(request, response);
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
            Logger.getLogger(DeleteStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DeleteStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DeleteStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
