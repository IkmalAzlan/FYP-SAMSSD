<%-- 
    Document   : login
    Created on : 29 Nov 2022, 2:02:04 pm
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
  <body>
    <!-- Body of Form starts -->
    <div class="container">
         <form method="post"id="signup-form" class="signup-form" action="loginCustomerServlet1" autocomplete="on">
      
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

    		


    		<!--Terms and Conditions------>
    		<div 
    				<input type="checkbox" name="Terms" required> &nbsp; 
    		</div>
    		<!--Terms and Conditions------>


                <br><br><br><br><br><br><br><br><br><br>
               
                <!---Submit Button------>
             
    		<div class="box" style="background: #2d3e3f" > 
    				<input type="Submit" name="Submit" class="submit" value="Log In">
    		</div>
                
               <!---Submit Button----->
               <a href="index.jsp"> <div class="box" style="background: #2d3e3f" > 
               <input type="button" name="Submit" class="submit"  value="Homepage">
                   </div></a>
                
    		
    		
             
                
      </form>
  </div>
  <!--Body of Form ends--->
  </body>
</html>
