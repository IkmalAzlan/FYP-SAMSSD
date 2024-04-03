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
import model.Admin;
import model.Staff;
import model.reservation;

/**
 *
 * @author Benjimal
 */
public class UpdateStaffServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStaffServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("staffID") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("phone") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("id") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("name") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("email") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("password") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("role") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("staffStatus") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("address") + "</h1>");
            out.println("<h1>Servlet UpdateStaffServlet at " + request.getContextPath() + " " + request.getParameter("license") + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String id = "id";
            if(null != request.getParameter("id") && !request.getParameter("id").isEmpty())
                id = request.getParameter("id");
            String name = "name";
            if(null != request.getParameter("name") && !request.getParameter("name").isEmpty())
                name = request.getParameter("name");
            String phone = "phone";
            if(null != request.getParameter("phone") && !request.getParameter("phone").isEmpty())
                phone = request.getParameter("phone");
            String email = "email";
            if(null != request.getParameter("email") && !request.getParameter("email").isEmpty())
                email = request.getParameter("email");
            String password = "password";
            if(null != request.getParameter("password") && !request.getParameter("password").isEmpty())
                password = request.getParameter("password");
            String role = "s";
            if(null != request.getParameter("role") && !request.getParameter("role").isEmpty())
                role = request.getParameter("role");
            String status = "status";
            if(null != request.getParameter("staffStatus") && !request.getParameter("staffStatus").isEmpty())
                status = request.getParameter("staffStatus");
            String address = "address";
            if(null != request.getParameter("address") && !request.getParameter("address").isEmpty())
                address = request.getParameter("address");
            String license = "license";
            if(null != request.getParameter("license") && !request.getParameter("license").isEmpty())
                license = request.getParameter("license");
            
            
            
            Staff s = new Staff(id, email, password, name, phone, role, status, address, license);
            System.out.println(s.toString());
            Customer c = new Customer(email, password, name, phone, role);
            c.setId(id);
            try {     
                if(request.getParameter("action")!=null)
                if(request.getParameter("action").toString().equalsIgnoreCase("update"))
                {
                    
                    StaffDao.updateStaff(s);
                    request.setAttribute("name", s.getName());
                    request.setAttribute("id", s.getID());
                    request.setAttribute("phone", s.getPhone());
                    request.setAttribute("role", s.getRole());
                    if(role.equalsIgnoreCase("Staff"))
                    {
                        List<reservation> r = ReservationDao.getAllReservations();
                        request.setAttribute("s", r);
                        request.getRequestDispatcher("Staff.jsp").forward(request, response);
                    }
                    else if(role.equalsIgnoreCase("Owner Boat"))
                    {
                        StaffDao.updateStaff(s);
                        List<reservation> r = ReservationDao.getAllReservations();
                        request.setAttribute("s", r);
                        request.getRequestDispatcher("BoatOwner.jsp").forward(request, response);
                    }
                    else if(role.equalsIgnoreCase("Customer"))
                    {
                        
                        CustomerDao.updateCustomer(c);
                        //Customer c = CustomerDao.getCustomerById(phone);
                        request.setAttribute("c", c);
                        request.setAttribute("name", c.getName());
                        request.setAttribute("phone", c.getPhone());
                        request.setAttribute("role", c.getRole());
                        request.setAttribute("id", c.getId());
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
                out.println("<script>");
                out.print("alert(\"Staff updated successfully!\");");
                out.println("</script>");
                StaffDao.updateStaff(s);
                Admin a = StaffDao.getAdminById(request.getParameter("adminID"));
                try {
                    List<Staff> ls = StaffDao.getAllStaffs();
                    request.setAttribute("s", ls);
                    List<Customer> lc = CustomerDao.getAllCustomers();
                    request.setAttribute("c", lc);
                    request.setAttribute("a", a);
                    request.setAttribute("name", a.getName());
                    request.setAttribute("phone", a.getPhone());
                    request.setAttribute("role", a.getRole());
                    request.setAttribute("adminID", a.getID());
                    out.println("<script>");
                out.print("alert(\"Staff updated failed! Contact system admin if the problem persist."+ s.toString() + "\");");
                out.println("</script>");
                    if(request.getParameter("action") == null)
                    {
                        request.getRequestDispatcher("Admin.jsp").forward(request, response);
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(UpdateStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UpdateStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
                out.println("<script>");
                out.print("alert(\"Staff updated failed! Contact system admin if the problem persist.\");");
                out.println("</script>");
                    //request.getRequestDispatcher("Admin.jsp").forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(UpdateStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(UpdateStaffServlet.class.getName()).log(Level.SEVERE, null, ex);
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
