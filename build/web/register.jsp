<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java MVC Login & Register Script Using MySql</title>
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <h2>Register</h2>
            <form method="post" action="RegisterController" onsubmit="return validate();">
                <div class="form-group">
                    <label for="firstname">First name</label>
                    <input type="text" name="txt_firstname" class="form-control" id="firstname" placeholder="Enter firstname">
                </div>
                <div class="form-group">
                    <label for="lastname">Last name</label>
                    <input type="text" name="txt_lastname" class="form-control" id="lastname" placeholder="Enter lastname">
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="txt_username" class="form-control" id="username" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="txt_password" class="form-control" id="password" placeholder="Password">
                </div>
                
                <input type="submit" class="btn btn-primary" name="btn_register" value="Register">
                
                <p>You have a account? <a href="index.jsp">Login</a></p>
                
            </form>
        </div>
        
        <center>
          
            
            
            
            <h3 style="color:red">
                <%
                    if(request.getAttribute("RegisterErrorMsg")!=null)
                    {
                        out.println(request.getAttribute("RegisterErrorMsg")); //get register fail error message from "RegisterController"
                    }
                %>
            </h3>
            
        </center>
    
    <script language="javascript">	
	function validate()
	{
            var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
            var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
            var user_name= /^[a-z A-Z 0-9]+$/; //pattern allowed alphabet a-z or A-Z 
            var password_valid=/^[A-Z a-z 0-9]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9 and 6 to 12 range
            
            var firstname = document.getElementById("firstname"); //textbox id firstname
            var lastname = document.getElementById("lastname"); //textbox id lastname
            var username = document.getElementById("username"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
				
            if(!first_name.test(firstname.value) || firstname.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
            {
		alert("Enter Firstname Alphabet Only....!"); //alert message
                firstname.focus();
                firstname.style.background = '#f08080'; //set textbox color
                return false;                    
            }
            if(!last_name.test(lastname.value) || lastname.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
            {
		alert("Enter Lastname Alphabet and Number Only....!"); //alert message
                lastname.focus();
                lastname.style.background = '#f08080'; //set textbox color
                return false;                    
            }
            if(!user_name.test(username.value) || username.value=='') //apply if condition using test() method match the parameter for pattern allow alphabet only
            {
		alert("Enter Username Alphabet Only....!"); //alert message
                username.focus();
                username.style.background = '#f08080'; //set textbox color
                return false;                    
            }
            if(!password_valid.test(password.value) || password.value=='') //apply if condition using test() method match the parameter for pattern passoword allow 6 to 12 range 
            {
		alert("Password Must Be 6 to 12 character"); //alert message
                password.focus();
                password.style.background = '#f08080'; //set textbox color
                return false;                    
            }
	}		
	</script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
    
</html>
