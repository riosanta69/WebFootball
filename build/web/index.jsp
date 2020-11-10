<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Java MVC Login & Register Script Using MySql</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <h2>Login</h2>  
            <form method="post" action="LoginController" name="LoginForm" onsubmit="return validate();">

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Enter username">
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="Enter password">
                </div>
                <% if (request.getAttribute("WrongLoginMsg") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <%
                        out.println(request.getAttribute("WrongLoginMsg")); //get register fail error message from "RegisterControlle
                    %>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <% }%>
                <input type="submit" class="btn btn-primary" name="btn_login" value="Login">

                <p>Your don't have a account? <a href="register.jsp">Register</a></p>

            </form>

        </div>

        <script language="javascript">

            function validate()
            {
                var username = document.getElementById('username'); //get form name "LoginForm" and textbox name "txt_username" store in variable username
                var password = document.getElementById('password'); //get form name "LoginForm" and textbox name "txt_password" store in variable password

                if (username.value == null || username.value == "") //check username textbox not blank
                {
                    window.alert("Please enter username"); //alert message
                    username.style.background = '#f08080'; //set textbox color
                    username.focus();
                    return false;
                }
                if (password.value == null || password.value == "") //check password textbox not blank
                {
                    window.alert("Please enter password"); //alert message
                    password.style.background = '#f08080'; //set textbox color
                    password.focus();
                    return false;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

