<%-- 
    Document   : index
    Created on : Nov 29, 2022, 11:55:12 AM
    Author     : Benjimal
--%>

<%@page import="com.dao.StaffDao"%>
<%@page import="model.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="model.Admin"%>
<%@page import="model.Staff"%>
<%@page import="com.dao.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                                <% if (request.getAttribute("role") != null)
                                        if (request.getAttribute("role").toString().equalsIgnoreCase("Customer")) {%>
                            <li>
                                <form id="editForm" action="CheckReservationServlet" method="post">
                                    <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                    <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                                    <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                    <input hidden name="phone" value="<%=request.getAttribute("phone")%>"/>
                                    <input hidden name="action" value="check"/>
                                    <!--<input id="editButton" hidden type="submit" name="id" value="My Profile"/>-->
                                    <a href="#"  onclick="document.getElementById('editForm').submit()">My Reservation</a>

                                </form>
                            </li>
                            <li>
                                <form id="editForm2" action="EditProfileServlet" method="post">
                                    <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                    <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                    <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                                    <input hidden name="phone" value="<%=request.getAttribute("phone")%>"/>
                                    <input hidden name="action" value="profile"/>
                                    <input id="editButton" hidden type="submit" name="id" value="My Profile"/>
                                    <a href="#"  onclick="document.getElementById('editForm2').submit()" >My Profile</a>

                                </form>
                            </li>
                            <% } else { %>

                            <%}%>
                            <% if (request.getAttribute("name") != null) {%>
                            <li><a href="index.jsp">Welcome 
                                    <%
                                        Customer c = (Customer) (request.getAttribute("c"));
                                        Staff s = (Staff) (request.getAttribute("s"));
                                        Admin a = (Admin) (request.getAttribute("a"));
                                        if (c != null) {
                                            out.print(c.getName());
                                        } else if (s != null) {
                                            out.print(s.getName());
                                        } else if (a != null) {
                                            out.print(a.getName());
                                        }

                                    %>! (LOG OUT)
                                </a></li>
                                <% } else {%>
                            <li>
                                <form id="editForm" action="CheckReservationServlet" method="post">
                                    <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                    <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                                    <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                    <input hidden name="phone" value="<%=request.getAttribute("phone")%>"/>
                                    <input hidden name="action" value="check"/>
                                    <!--<input id="editButton" hidden type="submit" name="id" value="My Profile"/>-->
                                    <a href="checkReserveGuest.jsp" ">Check My Reservation</a>

                                </form>
                            </li>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="signUp.jsp">Sign Up</a></li>

                            <%}%>

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
                        <a href="ContactUs.jsp" class="tm-banner-link">Click For Information</a>	
                    </div>
                    <img src="img/tryBanner1.jpg" alt="Image" />	
                </li>

            </ul>
        </div>	
    </section>

    <!-- gray bg -->	
    <section class="container tm-home-section-1" id="more">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <!-- Nav tabs -->
                <div class="tm-home-box-1">
                    <ul class="nav nav-tabs tm-white-bg" role="tablist" id="hotelCarTabs">
                        <li role="presentation" class="active">
                            <a href="#hotel" aria-controls="hotel" role="tab" data-toggle="tab">Snorkeling Booking </a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active tm-white-bg" id="hotel">
                            <div class="tm-search-box effect2">
                                <form action="checkDateServlet" method="post" class="hotel-se are arch-form">
                                    <input type="hidden" name="name" value=""/>
                                    <input type="hidden" name="phone" value=""/>
                                    <div class="tm-form-inner">
                                        <div class="form-group">
                                            <select class="form-control" required name="session">
                                                <option value="">-- Select Session -- </option>
                                                <option value="1">Session 1(8 a.m - 10 a.m)</option>
                                                <option value="2">Session 2(11 a.m - 1 p.m)</option>
                                                <option value="3">Session 3 (3 p.m - 5 p.m)</option>
                                            </select> 
                                        </div>
                                        <div class="form-group">
                                            <div class='input-group date' id='datetimepicker1'>
                                                <input type='text' class="form-control" required name="date" placeholder="Booking Date" />
                                                <span class="input-group-addon">
                                                    <span class="fa fa-calendar"></span>
                                                </span>
                                            </div>
                                            <div id="date-error" style="color: red; display: none;">Please select a date from today onwards.</div>
                                        </div>

                                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

                                        <script>
                                        $(function () {
                                            // Set the minimum selectable date to today
                                            var minDate = moment().startOf('day');

                                            // Initialize the DateTimePicker with the minimum date
                                            $('#datetimepicker1').datetimepicker({
                                                format: 'YYYY-MM-DD'
                                            }).on('dp.change', function (e) {
                                                var selectedDate = e.date;

                                                // Check if the selected date is before the minimum date
                                                if (selectedDate.isBefore(minDate, 'day')) {
                                                    // Show the error message
                                                    $('#date-error').show();
                                                } else {
                                                    // Hide the error message
                                                    $('#date-error').hide();
                                                }
                                            });
                                        });
                                        </script>


                                        <div class="form-group margin-bottom-0">
                                            <select class="form-control" required name="passenger">
                                                <option value="">-- Passenger -- </option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                            </select> 
                                        </div>
                                    </div>							
                                    <div class="form-group tm-yellow-gradient-bg text-center">

                                        <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                                        <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                                        <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                                        <input hidden name="phone" value="<%=request.getAttribute("phone")%>"/>
                                        <input hidden name="email" value="<%=request.getAttribute("email")%>"/>
                                        <button type="submit" id="s1" name="submit" class="tm-yellow-btn">Check Now</button>
                                    </div>

                                </form>
                            </div>
                        </div>

                    </div>
                </div>								
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-center">
                    <img src="img/salangIndah1.jpg" alt="image" class="img-responsive">
                    <a href="#">
                        <div class="tm-green-gradient-bg tm-city-price-container">
                            <span>Nature</span>

                        </div>	
                    </a>			
                </div>				
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="tm-home-box-1 tm-home-box-1-2 tm-home-box-1-right">
                    <img src="img/salangIndah2.3.jpg" alt="image" class="img-responsive">
                    <a href="#">
                        <div class="tm-red-gradient-bg tm-city-price-container">
                            <span>Magnificent</span>

                        </div>	
                    </a>					
                </div>				
            </div>
        </div>

        <div class="section-margin-top">
            <div class="row">				
                <div class="tm-section-header">
                    <div class="col-lg-3 col-md-3 col-sm-3"><hr></div>
                    <div class="col-lg-6 col-md-6 col-sm-6"><h2 class="tm-section-title">Resort gallery</h2></div>
                    <div class="col-lg-3 col-md-3 col-sm-3"><hr></div>	
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
                    <div class="tm-home-box-2">						
                        <img src="img/salangIndah3.1.jpg" alt="image" class="img-responsive">
                        <h3>Exquisite layout</h3>
                        <p class="tm-date">28 March 2016</p>
                        <div class="tm-home-box-2-container">
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                            <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
                    <div class="tm-home-box-2">						
                        <img src="img/salangIndah4.jpg" alt="image" class="img-responsive">
                        <h3>Breathtaking scenery</h3>
                        <p class="tm-date">26 March 2016</p>
                        <div class="tm-home-box-2-container">
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                            <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
                    <div class="tm-home-box-2">						
                        <img src="img/salangIndah5.1.jpg" alt="image" class="img-responsive">
                        <h3>Escaping reality</h3>
                        <p class="tm-date">24 March 2016</p>
                        <div class="tm-home-box-2-container">
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                            <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-xxs-12">
                    <div class="tm-home-box-2 tm-home-box-2-right">						
                        <img src="img/salangIndah6.1.jpg" alt="image" class="img-responsive">
                        <h3>Luxurious stay</h3>
                        <p class="tm-date">22 March 2016</p>
                        <div class="tm-home-box-2-container">
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                            <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description">Travel</span></a>
                            <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">

                </div>
            </div>			
        </div>
    </section>		

                                        
                                        
      <div class="row">
                <div class="tm-section-header section-margin-top">
                    <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
                    <div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Snorkeling Session Price</h2></div>
                    <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
                </div>
                <section class="tm-white-bg section-padding-bottom">
            <div class="container">
               
                <div class="row">
                    <!-- Testimonial -->
                    <div class="col-lg-12">
                        <div class="tm-what-we-do-right">
                            <div class="tm-about-box-2 margin-bottom-30">
                                <img src="img/MonkeyBay.jpeg" alt="image" class="tm-about-box-2-img">
                                <div class="tm-about-box-2-text">
                                    <h3 class="tm-about-box-2-title"> Session 1 RM150 (8 a.m - 10 a.m) </h3>
                                    <p class="tm-about-box-2-description gray-text">Get experience to snorkeling at Monkey Bay and Shark Point checkpoint. Snorkeling gear is included(mask, fins, and snorkel/mouthpiece) </p>
                                    <a href="index.jsp" class="tm-about-box-2-footer">Book Now</a>
                                </div>		                
                            </div>
                            <div class="tm-about-box-2 margin-bottom-30">
                                <img src="img/RenggisIsland.jpeg" alt="image" class="tm-about-box-2-img">
                                <div class="tm-about-box-2-text">
                                    <h3 class="tm-about-box-2-title"> Session 2 RM150 (11 a.m - 1 p.m)</h3>
                                    <p class="tm-about-box-2-description gray-text">Get experience to snorkeling at Salang village and Marine Park checkpoint. Snorkeling gear is included(mask, fins, and snorkel/mouthpiece)</p>
                                    <a href="index.jsp" class="tm-about-box-2-footer">Book Now</a>	
                                </div>		                
                            </div>
                            <div class="tm-about-box-2">
                                <img src="img/SalangVillage.jpeg" alt="image" class="tm-about-box-2-img">
                                <div class="tm-about-box-2-text">
                                    <h3 class="tm-about-box-2-title"> Session 3 RM150 (3 p.m - 5 p.m)</h3>
                                    <p class="tm-about-box-2-description gray-text">Get experience to snorkeling at Monkey Bay and Renggis island checkpoint. Snorkeling gear is included(mask, fins, and snorkel/mouthpiece)</p>
                                    <a href="index.jsp" class="tm-about-box-2-footer">Book Now</a>	
                                </div>		                
                            </div>
                        </div>
                        <div class="tm-testimonials-box">
                            <h3 class="tm-testimonials-title">Inquiries</h3>
                            <div class="tm-testimonials-content">
                                <div class="tm-testimonial">
                                    <p>+60163796385</p>
                                    <strong class="text-uppercase">Whatsapp</strong>	
                                </div>
                                <div class="tm-testimonial">
                                    <p>SalangIndahResort@gmail.com</p>
                                    <strong class="text-uppercase">Email</strong>		
                                </div>
                                <div class="tm-testimonial">
                                    <p>Please do not hesitate to contact us for any support you need in planning for your holiday in Tioman<p>
                                        <strong class="text-uppercase"></strong>
                                </div>                	
                            </div>
                        </div>	
                    </div>							
                </div>			
            </div>
        </section>                                    
                                        
                                        
                             
                                        
                                        
    <!-- white bg -->
    <section class="tm-white-bg section-padding-bottom">
        <div class="container">

            <div class="row">
                <div class="tm-section-header section-margin-top">
                    <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
                    <div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Give Us Feedback</h2></div>
                    <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
                </div>
                <div class="col-lg-12">


                    <form action="commentServlet" method="post">	
                        <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                        <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                        <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                        <input hidden name="phone" value="<%=request.getAttribute("phone")%>"/>
                        <div class="form-group margin-bottom-0">
                            <% if ((Customer) request.getAttribute("c") != null) {
                            %>                                              
                            <textarea name="comment" rows="4" cols="153"> </textarea>
                        </div>

                        <div class="form-group text-center">

                            <button type="submit" id="feedback" name="submit" class="tm-yellow-btn">Send</button>
                            <% } else {
                            %>  
                            <textarea readonly name="comment" rows="4" cols="153"> </textarea>
                        </div>

                        <div class="form-group text-center">

                            <button disabled type="submit" id="feedback" name="submit" class="tm-yellow-btn">Customer ONLY</button>
                            <% }
                            %>
                        </div>  
                    </form>



                    <div class="tm-section-header section-margin-top">
                        <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
                        <div class="col-lg-4 col-md-6 col-sm-6"><p class="tm-section-title">List of Feedback</p></div>
                        <div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
                    </div>

                    <%
                        ArrayList<Comment> allC = CustomerDao.getAllComments();
                        ArrayList<Comment> allR = StaffDao.getAllReplies();

                        for (Comment cm : allC) {
                            Customer ct = CustomerDao.getCustomerByIdd(String.valueOf(cm.getC_id()));
                    %>
                    <hr>
                    <div class="card-body">
                        <div class="d-flex flex-start align-items-center">
                            <div>
                                <h4 class="fw-bold text-primary mb-1"><%=ct.getName()%></h4>
                                <p class="text-muted mb-0">
                                    <%=cm.getTimestamp()%>
                                </p>
                            </div>
                        </div>
                        <div>
                            <div  class="form-control" style="background-color: #e5e5e5;height:100px" >

                                <p class="mt-3 mb-4 pb-2" style="font-size:20px">
                                    <%=cm.getComment()%>
                                </p>  
                            </div>
                            <%
                                for (Comment cr : allR) {
                                    if (cr.getC_id() == cm.getId()) {
                                        if (!cr.getComment().trim().isEmpty()) {
                            %>
                            <h4 class="fw-bold text-primary mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin</h4>
                            <p class="text-muted mb-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%=cr.getTimestamp()%>
                            </p>
                            <div   class="form-control" style="background-color: #e5e5e5;height:100px;width:1050px;margin:0 auto;" >

                                <p class="mt-3 mb-4 pb-2" style="font-size:20px">
                                    <%=cr.getComment()%>
                                </p>  

                                <%
                                            }
                                            break;
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <%
                            if (request.getAttribute("c") != null) {
                                Customer c = (Customer) request.getAttribute("c");
                                if (c.getName().equalsIgnoreCase(ct.getName())) {
                        %>

                        <form action="commentServlet" method="post">	
                            <input hidden name="role" value="<%=request.getAttribute("role")%>"/>
                            <input hidden name="id" value="<%=request.getAttribute("id")%>"/>
                            <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                            <input hidden name="phone" value="<%=request.getAttribute("phone")%>"/>
                            <input hidden name="cID" value="<%=cm.getId()%>"/>
                            <input hidden name="action" value="delete"/>
                            <br><button type="submit" id="feedback" name="submit" class="btn btn-danger">Delete</button><br>
                        </form>
                        <%
                                }
                            }
                        %>


                        <% if ((Admin) request.getAttribute("a") != null) {
                        %> 
                        <div class="card-footer py-3 border-0" >
                            <div>
                                <textarea class="form-control" style="background-color: #e5e5e5;" rows="4" colspan="10"></textarea>
                                <label class="form-label" >Message</label>
                            </div>

                            <div class="float-end mt-2 pt-1">
                                <button type="button" class="btn btn-primary btn-sm">Reply</button>
                            </div>
                        </div>
                        <hr>
                        <%
                                }
                            }
                        %>

                    </div>

                </div>








            </div>


          
<!--                <div class="col-lg-6">
                    <div class="tm-home-box-3">
                        <div class="tm-home-box-3-img-container">
                            <img src="img/snorkellin1.jpeg" alt="image" class="img-responsive">	
                        </div>						
                        <div class="tm-home-box-3-info">
                            <p class="tm-home-box-3-description">Enjoyable trip </p>
                            <div class="tm-home-box-2-container">
                                <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                                <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
                                <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                            </div>
                        </div>						
                    </div>					
                </div>
                <div class="col-lg-6">
                    <div class="tm-home-box-3">
                        <div class="tm-home-box-3-img-container">
                            <img src="img/snorkellin2.jpeg" alt="image" class="img-responsive">	
                        </div>						
                        <div class="tm-home-box-3-info">
                            <p class="tm-home-box-3-description">Unforgettable Experiences</p>
                            <div class="tm-home-box-2-container">
                                <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                                <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
                                <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                            </div>
                        </div>						
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="tm-home-box-3">
                        <div class="tm-home-box-3-img-container">
                            <img src="img/snorkellin3.jpeg" alt="image" class="img-responsive">	
                        </div>						
                        <div class="tm-home-box-3-info">
                            <p class="tm-home-box-3-description">Touch the nature</p>
                            <div class="tm-home-box-2-container">
                                <a href="#" class="tm-home-box-2-link"><i class="fa fa-heart tm-home-box-2-icon border-right"></i></a>
                                <a href="#" class="tm-home-box-2-link"><span class="tm-home-box-2-description box-3">Travel</span></a>
                                <a href="#" class="tm-home-box-2-link"><i class="fa fa-edit tm-home-box-2-icon border-left"></i></a>
                            </div>
                        </div>						
                    </div>
                </div>-->
             
            </div>		





        </div>
    </section>
    <footer class="tm-black-bg">
        <div class="container">
            <div class="row">
                <p class="tm-copyright-text">Copyright &copy; 2023 Salang Indah Resort 

                </p>
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
                                        // HTML document is loaded. DOM is ready.
                                        $("#s1").click(function () {
                                            alert("Checking your date...");
                                            if ("<%=request.getAttribute("name")%>" != "null")
                                                $("[name='name'").val("<%=request.getAttribute("name")%>");
                                            else
                                                $("[name='name'").val("GUEST");
                                            if ("<%=request.getAttribute("phone")%>" != "null")
                                                $("[name='phone'").val("<%=request.getAttribute("phone")%>");
                                            else
                                                $("[name='phone'").val("0");
                                        });
                                        $(function () {

                                            $('#hotelCarTabs a').click(function (e) {
                                                e.preventDefault();
                                                $(this).tab('show');
                                            });

                                            $('.date').datetimepicker({
                                                format: 'DD/MM/YYYY'
                                            });
                                            $('.date-time').datetimepicker();

                                            // https://css-tricks.com/snippets/jquery/smooth-scrolling/
                                            $('a[href*=#]:not([href=#])').click(function () {
                                                if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') && location.hostname === this.hostname) {
                                                    var target = $(this.hash);
                                                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
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
                                        $(window).load(function () {
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
    </script>
</body>
