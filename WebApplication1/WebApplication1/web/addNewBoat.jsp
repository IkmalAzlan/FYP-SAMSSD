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
            
         
              <form method="post" action="customerServlet1" autocomplete="on">
                  
                  
            <input name="id" hidden value="<%=request.getAttribute("id")%>"/>
            <input name="role" hidden value="boat"/>
             
             <!--Boat Brand-->
    		<div class="box">
          <label for="name" class="fl fontLabel"> Boat Brand: </label>
    			<div class="new iconBox">
            <i class="fa fa-ship" aria-hidden="true"></i>
          </div>
    			<div class="fr">
    			<input type="text" name="brand" class="textBox" autofocus="on" required>		
    			</div>
    			<div class="clr"></div>
    		</div>
    		
              

                		<!---No. Plate------>
    		<div class="box">
          <label for="phone" class="fl fontLabel"> No. Plate: </label>
    			<div class="fl iconBox"><i class="fa fa-id-card-o" aria-hidden="true"></i></div>
    			<div class="fr">
    			<input type="text" name="plate" class="textBox" autofocus="on" required>			
    			</div>
    			<div class="clr"></div>
    		</div>
    		
                
                		<!---Capacity---->
    		<div class="box">
          <label for="email" class="fl fontLabel"> Capacity: </label>
    			<div class="fl iconBox"><i class="fa fa-users" aria-hidden="true"></i></div>
    			<div class="fr">
    			<input type="text" name="capacity" class="textBox" autofocus="on" required>			
    			</div>
    			<div class="clr"></div>
    		</div>
    		

                <!---Color------>
    		<div class="box">
          <label for="password" class="fl fontLabel"> Color </label>
    			<div class="fl iconBox"><i class="fa fa-yelp" aria-hidden="true"></i></div>
    			<div class="fr">
    				<input type="text" name="color" class="textBox" autofocus="on" required>		
    			</div>
    			<div class="clr"></div>
    		</div>
    	
                <div class="box">
             
    		<!---Submit Button----->
                       
                         
    		<div class="box" style="background: #2d3e3f">
                    
           
               <input type="Submit" name="Submit" class="submit"   value="Submit">
                
    		</div>
                
                
        </div>
                  </form>
  </body>
</html>
     


             
              
   

