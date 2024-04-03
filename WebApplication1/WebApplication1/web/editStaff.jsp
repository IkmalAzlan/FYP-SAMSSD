<%-- 
    Document   : signUp
    Created on : 29 Nov 2022, 2:04:16 pm
    Author     : Benjimal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Form</title>
        <link href="css/style.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>


    <!-- Body of Form starts -->
    <div class="container">
        <form method="post" action="UpdateStaffServlet" autocomplete="on">

            <input name="id" hidden value="<%=request.getAttribute("staffID")%>"/>
            <input name="roles" hidden value="<%=request.getAttribute("staffRole")%>"/>
            <input name="adminName" value="<%=request.getAttribute("name")%>" hidden />
            <input name="adminID" value="<%=request.getAttribute("adminID")%>" hidden />


            <div class="box">
                <label for="idd" class="fl fontLabel"> ID: </label>
                <div class="new iconBox">
                    <i class="fa fa-id-card" aria-hidden="true"></i>
                </div>
                <div class="fr">
                    <input type="text" name="id" disabled value="<%=request.getAttribute("staffID")%>"
                           class="textBox" autofocus="on" required>
                </div>
                <div class="clr"></div>
            </div>

            <div class="box">
                <label for="role1" class="fl fontLabel"> Role: </label>
                <div class="new iconBox">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                <select required class="form-control" name="role"  style="width:210px;height:35px;">
                    <%
                        if ("Staff".equalsIgnoreCase(request.getAttribute("staffRole").toString())) {
                    //        out.println("<option value='Customer'>Customer</option>");
                    //        out.println("<option value='Owner Boat'>Owner Boat</option>");
                            out.println("<option selected value='Staff'>Staff</option>");
                        } else {
                    //        out.println("<option value='Customer'>Customer</option>");
                            out.println("<option selected value='Owner Boat'>Owner Boat</option>");
                    //        out.println("<option value='Staff'>Staff</option>");
                        }
                    %>
                    <!--	<option value="Customer">Customer</option>
                            <option value="Owner Boat">Owner Boat</option>
                            <option value="Staff">Staff</option>-->
                </select>
            </div>

            <!--First name-->
            <div class="box">
                <label for="name" class="fl fontLabel"> Name: </label>
                <div class="new iconBox">
                    <i class="fa fa-user" aria-hidden="true"></i>
                </div>
                <div class="fr">
                    <input type="text" name="name" value="<%=request.getAttribute("staffName")%>"
                           class="textBox" autofocus="on" required>
                </div>
                <div class="clr"></div>
            </div>
            <!--First name-->  



            <!---Phone No.------>
            <div class="box">
                <label for="phone" class="fl fontLabel"> Phone No.: </label>
                <div class="fl iconBox"><i class="fa fa-phone-square" aria-hidden="true"></i></div>
                <div class="fr">
                    <input type="text" required name="phone" maxlength="10" value="<%=request.getAttribute("staffPhone")%>" class="textBox">
                </div>
                <div class="clr"></div>
            </div>
            <!---Phone No.---->

            <!---Email ID---->
            <div class="box">
                <label for="email" class="fl fontLabel"> Email ID: </label>
                <div class="fl iconBox"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                <div class="fr">
                    <input type="email" required name="email" value="<%=request.getAttribute("staffEmail")%>" class="textBox">
                </div>
                <div class="clr"></div>
            </div>
            <!--Email ID----->

            <!---Password------>
            <div class="box">
                <label for="password" class="fl fontLabel"> Password </label>
                <div class="fl iconBox"><i class="fa fa-key" aria-hidden="true"></i></div>
                <div class="fr">
                    <input type="Password" required name="password" value="<%=request.getAttribute("staffPassword")%>" class="textBox">
                </div>
                <div class="clr"></div>
            </div>


            <%
                if ("Staff".equalsIgnoreCase(request.getAttribute("staffRole").toString())) {
            %>
            <!---Address------>
            <div id="address" class="box">
                <label id="addressLabel" class="fl fontLabel"> Address </label>
                <div id="addressIcon" class="fl iconBox"><i class="fa fa-map-marker" aria-hidden="true" ></i></div>
                <div class="fr">
                    <input id="address" type="Address" required name="address" placeholder="Address" class="textBox" value="<%=request.getAttribute("staffAddress")%>">
                </div>
                <div class="clr"></div>
            </div>
            <!---Address---->
            <%
            } else if ("Owner Boat".equalsIgnoreCase(request.getAttribute("staffRole").toString())) {
            %>

            <!---Address------>
            <div id="address" class="box">
                <label id="addressLabel" class="fl fontLabel"> Address </label>
                <div id="addressIcon" class="fl iconBox"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                <div class="fr">
                    <input id="address" type="Address" required name="address" placeholder="Address" class="textBox" value="<%=request.getAttribute("staffAddress")%>">
                </div>
                <div class="clr"></div>
            </div>
            <!---Address---->
            <!---Address------>
            <div id="license" class="box">
                <label id="addressLabel" class="fl fontLabel"> License Number </label>
                <div id="addressIcon" class="fl iconBox"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                <div class="fr">
                    <input required name="license" placeholder="Licese Number" class="textBox" value="<%=request.getAttribute("staffLicense")%>">
                </div>
                <div class="clr"></div>
            </div>
            <!---Address---->

            <%
                }
            %>
            <!---Password---->
            <div class="box">
                <label for="status1" class="fl fontLabel"> Status: </label>
                <div class="new iconBox">
                    <i class="fa fa-wifi" aria-hidden="true"></i>
                </div>
                <select required class="form-control" name="staffStatus" style="width:210px;height:35px;">
                    <%
                        if ("ACTIVE".equalsIgnoreCase(request.getAttribute("staffStatus").toString())) {
                            out.println("<option selected value='ACTIVE'>ACTIVE</option>");
                            out.println("<option value='INACTIVE'>INACTIVE</option>");
                        } else {
                            out.println("<option  value='ACTIVE'>ACTIVE</option>");
                            out.println("<option selected value='INACTIVE'>INACTIVE</option>");
                        }
                    %>


                </select>
                <input hidden name="staffID" value="<%=request.getAttribute("staffID")%>"/>
                <input name="adminName" value="<%=request.getAttribute("name")%>" hidden />
                <!--<input name="action" value="update" hidden />-->
            </div>

            <!---Submit Button------>
            <div class="box" style="background: #2d3e3f">
                <input type="Submit" name="Submit" class="submit" value="Update">
            </div>

        </form><!-- comment -->
        <%
            if (request.getAttribute("role") != null)
                if (request.getAttribute("role").toString().equalsIgnoreCase("Admin")) {
        %>
        <form action="DeleteStaffServlet" method="post">
            <input hidden name="adminName" value="<%=request.getAttribute("name")%>"/>
            <input name="adminID" value="<%=request.getAttribute("adminID")%>" hidden />
            <%
            } else {
            %>
            <form action="#" method="post">
                <%
                        }
                %>
                <!---Submit Button----->
                <input hidden name="staffID" value="<%=request.getAttribute("staffID")%>"/>
                <input hidden name="name" value="<%=request.getAttribute("name")%>"/>
                <input name="adminID" value="<%=request.getAttribute("adminID")%>" hidden />

                <div class="box" style="background: #2d3e3f">

                    <%
                        if (request.getAttribute("role") != null)
                            if (request.getAttribute("role").toString().equalsIgnoreCase("Admin")) {
                    %>
                    <input type="Submit" name="operation" class="submit"   value="deleteStaff">
                    <%
                    } else {
                    %>
                    <input type="Submit" name="operation" class="submit"   value="deleteStaff">
                    <%
                            }
                    %>
                </div>


            </form>
    </div>
    <!--               <script>
                       
                       </script>-->

    <!--    <script>
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
            </script>-->
</body>
</html>







