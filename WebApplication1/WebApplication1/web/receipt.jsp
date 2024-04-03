<%-- 
    Document   : checkReserveGuest
    Created on : 2 Dec 2022, 4:30:06 pm
    Author     : Benjimal
--%>

<%@page import="com.util.DBConnection"%>
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


        <%
            if (request.getAttribute("name") != null) {
        %>


        <%
            }

            reservation r = (reservation) request.getAttribute("R");
        %>





        <style>
            .print{
                margin:auto;
                max-width:800px;
            }

            .invoice-box{

                max-width:800px;
                margin:auto;
                padding:30px;
                border:1px solid #eee;
                box-shadow:0 0 10px rgba(0, 0, 0, .15);
                font-size:16px;
                line-height:24px;
                font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
                color:#555;
            }

            .invoice-box table{
                width:100%;
                line-height:inherit;
                text-align:left;
            }

            .invoice-box table td{
                padding:5px;
                vertical-align:top;
            }

            .invoice-box table tr td:nth-child(2){
                text-align:right;
            }

            .invoice-box table tr.top table td{
                padding-bottom:20px;
            }

            .invoice-box table tr.top table td.title{
                font-size:45px;
                line-height:45px;
                color:#333;
            }

            .invoice-box table tr.information table td{
                padding-bottom:40px;
            }

            .invoice-box table tr.heading td{
                background:#eee;
                border-bottom:1px solid #ddd;
                font-weight:bold;
            }

            .invoice-box table tr.details td{
                padding-bottom:20px;
            }

            .invoice-box table tr.item td{
                border-bottom:1px solid #eee;
            }

            .invoice-box table tr.item.last td{
                border-bottom:none;
            }

            .invoice-box table tr.total td:nth-child(2){
                border-top:2px solid #eee;
                font-weight:bold;
            }

            @media only screen and (max-width: 600px) {
                .invoice-box table tr.top table td{
                    width:100%;
                    display:block;
                    text-align:center;
                }

                .invoice-box table tr.information table td{
                    width:100%;
                    display:block;
                    text-align:center;
                }
            }
        </style>
        <!-- gray bg -->	
        <%
            String id = (String) request.getAttribute("id");
            boolean guestStatus = ReservationDao.checkAvailability(Integer.parseInt(id)) == 1 ? true : false;
            boolean customerStatus = ReservationDao.checkCustomerReservationAvailability(Integer.parseInt(id)) == 1 ? true : false;
            String guestName = "";
            String email = "";
            String phone = "";
            String emergencyPhone = "";

            if (guestStatus) {
                try {

                    Connection connection = DBConnection.getConnection();
                    //con = myConnection;
                    PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM guest_reservation WHERE reservationId='" + id + "'");
                    //Parameters start with 1
                    ResultSet rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        guestName = rs.getString(3);
                        email = rs.getString(4);
                        phone = rs.getString(5);
                        emergencyPhone = rs.getString(6);
                    }

                } catch (SQLException e) {

                }
            } else if (customerStatus) {
                try {

                    Connection connection = DBConnection.getConnection();
                    //con = myConnection;
                    PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customer_reservation WHERE reservationId='" + id + "'");
                    //Parameters start with 1
                    ResultSet rs = preparedStatement.executeQuery();

                    if (rs.next()) {
                        guestName = rs.getString(3);
                        email = rs.getString(4);
                        phone = rs.getString(5);
                        emergencyPhone = rs.getString(6);
                    }

                } catch (SQLException e) {

                }
            }
        %>
        <section class="tm-white-bg section-padding-bottom">


            <body>
                <div class="invoice-box">
                    <table cellpadding="0" cellspacing="0">
                        <tr class="top">
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td >
                                            <strong> Receipt</strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr class="information">
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            Name : 
                                            <%
                                                if(guestStatus || customerStatus) {
                                                    out.print(guestName + "<br>");
                                                } else if (request.getParameter("rName") != null) {
                                                    out.print(request.getParameter("rName") + "<br>");
                                                } else {
                                                out.print("Unavailable" + "<br>");
                                                }

                                                if (guestStatus || customerStatus) {
                                                    out.print("Email: " + email + "<br>");
                                                    out.print("Phone Number: " + phone + "<br>");
                                                    out.print("Emergency Phone Number: " + emergencyPhone);
                                                } else {
                                                    out.print("Phone: " + r.getPhoneNo() + "<br>");
                                                }
                                            %>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>



                        <tr class="heading">
                            <td>
                                Receipt Details
                            </td>

                            <td>
                                #
                            </td>
                        </tr>

                        <tr class="item">
                            <td>
                                Date
                            </td>

                            <td>
                                <%=r.getDate()%>
                            </td>
                        </tr>

                        <tr class="item">
                            <td>
                                Session
                            </td>

                            <td>
                                <%=r.getSession()%>
                            </td>
                        </tr>

                        <tr class="item">
                            <td>
                                Number of Passenger
                            </td>

                            <td>
                                <%=r.getNumOfPassenger()%>
                            </td>
                        </tr>




                        <tr class="item">
                            <td>
                                Total Paid
                            </td>

                            <td>
                                RM <%=String.format("%.2f", Integer.parseInt(r.getNumOfPassenger()) * 150.00)%>
                            </td>
                        </tr>



                    </table>
                </div>
                <div class="print">
                    <br><center><button onclick="myFunction()">Print</button></center>
                </div>
                <script>
                    function myFunction() {
                        window.print();
                    }
                </script>
            </body>



        </section>

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
