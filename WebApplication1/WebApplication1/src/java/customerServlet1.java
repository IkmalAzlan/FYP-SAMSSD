

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.dao.Customer;
import com.dao.CustomerDao;
import com.dao.ReservationDao;
import com.dao.StaffDao;
import com.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

//import com.dao.CustomerDao;
//import com.model.admin;

/**
 *
 * @author Benjimal
 */
public class customerServlet1 extends HttpServlet {
//    public static add(Customer c)
//    {
//        
//    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ClassNotFoundException, ServletException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
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
        String role = "role";
        if(null != request.getParameter("role") && !request.getParameter("role").isEmpty())
            role = request.getParameter("role");
        String address = "address";
        if(null != request.getParameter("address") && !request.getParameter("address").isEmpty())
            address = request.getParameter("address");
        String licence = "N/A";
        if(null != request.getParameter("licence") && !request.getParameter("licence").isEmpty())
            licence = request.getParameter("licence");
        String id = "id";
        if(null != request.getParameter("id") && !request.getParameter("id").isEmpty())
            id = request.getParameter("id");
        String brand = "brand";
        if(null != request.getParameter("brand") && !request.getParameter("brand").isEmpty())
            brand = request.getParameter("brand");
        String plate = "plate";
        if(null != request.getParameter("plate") && !request.getParameter("plate").isEmpty())
            plate = request.getParameter("plate");
        String color = "color";
        if(null != request.getParameter("color") && !request.getParameter("color").isEmpty())
            color = request.getParameter("color");
        String capacity = "capacity";
        if(null != request.getParameter("capacity") && !request.getParameter("capacity").isEmpty())
            capacity = request.getParameter("capacity");
//        if(null != request.getParameter("role") && !request.getParameter("role").isEmpty())
//            role = request.getParameter("role");
//        String phone = request.getParameter("phone");
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String role = request.getParameter("role");

        String status = ""; //CustomerDao.addCustomer(customer);
        if(null == role)
            role = "Owner Boat";
        else switch (role) {
            case "1":
                role = "Customer";
                Customer customer = new Customer(email, password, name, phone, role);
                status = CustomerDao.addCustomer(customer);
                break;
            case "2":
                role = "Owner Boat";
                Staff ss1 = new Staff("0", email, password, name, phone, role, "INACTIVE", address, licence);
                status = StaffDao.addStaff(ss1);
                break;
            case "boat":
                role = "boat";
                Boat b = new Boat(0, Integer.parseInt(id), brand, plate, Integer.parseInt(capacity), color);
                status = StaffDao.addBoat(b);
                List<reservation> r = ReservationDao.getAllReservations();
                Staff s = StaffDao.getStaffById(id);
                request.setAttribute("s", r);
                request.setAttribute("name", s.getName());
                request.setAttribute("id", s.getID());
                request.setAttribute("phone", s.getPhone());
                request.setAttribute("role", s.getRole());
                request.getRequestDispatcher("BoatOwner.jsp").include(request, response);
                break;
            default:
                role = "Staff";
                Staff ss2 = new Staff("0", email, password, name, phone, role, "INACTIVE", address, "N/A");
                status = StaffDao.addStaff(ss2);
                break;
        }
//        out.println("<!DOCTYPE html>");
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
//        out.print("name" + name);
//        out.print("phone" + phone);
//        Customer customer = new Customer(email, password, name, phone, role);
//        customer.setName(name);
//        customer.setPhone(phone);
//        customer.setEmail(email);
//        customer.setPass(password);
//        customer.setRole(role);
        
        
        
//        CustomerDao cd = new CustomerDao();
//        cd.addCustomer(customer);

//        out.print("<p>1" + customer.toString() + "</p>");
//        out.print("<p>2" + customer.toString() + "</p>");
        //Class.forName("com.mysql.jdbc.Driver");
//        Connection con = new DriverManager.();
//        try
//        {
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/holiday", "root", "");
//        }
//        catch (SQLException s)
//        {
////                    out.print("<p>3" + customer.toString() + s + "</p>");
//        }
//        out.print("<p>4" + customer.toString() + "</p>");
        //out.print("<p>" + con.toString() + "</p>");
//        String status = CustomerDao.addCustomer(customer);
//        out.print("<p>5" + status + "</p>");
            //out.println("alert(\"SQL error\""+customer.toString()+");");
//            status = DBConnection.getConnection().createStatement().executeUpdate("INSERT INTO users (name, phone, email, password, role) VALUES (\""+name+"\",\""+phone+"\",\""+email+"\",\""+password+"\",\""+role+"\")");
//
//            out.println("alert(\"Congrats, " + name + "! Register successful! You can log in now.\");");            
//1;// = CustomerDao.addCustomer(customer);
//        try{
//            Connection con = DBConnection.getConnection();
//            PreparedStatement preparedStatement = con.prepareStatement("insert into users (name, phone, email, password, role) values (?, ?, ?, ?, ?)");
//            //Parameters start with 1
//            preparedStatement.setString(1, name);
//            preparedStatement.setString(2, phone);
//            preparedStatement.setString(3, email);
//            preparedStatement.setString(4, password);
//            preparedStatement.setString(5, role);
//            preparedStatement.executeUpdate();
//            con.close();
//            status = 1;
//        } catch (SQLException e){
//            System.out.print(e);
//            status = 0;
//        }

        
            List<reservation> r = ReservationDao.getAllReservations();
            request.setAttribute("s", r);

        if ("1".equals(status)) {
//            out.print("<p>Record saved successfully!" + customer.toString() + "</p>");
            out.println("<script>");
            if(role.equalsIgnoreCase("boat"))
                out.println("alert(\"Boat : " + color + " " + brand + " (" + plate + ") " + " added successfully.\");");
            else  
                out.println("alert(\"Congrats, " + name + "! Register successful! You can log in now.\");");
//            out.println("window.setLocation('index.jsp');");
            out.println("</script>");
            request.getRequestDispatcher("index.jsp").include(request, response);
            //response.setHeader("Home", request.getContextPath() + "/index.jsp");
        } else {
            out.println("<script>");
           out.println("alert(\"Please Try Again\");");
           out.println("</script>");
            out.println(status+"Sorry! unable to save record");
                request.getRequestDispatcher("signUp.jsp").include(request, response);
        }

//            out.println("<h1>PN :  " + request.getParameter("phone") + "</h1>");
//        out.print("name" + name);
//        out.print("phone" + phone);
//            out.println("</body>");
//            out.println("</html>");
        out.close();
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
            Logger.getLogger(customerServlet1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(customerServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(customerServlet1.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(customerServlet1.class.getName());
        } catch (SQLException ex) {
            Logger.getLogger(customerServlet1.class.getName()).log(Level.SEVERE, null, ex);
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
