/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.dao.Customer;
import com.dao.CustomerDao;
import com.dao.ReservationDao;
import com.dao.StaffDao;
import com.dao.loginAdminDao;
import com.dao.loginCustomerDao;
import com.dao.loginStaffDao;
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
import model.Admin;
import model.Comment;
import model.Staff;

//import com.dao.loginadminDao;
//import com.model.loginadmin;
import model.loginCustomer;
import model.reservation;
/**
 *
 * @author Benjimal
 */
public class loginCustomerServlet1 extends HttpServlet {

//    public loginCustomerServlet1() {
//        
//        
//    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
//        /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet loginadminServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet loginadminServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//            PrintWriter out = response.getWriter();
//    response.setContentType("text/html");
    
    if(request.getParameter("action") != null)
    {
        List<Staff> ls = StaffDao.getAllStaffs();
        request.setAttribute("s", ls);
        List<Customer> lc = CustomerDao.getAllCustomers();
        Admin a = StaffDao.getAdminById(request.getParameter("id"));

        request.setAttribute("c", lc);
        request.setAttribute("a", a);
        request.setAttribute("name", a.getName());
        request.setAttribute("phone", a.getPhone());
        request.setAttribute("role", a.getRole());
        request.setAttribute("adminID", a.getID());
        
        List<Comment> allR = StaffDao.getAllReplies();
        request.setAttribute("allR", allR);
        
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }


    String username=request.getParameter("email");
    String password=request.getParameter("password");
    loginCustomer cust = new loginCustomer(username, password);
    loginCustomerDao dao = new loginCustomerDao();
    
//    ArrayList<Comment> allC = CustomerDao.getAllComments();
    //      cust.setUsername(username);
    //      admin.setPassword(password);
    boolean pass = false;
        Customer status = null;
        try {
            status = dao.validate(cust);
        } catch (SQLException ex) {
            Logger.getLogger(loginCustomerServlet1.class.getName()).log(Level.SEVERE, null, ex);
        }
    if(status != null)
    {
        out.println("<script>");
        out.print("alert(\"Log in successful! Welcome!\");");
        out.println("</script>");
//        out.println("<script>");
//        out.print("alert(\"Your username and password is wrong\");");
//        out.println("</script>");
        request.setAttribute("c", status);
//        request.setAttribute("allC", allC);
        request.setAttribute("id", status.getId());
        request.setAttribute("name", status.getName());
        request.setAttribute("email", status.getEmail());
        request.setAttribute("phone", status.getPhone());
        request.setAttribute("role", status.getRole());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    Staff s = null;
    s = new loginStaffDao().validate(username, password);
    boolean inactive = false;
    if (s != null)
    {
        if(s.getStatus().equalsIgnoreCase("INACTIVE"))
            inactive = true;
        else
        {
            out.println("<script>");
            out.print("alert(\"Log in successful! Welcome!\");");
            out.println("</script>");
    //        out.println("<script>");
    //        out.print("alert(\"Your username and password is wrong\");");
    //        out.println("</script>");
    //        request.setAttribute("customer", status);
            List<reservation> r = ReservationDao.getAllReservations();
            request.setAttribute("s", r);
            request.setAttribute("name", s.getName());
            request.setAttribute("id", s.getID());
            request.setAttribute("phone", s.getPhone());
            request.setAttribute("role", s.getRole());
            if("Staff".equalsIgnoreCase(s.getRole()))
                request.getRequestDispatcher("Staff.jsp").forward(request, response);
            else
                request.getRequestDispatcher("BoatOwner.jsp").forward(request, response);
        }
    }
    
    Admin a = null;
    a = new loginAdminDao().validate(username, password);
    
    if(a != null)
    {
        out.println("<script>");
        out.print("alert(\"Log in successful! Welcome!\");");
        out.println("</script>");
//        out.println("<script>");
//        out.print("alert(\"Your username and password is wrong\");");
//        out.println("</script>");
//        request.setAttribute("customer", status);
        List<Staff> ls = StaffDao.getAllStaffs();
        request.setAttribute("s", ls);
        List<Customer> lc = CustomerDao.getAllCustomers();
        request.setAttribute("c", lc);
        request.setAttribute("a", a);
        request.setAttribute("name", a.getName());
        request.setAttribute("phone", a.getPhone());
        request.setAttribute("role", a.getRole());
        request.setAttribute("id", a.getID());
        request.setAttribute("adminID", a.getID());
        request.setAttribute("adminName", a.getName());
        
        List<Comment> allR = StaffDao.getAllReplies();
        request.setAttribute("allR", allR);
        
        request.getRequestDispatcher("Admin.jsp").forward(request, response);
    }
    else
    {
        if(inactive)
        {
            out.println("<script>");
            out.print("alert(\"Your account is inactive, contact admin for activation!\");");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
        else
        {
            out.println("<script>");
            out.print("alert(\"Your username and password is wrong\");");
            out.println("</script>");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
    }
    
    //response.sendRedirect("login.jsp");
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
            Logger.getLogger(loginCustomerServlet1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginCustomerServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginCustomerServlet1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginCustomerServlet1.class.getName()).log(Level.SEVERE, null, ex);
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


