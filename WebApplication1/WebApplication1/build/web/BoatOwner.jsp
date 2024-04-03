<%-- 
    Document   : ClaimBoatServlet
    Created on : 2 Dec 2022, 4:30:17 pm
    Author     : Benjimal
--%>

<%@page import="com.dao.StaffDao"%>
<%@page import="model.Boat"%>
<%@page import="com.dao.ReservationDao"%>
<%@page import="com.dao.CustomerDao"%>
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
							<li><form id="editForm" action="EditProfileServlet" method="post">
                                                                <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                                                <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                                                <input id="editButton" hidden type="submit" name="id" value="My Profile"/>
                                                                <a href="#"  onclick="document.getElementById('editForm').submit()" >My Profile</a>
                                                         
                                                            </form></li>
							<li><form id="editForm2" action="EditProfileServlet" method="post">
                                                                <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                                                <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                                                <input hidden name="action" value="boat"/>
                                                                <input id="editButton" hidden type="submit" name="id" value="My Profile"/>
                                                                <a href="#"  onclick="document.getElementById('editForm2').submit()" >Add New Boat</a>
                                                         
                                                            </form></li>
                                                            <!--<li> <a href="addNewBoat.jsp">Add New Boat</a></li>-->
<% 
if (request.getAttribute("name") != null) 
{
%>
    <li><a href="index.jsp">Welcome, BOAT OWNER 
<%=
    request.getAttribute("name")
%>! (LOG OUT)</a></li>
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

.button1 {width: 250px;}
.button2 {width: 50%;}
.button3 {width: 100%;}
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
                          <h2> LIST OF CONFIRMED RESERVATION (BOAT) </h2> 
                          <hr />
                            
                                  
				</div>
            
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
                                            <th>PHONE</th>
                                            <th>DATE</th>
                                            <th>SESSION</th>
                                            <th>PASSENGER</th>
                                            <th>STATUS</th>
                                            <th>NAME</th>
                                            <th>BOAT STATUS</th>
                                            <th>BOAT OWNER</th>
                                            <th>CLAIM</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<% List<reservation> ls = (List<reservation>)request.getAttribute("s");
//    boolean avail = true;
//    String[] status = {"AVAILABLE", "AVAILABLE", "AVAILABLE"};
//    String st = "";
//    int ss = Integer.parseInt(request.getParameter("session"));
    for(reservation s : ls)
    {
        if(!"RESERVED".equalsIgnoreCase(s.getStatus()))
            continue;
            
        out.println("<form action=\"ClaimBoatServlet\" method=\"post\">");
        out.println("<input name='staffName' hidden readonly value='" + request.getAttribute("name") + "'/>");
        out.println("<input name='staffID' hidden readonly value='" + request.getAttribute("id") + "'/>");
        out.println("<input name='id' hidden readonly value='" + s.getId() + "'/>");
        out.println("<input name='phone' hidden readonly value='" + s.getPhoneNo() + "'/>");
        out.println("<input name='date' hidden readonly value='" + s.getDate() + "'/>");
        out.println("<input name='session' hidden readonly value='" + s.getSession() + "'/>");
        out.println("<input name='passenger' hidden readonly value='" + s.getNumOfPassenger() + "'/>");
        out.println("<input name='status' hidden readonly value='" + s.getStatus() + "'/>");
        out.println("<tr><td><input hidden name='reservationID' readonly value='" + s.getId() + "'/>" + s.getId() + "</td>");
        out.println("<td> " + s.getPhoneNo() + "</td>");
        out.println("<td> " + s.getDate() + "</td>");
        out.println("<td> " + s.getSession() + "</td>");
        out.println("<td> " + s.getNumOfPassenger() + "</td>");
        out.println("<td> " + s.getStatus() + "</td>");
        
        Customer c = CustomerDao.getCustomerById(s.getPhoneNo());
        
        if(c.getName() != null)
        {
            out.println("<td> " + c.getName() + "</td>");
            out.println("<input name='rName' hidden readonly value='" + c.getName() + "'/>");
            
        }
        else
        {
            out.println("<td> GUEST </td>");
            out.println("<input name='rName' hidden readonly value='GUEST'/>");
        }
        
        Staff r = ReservationDao.getReservationBoat(s.getId());
        
        if(r != null)
        {
            out.println("<td> " + "CLAIMED" + "</td>");
            out.println("<td> " + r.getName() + "</td>");
        
            out.println("<td><button disabled type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s" + s.getId() + "\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> CLAIM</button></td></tr>");
        
//            out.println("<input name='rName' hidden readonly value='" + c.getName() + "'/>");
            
        }
        else
        {
            out.println("<td> " + "AVAILABLE" + "</td>");
            out.println("<td> TBC </td>");
        
            out.println("<td><button type=\"submit\" class=\"btn btn-primary btn-xs\" id=\"s" + s.getId() + "\" method=\"POST\" action=\"reserveServlet\"><i class=\"fa fa-pencil\"></i> CLAIM</button></td></tr>");
        
//            out.println("<input name='rName' hidden readonly value='GUEST'/>");
        }
        out.println("</form>");
    }
%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                                     
                                    
                                    
                                    <div>
                                        
                                          <div class="alert alert-info text-center">
                          <h2> MY BOATS </h2> 
                          <hr />
                            
                                  
				</div>
                  
                            <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            
                                            <th>ID</th>
                                            <th>BOAT BRAND</th>
                                            <th>NO. PLATE</th>
                                            <th>CAPACITY</th>
                                            <th>COLOR</th>
                                            <th>EDIT</th>
                                            <th>DELETE</th>
                                        </tr>
                                    </thead>
                                    <tbody>
<%
    List<Boat> allB = StaffDao.getAllBoats();
    
    for(Boat b : allB)
    {
        if(b.getBoatOwner() == Integer.parseInt(request.getAttribute("id").toString()))
        {
%>
                                <tr>
                                    <td><%=b.getId()%></td>
                                    <td><%=b.getBrand()%></td>
                                    <td><%=b.getPlate()%></td>
                                    <td><%=b.getCapacity()%></td>
                                    <td style="background-color:<%=b.getColor()%>;"><%=b.getColor()%></td>
                                     <td>
                                         <form action="ClaimBoatServlet" method="post">
                                         <input name='action' hidden readonly value='edit'/>
                                         <input name='boatID' hidden readonly value='<%=b.getId()%>'/>
                                         <input name='boatOwnerID' hidden readonly value='<%=b.getBoatOwner()%>'/>
                                         <button type="submit" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i> EDIT</button>
                                         </form>
                                     </td>
                                     <td>
                                         <form action="ClaimBoatServlet" method="post">
                                         <input name='action' hidden readonly value='delete'/>
                                         <input name='boatID' hidden readonly value='<%=b.getId()%>'/>
                                         <input name='boatOwnerID' hidden readonly value='<%=b.getBoatOwner()%>'/>
                                         <button class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> DELETE</button>
                                         </form>
                                     </td>
                                </tr>
<%
        }
    }
%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                                 
                            </div>
                        </div>
	</section>
        
        
	
	<!-- white bg -->
	
	<footer class="tm-black-bg">
		<div class="container">
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2022 Salang Indah Resort 
                
                | Designed by templatemo</p>
			</div>
		</div>		
	</footer>
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
        
        
 </body>
 </html>
