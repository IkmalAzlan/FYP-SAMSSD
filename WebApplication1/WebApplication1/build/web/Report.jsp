<%-- 
    Document   : Admin
    Created on : Nov 29, 2022, 11:55:12 AM
    Author     : Benjimal
--%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="com.dao.ReservationDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.StaffDao"%>
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
                                                        <li>
                                                            <form id="editForm" action="loginCustomerServlet1" method="post">
                                                                <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                                                <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                                                <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                                                                <input hidden name="action" value="admin"/>
                                                                <input id="editButton" hidden type="submit" name="id" value="Report"/>
                                                                <a href="#"  onclick="document.getElementById('editForm').submit()" >Admin</a>
                                                            
                                                            </form>
                                                        </li>
<%          
if (request.getAttribute("name") != null) 
{
%>
    <li><a href="index.jsp">Welcome, ADMIN 
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
                         
                            
				<div>
					
                                          <div class="alert alert-info text-center">
                          <h2> TOTAL SALES BY MONTH </h2> 
                          <%
                              List<reservation> r = ReservationDao.getAllReservations();
                              
                              String months[] = {"JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DISEMBER"};
                          
                              float totalY = 0;
                              
                              List<Staff> s = StaffDao.getAllStaffs();
                              
                              int totalStaff = 0;
                              int totalBO = 0;
                              
                              for(Staff ss : s)
                              {
                                if(ss.getRole().equalsIgnoreCase("Staff"))
                                    totalStaff++;
                              }
                              
                              totalBO = s.size()-totalStaff;
                              
                              List<Customer> c = CustomerDao.getAllCustomers();
                              
                              Set<String> uniquePhone = new HashSet<>();
                              
                              for(reservation rr : r)
                              {
                                    uniquePhone.add(rr.getPhoneNo());
                              }
                              
                              int totalCustomer = c.size();
                              int totalGuests = uniquePhone.size()-totalCustomer;

                              %>
                          <hr />
                            
                                  
				</div>
                            
            
                    
                            <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            
                                            <th>MONTH</th>
                                            <th>TOTAL RESERVATIONS</th>
                                            <th>TOTAL SALES</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% 
                                        for(int i = 0; i < 12; i++)
                                        { 
                                            int totalR = 0;
                                            float totalS = 0;
                                            for(reservation rr : r)
                                            {
                                                if(Integer.parseInt(rr.getDate().substring(3, 5)) != (i+1))
                                                {
                                                    continue;
                                                }
                                                else
                                                {
                                                    if(rr.getStatus().equalsIgnoreCase("RESERVED"))
                                                    {
                                                        totalR++;
                                                        totalS += 150 * Integer.parseInt(rr.getNumOfPassenger());
                                                    }
                                                }
                                            }
                                            
                                            totalY += totalS;
                                        %>
                                        <tr>
                                            <td><%=months[i]%></td>
                                            <td><%=totalR%></td>
                                            <td><%=String.format("RM%.2f", totalS)%></td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
  
                     <!-- End  Kitchen Sink -->
                </div>
                            
                            
                            
                            <div>
					
                                          <div class="alert alert-info text-center">
                          <h2> TOTAL SALES BY YEAR </h2> 
                          <hr />
                            
                                  
				</div>
                            
            
                    
                            <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            
                                            <!--<th>ID</th>-->
                                            <th>YEAR</th>
                                            <th>AMOUNT</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>2022</td>

                                            <td><%=String.format("RM%.2f", 0.0)%></td>
                                        </tr>
                                        <tr>
                                            <td>2023</td>

                                            <td><%=String.format("RM%.2f", totalY)%></td>
                                        </tr>
                                        <tr>
                                            <td>2024</td>

                                            <td><%=String.format("RM%.2f", 0.0)%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
  
                     <!-- End  Kitchen Sink -->
                </div>

<div>
					
                                        
                                          <div class="alert alert-info text-center">
                          <h2> TOTAL STAFF </h2> 
                          <hr />
                            
                                  
				</div>
                            
        
                            <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            
                                            <th>ROLE</th>
                                             <th>TOTAL NUMBER</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                Admin
                                            </td>
                                            <td>
                                                1
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Staff
                                            </td>
                                            <td>
                                                <%=totalStaff%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Boat Owner
                                            </td>
                                            <td>
                                                <%=totalBO%>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

               

                     <!-- End  Kitchen Sink -->
                </div>
                            
                            
                            
                            
                            <div>
					
                                        
                                          <div class="alert alert-info text-center">
                          <h2> TOTAL CUSTOMER </h2> 
                          <hr />
                            
                                  
				</div>
                            
<%
  // Step 1: Retrieve reservation data from the database
  // ...

  // Assuming reservationData is a list containing reservation objects

  // Step 3: Calculate the total for each session
  int session1Total = 0;
  int session2Total = 0;
  int session3Total = 0;

  for (reservation reservation : r) {
    // Step 2: Iterate over reservation data in JSP
    String reservationSessionString = reservation.getSession();
    int session1 = Integer.parseInt(reservationSessionString);
    String paymentStatus = reservation.getStatus();

    // Check the payment status before incrementing the respective total based on the session
    if (paymentStatus.equals("RESERVED")) {
      switch (session1) {
        case 1:
          session1Total++;
          break;
        case 2:
          session2Total++;
          break;
        case 3:
          session3Total++;
          break;
        // Add more cases if you have additional session options
      }
    }
  }
%>
                            <!--   Kitchen Sink -->
                    <div class="panel panel-default">
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                                
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            
                                             <th>TYPE</th>
                                             <th>TOTAL NUMBER</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <td>
                                                Registered Customer
                                            </td>
                                            <td>
                                                <%=totalCustomer%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Guests
                                            </td>
                                            <td>
                                                <%=totalGuests%>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td>
                                                Session 1
                                            </td>
                                            <td>
                                                <%= session1Total %>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td>
                                                Session 2
                                            </td>
                                            <td>
                                                <%= session2Total %>
                                            </td>
                                        </tr>
                                          <tr>
                                            <td>
                                                Session 3
                                            </td>
                                            <td>
                                                <%= session3Total %>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

               

                     <!-- End  Kitchen Sink -->
                </div>
                            	
						
		</div>
                    </div>
	</section>
      



	
	<!-- white bg -->
	
	<footer class="tm-black-bg">
		<div class="container">
			<div class="row">
				<p class="tm-copyright-text">Copyright &copy; 2022 Salang Indah Resort 
                
                | Designed by ikmal</p>
			</div>
		</div>		
	</footer>
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
  	<script type="text/javascript" src="js/moment.js"></script>							<!-- moment.js -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>	<!-- bootstrap date time picker js, http://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>

   	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
        
        
        <script>
            $("[name='idtd'").click(function(){
                  alert("VALUE OF THE TD IS : " + $("[name='idtd'").text());
            });
        </script>

 </body>
 </html>