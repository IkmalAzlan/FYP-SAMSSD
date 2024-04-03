<%-- 
    Document   : Admin
    Created on : Nov 29, 2022, 11:55:12 AM
    Author     : Benjimal
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Comment"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="model.Admin"%>
<%@page import="com.dao.Customer"%>
<%@page import="model.Staff"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="model.reservation"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Holiday</title>
        <!--
        Holiday Template
        http://www.templatemo.com/tm-475-holiday
        -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
        <link href="css/flexslider.css" rel="stylesheet">
        <link href="css/templatemo-style.css" rel="stylesheet">
        <%@ page import="java.sql.*"%>
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <style>
        .badge-success {
            background-color: #5cc45e;
        }
    </style>
    <body class="tm-gray-bg">
        <!-- Header -->
        <div class="tm-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-4 col-sm-3 tm-site-name-container" style="width: 30%;">
                        <a href="#" class="tm-site-name">Salang Indah Resort</a>	
                    </div>
                    <div class="col-lg-6 col-md-8 col-sm-9" style="width: 70%;">
                        <div class="mobile-menu-icon">
                            <i class="fa fa-bars"></i>
                        </div>
                        <nav class="tm-nav">
                            <ul>
                                <li><a href="index.jsp" class="active">Home</a></li>
                                    <%
                                        if (request.getAttribute("name") != null) {
                                    %>


                                <li>
                                    <form id="editForm" action="./EditProfileServlet" method="post">
                                        <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                        <input hidden name="id" value="<%=request.getAttribute("adminID")%>"/>
                                        <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                                        <input hidden name="action" value="report"/>
                                        <input id="editButton" hidden type="submit" name="id" value="Report"/>
                                        <a href="#"  onclick="document.getElementById('editForm').submit()" >Report</a>

                                    </form></li>
                                <li><a href="index.jsp">Welcome, ADMIN 
                                        <%=request.getAttribute("name")%>! (LOG OUT)</a></li>
                                        <%
                                        } else {
                                        %>
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="signUp.jsp">Sign Up</a></li>
                                    <%
                                        }
                                    %>

                            </ul>
                        </nav>		
                    </div>				
                </div>
            </div>	  	
        </div>

        <!-- Banner -->
        <section class="tm-banner">
            <!-- Flexslider -->
            <div class="flexslider flexslider-banner">
                <ul class="slides">
                    <li>
                        <div class="tm-banner-inner">
                            <h1 class="tm-banner-title">Welcome <span class="tm-yellow-text">To The Best</span> Resort</h1>
                            <p class="tm-banner-subtitle">For Your Holidays</p>
                            <a href="#more" class="tm-banner-link">Learn More</a>	
                        </div>
                        <img src="img/tryBanner1.jpg" alt="Image" />	
                    </li>

                </ul>
            </div>	
        </section>

        <style>
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
            }

            .button1 {
                width: 250px;
            }
            .button2 {
                width: 50%;
            }
            .button3 {
                width: 100%;
            }
        </style>
        <!-- gray bg -->	

        <section class="tm-white-bg section-padding-bottom">
            <div class="container">


                <br>

                <div class="row">
                    <form action="index.jsp" method="post">
                        <input type="hidden" name="name" value=""/>
                        <input type="hidden" name="phone" value=""/>
                        <input type="hidden" name="session" value="pn">
                        <input type="hidden" name="passenger" value="pn">
                        <div>
                            <!--<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
                            <div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Checking availability</h2></div>
                            <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>-->	

                            <div class="alert alert-info text-center">
                                <h2> LIST OF STAFF </h2> 
                                <hr />


                            </div>

                    </form>
                    <form action="reserveServlet" method="post">
                        <input type="hidden" name="ss" value="ss">
                        <input type="hidden" name="ps" value="ps">
                        <input type="hidden" name="pn" value="pn">
                        <input type="hidden" name="session" value="pn">
                        <input type="hidden" name="passenger" value="pn">
                    </form>           
                    <!--   Kitchen Sink -->
                    <div class="panel panel-default">

                        <div class="panel-body">
                            <div class="table-responsive">

                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>EMAIL</th>
                                            <th>PASSWORD</th>
                                            <th>NAME</th>
                                            <th>PHONE</th>
                                            <th>ADDRESS</th>
                                            <th>ROLE</th>
                                            <th>STATUS</th>
                                            <th>EDIT</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Staff> ls = (List<Staff>) request.getAttribute("s");
                                        //    boolean avail = true;
                                        //    String[] status = {"AVAILABLE", "AVAILABLE", "AVAILABLE"};
                                        //    String st = "";
                                        //    int ss = Integer.parseInt(request.getParameter("session"));
                                            for (Staff s : ls) {
                                                if (!"STAFF".equalsIgnoreCase(s.getRole())) {
                                                    continue;
                                                }

                                                out.println("<form action=\"editStaff\" method=\"post\">");
                                                out.println("<input name='adminName' hidden readonly value='" + request.getAttribute("name") + "'/>");
                                                out.println("<input name='adminID' hidden readonly value='" + request.getAttribute("adminID") + "'/>");
                                                out.println("<input name='id' hidden readonly value='" + s.getID() + "'/>");
                                                out.println("<input name='role' hidden readonly value='" + request.getAttribute("role") + "'/>");
                                                out.println("<input name='name' hidden readonly value='" + s.getName() + "'/>");
                                                out.println("<tr><td><input hidden name='staffID' readonly value='" + s.getID() + "'/>" + s.getID() + "</td>");
                                                out.println("<td> " + s.getEmail() + "</td>");
                                                out.println("<td> " + s.getPassword() + "</td>");
                                                out.println("<td> " + s.getName() + "</td>");
                                                out.println("<td> " + s.getPhone() + "</td>");
                                                out.println("<td> " + s.getAddress() + "</td>");
                                                out.println("<td> " + s.getRole() + "</td>");
                                                if ("INACTIVE".equalsIgnoreCase(s.getStatus())) {
                                                    out.println("<td> <span class=\"label label-danger label-as-badge\">INACTIVE</span></td>");
                                                } else {
                                                    out.println("<td> <span class=\"label label-success label-as-badge\">ACTIVE</span></td>");
                                                }
                                        //        out.println("<td> " + s.getStatus() + "</td>");
                                        //        out.println("<td> " + s.getStatus() + "</td></tr>");
                                                out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s" + s.getID() + "\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> EDIT</button></td></tr>");

                                                out.println("</form>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s1\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td></tr>");
                                        //    
                                        //    out.println("<h>" + status[0] + status[1] + status[2] + r.getStatus() + r.getDate() + request.getParameter("date") + "</h>");
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()))
                                        //        {
                                        //            if("1".equalsIgnoreCase(r.getSession().toString()) && !"RESERVED".equalsIgnoreCase(status[0]))
                                        //                status[0] = r.getStatus();
                                        //            else if("2".equalsIgnoreCase(r.getSession().toString()) && !"RESERVED".equalsIgnoreCase(status[1]))
                                        //                status[1] = r.getStatus();
                                        //                else if("3".equalsIgnoreCase(r.getSession().toString()) && !"RESERVED".equalsIgnoreCase(status[2]))
                                        //                status[2] = r.getStatus();
                                        //        }

                                        //            out.print("<h>getdate: " + r.getDate() + "getparameter : " + request.getParameter("date") + "</h>");
                                        //            out.println("<h4>DATE:" + r.getDate() + "=" + request.getParameter("date") + "</h4>" );
                                        //            out.println("<h4>SESSION:" + r.getSession() + "=" + request.getParameter("session") + "</h4>" );
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()) && r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //        {
                                        //            st = r.getStatus();
                                        //            
                                        //            if("RESERVED".equalsIgnoreCase(st))
                                        //                avail = false;
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //            out.println("<h4>!STATUS:" + status[0] + status[1] + status[2] +"</h4>" );
                                        //        }
                                                //if(r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //            out.println("<h4>!STATUS:" + status[0] + status[1] + status[2] +"</h4>" );
                                            }
                                            //out.println("<h>" + status[0] + status[1] + status[2] + "</h>");
                                        //    if(avail)
                                        //    {
                                        //        out.print("<script>");
                                        //        out.print("confirm(\"Slot is available, click reserve button to book it now!\");"); 
                                        //        out.println("</script>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.print("<script>");
                                        //        out.print("confirm(\"Sorry your requested slot is not available anymore. You can pick from another free slot on the same date, you pick a new date!\");"); 
                                        //        out.println("</script>");
                                        //    }

                                        %>
                                        <!--                                        <tr>
                                        
                                                                                <td> 1 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[0]) || "PENDING PAYMENT".equalsIgnoreCase(status[0]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s1\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        %>
                                        <!--                                        </tr>   
                                                                                <tr>
                                                                                   
                                                                                    <td> 2 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[1]) || "PENDING PAYMENT".equalsIgnoreCase(status[1]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s2\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        %>
                                        <!--                                            
                                                                                </tr>
                                                                                <tr>
                                                                                    
                                                                                    <td> 3 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[2]) || "PENDING PAYMENT".equalsIgnoreCase(status[2]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s3\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //            out.println("<h4>!!DATE:"  + "=" + request.getParameter("date") + "(ST = " + status[2].toString() + ")</h4>" );
                                        //            out.println("<h4>!!SESSION:"  + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //out.print("<h4>" + rs.size() + "</h4>");
                                        //for(reservation r : rs)
                                        //    {
                                        ////    out.println("<h>" + status[0] + status[1] + status[2] + r.getStatus() + r.getDate() + request.getParameter("date") + "</h>");
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()))
                                        //        {
                                        //            if("1".equalsIgnoreCase(r.getSession().toString()))
                                        //                status[0] = r.getStatus();
                                        //            else if("2".equalsIgnoreCase(r.getSession().toString()))
                                        //                status[1] = r.getStatus();
                                        //            else
                                        //                status[2] = r.getStatus();
                                        //        }
                                        //        
                                        //            out.print("<h>getdate: " + r.getDate() + "getparameter : " + request.getParameter("date") + "</h>");
                                        //            out.println("<h4>DATE:" + r.getDate() + "=" + request.getParameter("date") + "</h4>" );
                                        //            out.println("<h4>SESSION:" + r.getSession() + "=" + request.getParameter("session") + "</h4>" );
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()) && r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //        {
                                        //        
                                        //            st = r.getStatus();
                                        //            
                                        //            if("RESERVED".equalsIgnoreCase(st))
                                        //                avail = false;
                                        //                
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //        }
                                        //        
                                        //        //if(r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //            
                                        //    }

                                        %>

                                        <!--                                        </tr>-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </form>
                    <!-- End  Kitchen Sink -->
                </div>

                <div>
                    <!--<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
                    <div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Checking availability</h2></div>
                    <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>-->	

                    <div class="alert alert-info text-center">
                        <h2> LIST OF BOAT OWNERS </h2> 
                        <hr />


                    </div>

                    </form>
                    <form action="reserveServlet" method="post">
                        <input type="hidden" name="ss" value="ss">
                        <input type="hidden" name="ps" value="ps">
                        <input type="hidden" name="pn" value="pn">
                        <input type="hidden" name="session" value="pn">
                        <input type="hidden" name="passenger" value="pn"><!-- comment -->



                        <input type="hidden" name="staffID" value="">
                        <input type="hidden" name="adminID" value="">
                    </form>
                    <!--   Kitchen Sink -->
                    <div class="panel panel-default">

                        <div class="panel-body">
                            <div class="table-responsive">

                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>EMAIL</th>
                                            <th>PASSWORD</th>
                                            <th>NAME</th>
                                            <th>PHONE</th>
                                            <th>ADDRESS</th>
                                            <th>LICENSE</th>
                                            <th>ROLE</th>
                                            <th>STATUS</th>
                                            <th>EDIT</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%//    boolean avail = true;
                                        //    String[] status = {"AVAILABLE", "AVAILABLE", "AVAILABLE"};
                                        //    String st = "";
                                        //    int ss = Integer.parseInt(request.getParameter("session"));
                                            for (Staff s : ls) {
                                                if ("STAFF".equalsIgnoreCase(s.getRole())) {
                                                    continue;
                                                }

                                                out.println("<form action=\"editStaff\" method=\"post\">");
                                                out.println("<input name='adminName' hidden readonly value='" + request.getAttribute("name") + "'/>");
                                                out.println("<input name='adminID' hidden readonly value='" + request.getAttribute("adminID") + "'/>");
                                                out.println("<input name='id' hidden readonly value='" + s.getID() + "'/>");
                                                out.println("<input name='role' hidden readonly value='" + request.getAttribute("role") + "'/>");
                                                out.println("<input name='name' hidden readonly value='" + s.getName() + "'/>");
                                                out.println("<tr><td><input hidden name='staffID' readonly value='" + s.getID() + "'/>" + s.getID() + "</td>");
                                                out.println("<td> " + s.getEmail() + "</td>");
                                                out.println("<td> " + s.getPassword() + "</td>");
                                                out.println("<td> " + s.getName() + "</td>");
                                                out.println("<td> " + s.getPhone() + "</td>");
                                                out.println("<td> " + s.getAddress() + "</td>");
                                                out.println("<td> " + s.getLicense() + "</td>");
                                                out.println("<td> " + s.getRole() + "</td>");
                                                if ("INACTIVE".equalsIgnoreCase(s.getStatus())) {
                                                    out.println("<td> <span class=\"label label-danger label-as-badge\">INACTIVE</span></td>");
                                                } else {
                                                    out.println("<td> <span class=\"label label-success label-as-badge\">ACTIVE</span></td>");
                                                }
                                        //        out.println("<td> " + s.getStatus() + "</td>");
                                        //        out.println("<td> " + s.getStatus() + "</td></tr>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                                out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s" + s.getID() + "\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> EDIT</button></td></tr>");
                                                out.println("</form>");
                                        //    out.println("<h>" + status[0] + status[1] + status[2] + r.getStatus() + r.getDate() + request.getParameter("date") + "</h>");
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()))
                                        //        {
                                        //            if("1".equalsIgnoreCase(r.getSession().toString()) && !"RESERVED".equalsIgnoreCase(status[0]))
                                        //                status[0] = r.getStatus();
                                        //            else if("2".equalsIgnoreCase(r.getSession().toString()) && !"RESERVED".equalsIgnoreCase(status[1]))
                                        //                status[1] = r.getStatus();
                                        //                else if("3".equalsIgnoreCase(r.getSession().toString()) && !"RESERVED".equalsIgnoreCase(status[2]))
                                        //                status[2] = r.getStatus();
                                        //        }

                                        //            out.print("<h>getdate: " + r.getDate() + "getparameter : " + request.getParameter("date") + "</h>");
                                        //            out.println("<h4>DATE:" + r.getDate() + "=" + request.getParameter("date") + "</h4>" );
                                        //            out.println("<h4>SESSION:" + r.getSession() + "=" + request.getParameter("session") + "</h4>" );
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()) && r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //        {
                                        //            st = r.getStatus();
                                        //            
                                        //            if("RESERVED".equalsIgnoreCase(st))
                                        //                avail = false;
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //            out.println("<h4>!STATUS:" + status[0] + status[1] + status[2] +"</h4>" );
                                        //        }
                                                //if(r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //            out.println("<h4>!STATUS:" + status[0] + status[1] + status[2] +"</h4>" );
                                            }
                                            //out.println("<h>" + status[0] + status[1] + status[2] + "</h>");
                                        //    if(avail)
                                        //    {
                                        //        out.print("<script>");
                                        //        out.print("confirm(\"Slot is available, click reserve button to book it now!\");"); 
                                        //        out.println("</script>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.print("<script>");
                                        //        out.print("confirm(\"Sorry your requested slot is not available anymore. You can pick from another free slot on the same date, you pick a new date!\");"); 
                                        //        out.println("</script>");
                                        //    }

                                        %>
                                        <!--                                        <tr>
                                        
                                                                                <td> 1 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[0]) || "PENDING PAYMENT".equalsIgnoreCase(status[0]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s1\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        %>
                                        <!--                                        </tr>   
                                                                                <tr>
                                                                                   
                                                                                    <td> 2 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[1]) || "PENDING PAYMENT".equalsIgnoreCase(status[1]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s2\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        %>
                                        <!--                                            
                                                                                </tr>
                                                                                <tr>
                                                                                    
                                                                                    <td> 3 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[2]) || "PENDING PAYMENT".equalsIgnoreCase(status[2]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s3\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //            out.println("<h4>!!DATE:"  + "=" + request.getParameter("date") + "(ST = " + status[2].toString() + ")</h4>" );
                                        //            out.println("<h4>!!SESSION:"  + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //out.print("<h4>" + rs.size() + "</h4>");
                                        //for(reservation r : rs)
                                        //    {
                                        ////    out.println("<h>" + status[0] + status[1] + status[2] + r.getStatus() + r.getDate() + request.getParameter("date") + "</h>");
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()))
                                        //        {
                                        //            if("1".equalsIgnoreCase(r.getSession().toString()))
                                        //                status[0] = r.getStatus();
                                        //            else if("2".equalsIgnoreCase(r.getSession().toString()))
                                        //                status[1] = r.getStatus();
                                        //            else
                                        //                status[2] = r.getStatus();
                                        //        }
                                        //        
                                        //            out.print("<h>getdate: " + r.getDate() + "getparameter : " + request.getParameter("date") + "</h>");
                                        //            out.println("<h4>DATE:" + r.getDate() + "=" + request.getParameter("date") + "</h4>" );
                                        //            out.println("<h4>SESSION:" + r.getSession() + "=" + request.getParameter("session") + "</h4>" );
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()) && r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //        {
                                        //        
                                        //            st = r.getStatus();
                                        //            
                                        //            if("RESERVED".equalsIgnoreCase(st))
                                        //                avail = false;
                                        //                
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //        }
                                        //        
                                        //        //if(r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //            
                                        //    }

                                        %>

                                        <!--                                        </tr>-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <form>
                    </form>
                    <!-- End  Kitchen Sink -->
                </div>


                <div>
                    <!--<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
                    <div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Checking availability</h2></div>
                    <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>-->	

                    <div class="alert alert-info text-center">
                        <h2> LIST OF CUSTOMERS </h2> 
                        <hr />


                    </div>

                    </form>
                    <form action="reserveServlet" method="post">
                        <input type="hidden" name="ss" value="ss">
                        <input type="hidden" name="ps" value="ps">
                        <input type="hidden" name="pn" value="pn">
                        <input type="hidden" name="session" value="pn">
                        <input type="hidden" name="passenger" value="pn"><!-- comment -->



                        <input type="hidden" name="staffID" value="">
                        <input name="adminID" value="<%=request.getAttribute("adminID")%>" hidden />
                    </form>
                    <!--   Kitchen Sink -->
                    <div class="panel panel-default">

                        <div class="panel-body">
                            <div class="table-responsive">

                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>

                                            <th>ID</th>
                                            <th>EMAIL</th>
                                            <th>PASSWORD</th>
                                            <th>NAME</th>
                                            <th>PHONE</th>
                                            <th>ROLE</th>
                                            <th>DELETE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Customer> lc = (List<Customer>) request.getAttribute("c");
                                            for (Customer s : lc) {
                                                out.println("<form action=\"DeleteCustomerServlet\" method=\"post\">");
                                                out.println("<input name='adminName' hidden readonly value='" + request.getAttribute("name") + "'/>");
                                                out.println("<input name='cID' hidden value='" + s.getId() + "'/>");
                                                out.println("<input name='name' hidden readonly value='" + s.getName() + "'/>");
                                                out.println("<input name='role' hidden readonly value='" + s.getRole() + "'/>");
                                                out.println("<input name='adminRole' hidden readonly value='" + s.getRole() + "'/>");
                                                out.println("<input name='adminID' hidden readonly value='" + request.getAttribute("id") + "'/>");
                                                out.println("<input name='id' hidden readonly value='" + request.getAttribute("id") + "'/>");
                                                out.println("<input name='action' hidden readonly value='deleteCustomer'/>");
                                                out.println("<tr><td><input hidden name='staffID' readonly value='" + s.getId() + "'/>" + s.getId() + "</td>");
                                                out.println("<td> " + s.getEmail() + "</td>");
                                                out.println("<td> " + s.getPass() + "</td>");
                                                out.println("<td> " + s.getName() + "</td>");
                                                out.println("<td> " + s.getPhone() + "</td>");
                                                out.println("<td> " + s.getRole() + "</td>");
                                        //        if("INACTIVE".equalsIgnoreCase(s.getStatus()))
                                        //            out.println("<td> <span class=\"label label-danger label-as-badge\">INACTIVE</span></td>");
                                        //        else
                                        //            out.println("<td> <span class=\"label label-success label-as-badge\">ACTIVE</span></td>");
                                                out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s" + s.getId() + "\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> DELETE </button></td></tr>");
                                                out.println("</form>");
                                            }
                                        %>
                                        <!--                                        <tr>
                                        
                                                                                <td> 1 </td>-->
                                        <%
                                        //    if("AVAILABLE".equalsIgnoreCase(status[0]) || "PENDING PAYMENT".equalsIgnoreCase(status[0]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s1\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        %>
                                        <!--                                        </tr>   
                                                                                <tr>
                                                                                   
                                                                                    <td> 2 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[1]) || "PENDING PAYMENT".equalsIgnoreCase(status[1]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s2\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        %>
                                        <!--                                            
                                                                                </tr>
                                                                                <tr>
                                                                                    
                                                                                    <td> 3 </td>-->
                                        <%//    if("AVAILABLE".equalsIgnoreCase(status[2]) || "PENDING PAYMENT".equalsIgnoreCase(status[2]))
                                        //    {
                                        //        out.println("<td> <span class=\"label label-success label-as-badge\">AVAILABLE</span></td>");
                                        //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s3\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //    else
                                        //    {
                                        //        out.println("<td> <span class=\"label label-warning label-as-badge\">RESERVED</span></td>");
                                        //        out.println("<td><button disabled=\"true\" type=\"submit\" class=\"btn btn-primary btn-xs disabled\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> RESERVE</button></td>");
                                        //    }
                                        //            out.println("<h4>!!DATE:"  + "=" + request.getParameter("date") + "(ST = " + status[2].toString() + ")</h4>" );
                                        //            out.println("<h4>!!SESSION:"  + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //out.print("<h4>" + rs.size() + "</h4>");
                                        //for(reservation r : rs)
                                        //    {
                                        ////    out.println("<h>" + status[0] + status[1] + status[2] + r.getStatus() + r.getDate() + request.getParameter("date") + "</h>");
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()))
                                        //        {
                                        //            if("1".equalsIgnoreCase(r.getSession().toString()))
                                        //                status[0] = r.getStatus();
                                        //            else if("2".equalsIgnoreCase(r.getSession().toString()))
                                        //                status[1] = r.getStatus();
                                        //            else
                                        //                status[2] = r.getStatus();
                                        //        }
                                        //        
                                        //            out.print("<h>getdate: " + r.getDate() + "getparameter : " + request.getParameter("date") + "</h>");
                                        //            out.println("<h4>DATE:" + r.getDate() + "=" + request.getParameter("date") + "</h4>" );
                                        //            out.println("<h4>SESSION:" + r.getSession() + "=" + request.getParameter("session") + "</h4>" );
                                        //        if(r.getDate().toString().equalsIgnoreCase(request.getParameter("date").toString()) && r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //        {
                                        //        
                                        //            st = r.getStatus();
                                        //            
                                        //            if("RESERVED".equalsIgnoreCase(st))
                                        //                avail = false;
                                        //                
                                        //            out.println("<h4>!DATE:" + r.getDate() + "=" + request.getParameter("date") + "(ST = " + st.toString() + ")</h4>" );
                                        //            out.println("<h4>!SESSION:" + r.getSession() + "=" + request.getParameter("session") + "(AVAIL = " + avail + ")</h4>" );
                                        //        }
                                        //        
                                        //        //if(r.getSession().toString().equalsIgnoreCase(request.getParameter("session").toString()))
                                        //            
                                        //    }

                                        %>

                                        <!--                                        </tr>-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>



                    <div class="alert alert-info text-center">
                        <h2> LIST OF FEEDBACK </h2> 
                        <hr />


                    </div>

                    <%    ArrayList<Comment> allC = CustomerDao.getAllComments();

                        for (Comment cm : allC) {
                            Customer ct = CustomerDao.getCustomerByIdd(String.valueOf(cm.getC_id()));
                    %>
                    <div class="card-body">
                        <div class="d-flex flex-start align-items-center">
                            <div>
                                <h4 class="fw-bold text-primary mb-1"><%=ct.getName()%></h4>
                                <p class="text-muted mb-0">
                                    <%=cm.getTimestamp()%>
                                </p>
                            </div>
                        </div>

                        <p class="mt-3 mb-4 pb-2" style="font-size:20px">
                            <%=cm.getComment()%>
                        </p>
                        <br>

                    </div>
                    <%
        //                    if((Admin)request.getAttribute("a") != null)
        //                                              {

                        out.println("<form action=\"DeleteStaffServlet\" method=\"post\">");
                        out.println("<input name='adminName' hidden readonly value='" + request.getAttribute("name") + "'/>");
                        out.println("<input name='adminID' hidden readonly value='" + request.getAttribute("id") + "'/>");
                        out.println("<input name='action' hidden readonly value='reply'/>");
                        out.println("<input name='commentID' hidden readonly value='" + cm.getId() + "'/>");
                    %> 
                    <div class="card-footer py-3 border-0" >
                        <div>
                            <%
                                boolean gotReply = false;
                                if (request.getAttribute("allR") != null) {
                                    List<Comment> allR = (List<Comment>) request.getAttribute("allR");
                                    for (Comment replies : allR) {
                                        if (replies.getC_id() == cm.getId()) {
                            %>
                            <textarea name="reply" class="form-control" style="background-color: #e5e5e5;font-size:14pt;" rows="4" colspan="10" ><%=replies.getComment()%></textarea>
                            <%
                                        gotReply = true;
                                        break;
                                    }
                                }
                                if (!gotReply) {
                            %>
                            <textarea name="reply" class="form-control" style="background-color: #e5e5e5;font-size:14pt;" rows="4" colspan="10" ></textarea>
                            <%
                                    }
                                }
                            %>
                            <label class="form-label" >Reply</label>
                        </div>

                        <div class="float-end mt-2 pt-1">
                            <button type="submit" name="action" value="AddComment" class="btn btn-primary btn-xs"> Save </button>
                            <input hidden name="operation" value="AddComment"> 
                        </div>
                    </div>
                    <hr>
                    <%
                    //        out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s" + s.getId() + "\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> DELETE </button></td></tr>");
                            out.println("</form>");
                    //    }
                        }
                    %>

                    <!-- End  Kitchen Sink -->
                </div>


            </div>
        </section>



        <!-- white bg -->

        <footer class="tm-black-bg">
            <div class="container">
                <div class="row">
                    <p class="tm-copyright-text">Copyright &copy; 2023 Salang Indah Resort 

                        | </p>
                </div>
            </div>		
        </footer>
        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
        <script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
        <script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
        <script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
        <!--
                <script src="js/froogaloop.js"></script>
                <script src="js/jquery.fitvid.js"></script>
        -->
        <script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->


        <script>
                                                                    $("[name='idtd'").click(function () {
                                                                        alert("VALUE OF THE TD IS : " + $("[name='idtd'").text());
                                                                    });
        </script>
        <!--	<script>
                        // HTML document is loaded. DOM is ready.
                        $(document).ready(function(){
                            $("#s").click(function(){
                          alert("Checking your date...");
                          if ("<%=request.getParameter("name")%>" != "null")
                            $("[name='name'").val("<%=request.getParameter("name")%>");
                          else
                            $("[name='name'").val("GUEST");
                          if ("<%=request.getParameter("phone")%>" != "null")
                            $("[name='phone'").val("<%=request.getParameter("phone")%>");
                          else
                            $("[name='phone'").val("");
                        });
                        $("s1").click(function(){
                          alert("<%= request.getParameter("date")%>");
                        });
                        $("#s1").click(function(){
                          alert("You picked Session 1 on " + "<%= request.getParameter("date")%>");
                          $("[name='ss'").val("1");
                          $("[name='ps'").val("<%= request.getParameter("passenger")%>");
                          $("[name='session'").val("1");
                          $("[name='passenger'").val("<%= request.getParameter("passenger")%>");
                          $("[name='pn'").val("<%= request.getParameter("phone")%>");
                          
                        });
                        $("#s2").click(function(){
                          alert("You picked Session 2 on " + "<%= request.getParameter("date")%>");
                          $("[name='ss'").val("2");
                          $("[name='ps'").val("<%= request.getParameter("passenger")%>");
                          $("[name='session'").val("2");
                          $("[name='passenger'").val("<%= request.getParameter("passenger")%>");
                          $("[name='pn'").val("<%= request.getParameter("phone")%>");
                        });
                        $("#s3").click(function(){
                          alert("You picked Session 3 on " + "<%= request.getParameter("date")%>");
                          $("[name='ss'").val("3");
                          $("[name='ps'").val("<%= request.getParameter("passenger")%>");
                          $("[name='session'").val("3");
                          $("[name='passenger'").val("<%= request.getParameter("passenger")%>");
                          $("[name='pn'").val("<%= request.getParameter("phone")%>");
                        });
                      });
                        $(function() {
                                if ("<%=request.getParameter("phone")%>" != "0")
                                    $("[name='phone'").val("<%=request.getParameter("phone")%>");
                                else
                                    $("[name='phone'").val("");
                                $('#hotelCarTabs a').click(function (e) {
                                  e.preventDefault();
                                  $(this).tab('show');
                                });
        
                        $('.date').datetimepicker({
                        format: 'DD/MM/YYYY'
                    });
                    $('.date-time').datetimepicker();
        
                                // https://css-tricks.com/snippets/jquery/smooth-scrolling/
                                $('a[href*=#]:not([href=#])').click(function() {
                                    if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') && location.hostname === this.hostname) {
                                      var target = $(this.hash);
                                      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                                      if (target.length) {
                                        $('html,body').animate({
                                          scrollTop: target.offset().top
                                        }, 1000);
                                        return false;
                                      }
                                    }
                                });
                        });
                        
                        // Load Flexslider when everything is loaded.
                        $(window).load(function() {	  		
                                // Vimeo API nonsense
        
        /*
                                  var player = document.getElementById('player_1');
                                  $f(player).addEvent('ready', ready);
                                 
                                  function addEvent(element, eventName, callback) {
                                    if (element.addEventListener) {
                                      element.addEventListener(eventName, callback, false)
                                    } else {
                                      element.attachEvent(eventName, callback, false);
                                    }
                                  }
                                 
                                  function ready(player_id) {
                                    var froogaloop = $f(player_id);
                                    froogaloop.addEvent('play', function(data) {
                                      $('.flexslider').flexslider("pause");
                                    });
                                    froogaloop.addEvent('pause', function(data) {
                                      $('.flexslider').flexslider("play");
                                    });
                                  }
        */
        
                                 
                                 
                                  // Call fitVid before FlexSlider initializes, so the proper initial height can be retrieved.
        /*
        
                                  $(".flexslider")
                                    .fitVids()
                                    .flexslider({
                                      animation: "slide",
                                      useCSS: false,
                                      animationLoop: false,
                                      smoothHeight: true,
                                      controlNav: false,
                                      before: function(slider){
                                        $f(player).api('pause');
                                      }
                                  });
        */
        
        
                                  
        
        //	For images only
                            $('.flexslider').flexslider({
                                    controlNav: false
                            });
        
        
                        });
                        
                </script>-->
        <!--        <script type="text/javascript">
                    document.getElementById('datepicker2').value = "22/02/2009";
                    //document.getElementById("datepicker1").placeholder = "TEST1";
                    //document.getElementById("datepicker1").innerHTML = "TEST2";
                    document.getElementById("date1").innerHTML = "TEST3";
                </script>-->
    </body>
</html>