<%-- 
    Document   : editReservation
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
            
         
              <form method="post" action="UpdateReservationServlet" autocomplete="on">
                  
            <input name="id" hidden value="<%=request.getAttribute("id")%>"/>
            <input name="rID" hidden value="<%=request.getAttribute("id")%>"/>
<!--            <input name="roles" hidden value="<%=request.getAttribute("staffRole")%>"/>
            <input name="adminName" value="<%=request.getAttribute("name")%>" hidden />
    			-->
                  
                  <div class="box">
          <label for="idd" class="fl fontLabel"> ID: </label>
    			<div class="new iconBox">
            <i class="fa fa-id-card" aria-hidden="true"></i>
          </div>
    			<div class="fr">
    					<input type="text" name="id" disabled value="<%=request.getAttribute("id")%>"
              class="textBox" autofocus="on" required>
    			</div>
    			<div class="clr"></div>
    		</div>
<!--                  
    		<div class="box">
                  <label for="role1" class="fl fontLabel"> Role: </label>
                    <div class="new iconBox">
            <i class="fa fa-bars" aria-hidden="true"></i>
          </div>-->
                   <!--<select required class="form-control" name="role"  style="width:210px;height:35px;">-->
<%
//    if("Staff".equalsIgnoreCase(request.getAttribute("staffRole").toString()))
//    {
////        out.println("<option value='Customer'>Customer</option>");
////        out.println("<option value='Owner Boat'>Owner Boat</option>");
//        out.println("<option selected value='Staff'>Staff</option>");
//    }
//    else
//    {
////        out.println("<option value='Customer'>Customer</option>");
//        out.println("<option selected value='Owner Boat'>Owner Boat</option>");
////        out.println("<option value='Staff'>Staff</option>");
//    }
%>
<!--	<option value="Customer">Customer</option>
        <option value="Owner Boat">Owner Boat</option>
        <option value="Staff">Staff</option>-->
<!--	</select>
          </div>-->
             
<!--             First name
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
    		First name  -->
                
              

                		<!---Phone No.------>
    		<div class="box">
          <label for="phone" class="fl fontLabel"> Phone No.: </label>
    			<div class="fl iconBox"><i class="fa fa-phone-square" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="text" required name="phone" maxlength="11" value="<%=request.getAttribute("phone")%>" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Phone No.---->
                
                		<!---Email ID---->
    		<div class="box">
          <label for="email" class="fl fontLabel"> Date: </label>
    			<div class="fl iconBox"><i class="fa fa-calendar" aria-hidden="true"></i></div>
                        <div class='input-group date' id='datetimepicker1'>
                            <input  type='text' readonly id='datetimepicker2' class="form-control" style="width:206px;height:30px;" value="<%= request.getParameter("date")%>"  name="date"/>
							                   
							              </div>
<!--    			<div class="fr">
                            <input  type='date' disabled="true" id='datetimepicker2' class="form-control" style="height:50px;" value="<%= request.getParameter("date")%>"  name="date"/>
    					<input  type='date' id='datetimepicker2' class="form-control" style="width:206px;height:30px;" value="<%= request.getParameter("date")%>"  name="date"/>
    			</div>-->
    			<div class="clr"></div>
    		</div>
    		<!--Email ID----->

                <!---Password------>
    		<div class="box">
          <label for="password" class="fl fontLabel"> Session </label>
    			<div class="fl iconBox"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
    			<div class="fr">
    					<select required class="form-control" name="session" style="width:210px;height:35px;">
<%
    if("1".equalsIgnoreCase(request.getAttribute("session").toString()))
    {
        out.println("<option selected value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option value='3'>3</option>");
    }
    else if("2".equalsIgnoreCase(request.getAttribute("session").toString()))
    {
        out.println("<option value='1'>1</option>");
        out.println("<option selected value='2'>2</option>");
        out.println("<option value='3'>3</option>");
    }
    else
    {
        out.println("<option value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option selected value='3'>3</option>");
    }
%>
                                        </select>
                                        
    			</div>
                </div>
                <div class="box">
          <label for="ps" class="fl fontLabel"> Passenger </label>
    			<div class="fl iconBox"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
    			<div class="fr">
    					<select required class="form-control" name="passenger" style="width:210px;height:35px;">
<%
    if("1".equalsIgnoreCase(request.getAttribute("passenger").toString()))
    {
        out.println("<option selected value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option value='3'>3</option>");
        out.println("<option value='4'>4</option>");
        out.println("<option value='5'>5</option>");
        out.println("<option value='6'>6</option>");
    }
    else if("2".equalsIgnoreCase(request.getAttribute("passenger").toString()))
    {
        out.println("<option value='1'>1</option>");
        out.println("<option selected value='2'>2</option>");
        out.println("<option value='3'>3</option>");
        out.println("<option value='4'>4</option>");
        out.println("<option value='5'>5</option>");
        out.println("<option value='6'>6</option>");
    }
    else if("3".equalsIgnoreCase(request.getAttribute("passenger").toString()))
    {
        out.println("<option value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option selected value='3'>3</option>");
        out.println("<option value='4'>4</option>");
        out.println("<option value='5'>5</option>");
        out.println("<option value='6'>6</option>");
    }
    else if("4".equalsIgnoreCase(request.getAttribute("passenger").toString()))
    {
        out.println("<option value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option value='3'>3</option>");
        out.println("<option selected value='4'>3</option>");
        out.println("<option value='5'>5</option>");
        out.println("<option value='6'>6</option>");
    }
    else if("5".equalsIgnoreCase(request.getAttribute("passenger").toString()))
    {
        out.println("<option value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option value='3'>3</option>");
        out.println("<option value='4'>4</option>");
        out.println("<option selected value='5'>5</option>");
        out.println("<option value='6'>6</option>");
    }
    else
    {
        out.println("<option value='1'>1</option>");
        out.println("<option value='2'>2</option>");
        out.println("<option value='3'>3</option>");
        out.println("<option value='4'>4</option>");
        out.println("<option value='5'>5</option>");
        out.println("<option selected value='6'>6</option>");
    }
%>
                                        </select>
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Password---->
                <div class="box">
                  <label for="status1" class="fl fontLabel"> Status: </label>
                    <div class="new iconBox">
            <i class="fa fa-wifi" aria-hidden="true"></i>
          </div>
                   <select required class="form-control" name="status" style="width:210px;height:35px;">
<%
    if("RESERVED".equalsIgnoreCase(request.getAttribute("status").toString()))
    {
        out.println("<option selected value='RESERVED'>RESERVED</option>");
        out.println("<option value='PENDING PAYMENT'>PENDING PAYMENT</option>");
        out.println("<option value='CANCELLED'>CANCELLED</option>");
    }
    else if("CANCELLED".equalsIgnoreCase(request.getAttribute("status").toString()))
    {
        out.println("<option value='RESERVED'>RESERVED</option>");
        out.println("<option value='PENDING PAYMENT'>PENDING PAYMENT</option>");
        out.println("<option selected value='CANCELLED'>CANCELLED</option>");
    }
    else
    {
        out.println("<option value='RESERVED'>RESERVED</option>");
        out.println("<option selected value='PENDING PAYMENT'>PENDING PAYMENT</option>");
        out.println("<option value='CANCELLED'>CANCELLED</option>");
    }
%>
	
        
	</select>

                         <input hidden name="staffID" value="<%=request.getAttribute("staffID")%>"/>
            <input name="adminName" value="<%=request.getAttribute("staffName")%>" hidden />
                </div>
           
<div class="box">
          <label for="name" class="fl fontLabel"> Name: </label>
    			<div class="fl iconBox"><i class="fa fa-user" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="text" readonly name="rName" maxlength="10" value="<%=request.getAttribute("rName")%>" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Submit Button------>
    		<div class="box" style="background: #2d3e3f">
    				<input type="Submit" name="Submit" class="submit" value="Update">
    		</div>
                
              </form><!-- comment -->
              <form action="DeleteReservationServlet" method="post">
    		<!---Submit Button----->
                         <input hidden name="staffID" value="<%=request.getAttribute("staffID")%>"/>
                         <input hidden name="name" value="<%=request.getAttribute("staffName")%>"/>
            <input name="id" hidden value="<%=request.getAttribute("id")%>"/>
                         
    		<div class="box" style="background: #2d3e3f">
               <input type="Submit" name="Submit" class="submit"   value="Delete">
    		</div>
                
                
                  </form>
        </div>
                         <script>
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
                         </script>
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
     


             
              
   

