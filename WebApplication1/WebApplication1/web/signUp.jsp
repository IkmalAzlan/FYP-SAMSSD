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
              <form method="post"id="signup-form" class="signup-form" action="customerServlet1" autocomplete="on">
                   <select required class="form-control" name="role" id="role">
	<option value="1">Customer</option>
        <option value="2">Owner Boat</option>
        <option value="3">Staff</option>
	</select>
             
             <!--First name-->
    		<div class="box">
          <label for="name" class="fl fontLabel"> Name: </label>
    			<div class="new iconBox">
            <i class="fa fa-user" aria-hidden="true"></i>
          </div>
    			<div class="fr">
    					<input type="text" name="name" placeholder="Name" id="name"
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
    					<input type="text" required name="phone" maxlength="10" placeholder="Phone No." class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Phone No.---->
                
                		<!---Email ID---->
    		<div class="box">
          <label for="email" class="fl fontLabel"> Email ID: </label>
    			<div class="fl iconBox"><i class="fa fa-envelope" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="email" required name="email" placeholder="Email Id" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!--Email ID----->

                <!---Password------>
    		<div class="box">
          <label for="password" class="fl fontLabel"> Password </label>
    			<div class="fl iconBox"><i class="fa fa-key" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input type="Password" required name="password" placeholder="Password" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Password---->

                <!---Address------>
    		<div id="address" class="box">
                    <label id="addressLabel" class="fl fontLabel"> Address </label>
                    <div id="addressIcon" class="fl iconBox"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input id="address" type="Address"  name="address" placeholder="Address" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Address---->

                <!---Address------>
    		<div id="license" class="box">
                    <label id="addressLabel" class="fl fontLabel"> License Number </label>
                    <div id="addressIcon" class="fl iconBox"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input id="address" type="Address"  name="licence" placeholder="Licese Number" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Address---->

                <!---Address------>
    		<div id="plate" class="box">
                    <label id="addressLabel" class="fl fontLabel"> Plate Number </label>
                    <div id="addressIcon" class="fl iconBox"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
    			<div class="fr">
    					<input id="address" type="Address" name="plate" placeholder="Address" class="textBox">
    			</div>
    			<div class="clr"></div>
    		</div>
    		<!---Address---->
                
           
                <!--<br><br><br><br>-->
    		<!---Submit Button------>
<!--    		<div class="box" style="background: #2d3e3f">
    				<input type="Submit" name="Submit" class="submit" value="Sign Up">
                                <input type="Submit" name="Submit" class="submit" value="Sign Up" disabled="true">
    		&nbsp;&nbsp;
    		-Submit Button---
                 <a href="index.jsp"> <div class="box" style="background: #2d3e3f">  
               <input type="button" name="Submit" class="submit"   value="Home">
                    </div></a>
                </div>-->
<div>&nbsp;</div>
                <div style="width: 85%; display: table;">
    <div style="display: table-row">
        <div style="width: 600px; display: table-cell;"> <input type="Submit" name="Submit" class="submit" value="Sign Up"> </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<div style="display: table-cell;"> <a href="index.jsp">   
               <input type="button" name="Submit" class="submit"   value="Home">
                    </a> </div>
    </div>
</div>
                
                
                
                
                
                  </form>
            
            
            <style>
                
            </style>
            
        </div>
  </body>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
            $(document).ready(function(){
                
                    document.getElementById("address").style.visibility = "hidden";
                    document.getElementById("license").style.visibility = "hidden";
                    document.getElementById("plate").style.visibility = "hidden";
                    document.getElementById("address").required = false;
                    document.getElementById("license").required = false;
                    document.getElementById("plate").required = false;
            $('#role').change(function(){
                //Selected value
                var inputValue = $(this).val();
                //alert("value in js "+inputValue);
                
                if(inputValue === "1")
                {
//                    alert("value in js "+inputValue);
                    document.getElementById("address").style.visibility = "hidden";
                    document.getElementById("license").style.visibility = "hidden";
                    document.getElementById("plate").style.visibility = "hidden";
                    document.getElementById("address").required = false;
                    document.getElementById("license").required = false;
                    document.getElementById("plate").required = false;
//                    getElementByTagName('address').setAttribute(hidden = "false");
                }
                else
                {
                    
                    document.getElementById("address").style.visibility = "visible";
                    document.getElementById("license").style.visibility = "hidden";
                    document.getElementById("plate").style.visibility = "hidden";
                    document.getElementById("license").required = false;
                    document.getElementById("plate").required = false;
                    
                    if(inputValue === "2")
                    {
                        document.getElementById("license").style.visibility = "visible";
                        document.getElementById("plate").style.visibility = "hidden";
                        document.getElementById("plate").required = false;
                    }
                }

                //Ajax for calling php function
                $.post('submit.php', { dropdownValue: inputValue }, function(data){
                    alert('ajax completed. Response:  '+data);
                    //do after submission operation in DOM
                });
            });
            //document.getElementById("role").selec
        });
        </script>
</html>
     


             
              
   

