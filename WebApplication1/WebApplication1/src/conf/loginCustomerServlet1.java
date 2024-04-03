/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.dao.Customer;
import com.dao.loginCustomerDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.dao.loginadminDao;
//import com.model.loginadmin;
import model.loginCustomer;
/**
 *
 * @author User
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
//        response.setContentType("text/html;charset=UTF-8");
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
    //response.setContentType("text/html");
    String username=request.getParameter("email");
    String password=request.getParameter("password");
    loginCustomer cust = new loginCustomer(username, password);
//            out.println("<h1>Servlet loginadminServlet at " + cust.getPassword() + "</h1>");
//            out.println("<h1>Servlet loginadminServlet at " + cust.getEmail()+ "</h1>");
    loginCustomerDao dao = new loginCustomerDao();
//            out.println("<h1>Servlet loginadminServlet at " + cust.getPassword() + "</h1>");
//            out.println("<h1>Servlet loginadminServlet at " + cust.getEmail()+ "</h1>");
    //      cust.setUsername(username);
    //      admin.setPassword(password);
        Customer c = dao.validate(cust);
        //request.Set<String> hashSet = new HashSet<String>();


//            out.println("<h1>Servlet loginadminServlet at " + cust.getPassword() + "</h1>");
//            out.println("<h1>Servlet loginadminServlet at " + cust.getEmail()+ "</h1>");
//            out.println("<h1>Servlet loginadminServlet at " + cust.toString() + "</h1>");
    if(c != null)
    {
//         
        request.setAttribute("customer", c);
        request.setAttribute("name", c.getName()); 
        out.println("<h1>Servlet loginadminServlet at " + cust.getPassword() + "</h1>");
//            out.println("<h1>Servlet loginadminServlet at " + cust.getEmail()+ "</h1>");
        //response.sendRedirect("index.jsp");
        out.println("<script>");
        out.print("confirm(\"Log in successful! Welcome!\");");
        //out.print("window.location = \"index.jsp\"");
        out.println("</script>");
//        out.println("<script>");
//        out.print("alert(\"Your username and password is wrong\");");
//        out.println("</script>");
        //RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        //rd.forward(request, response);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        //response.sendRedirect("index.jsp");
        //status = true;
    }
    
    if(c == null)
    {
//            out.println("<h1>Servlet loginadminServlet at " + cust.getPassword() + "</h1>");
//            out.println("<h1>Servlet loginadminServlet at " + cust.getEmail()+ "</h1>");
        out.println("<script>");
        out.print("confirm(\"Your username and password is wrong\");");
        out.println("</script>");
        //request.getRequestDispatcher("login.jsp").include(request, response);
        //response.sendRedirect("login.jsp");

    }
    //response.sendRedirect("login.jsp");
//    if(c != null)
//        request.getRequestDispatcher("index.jsp").forward(request, response);
    request.getRequestDispatcher("login.jsp").forward(request, response);
//        if(status)
//            response.sendRedirect("index.jsp");
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


