<%-- 
    Document   : add_page
    Created on : Nov 17, 2020, 7:53:19 PM
    Author     : Riosanta69
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add a page</title>
        <link rel= "stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <form class="m-5" method="post" action="AddController">
                <div class="form-group">
                    <label for="input-type">Type</label>
                    <select class="form-control" id="input-type" name="input-type">
                        <option value="VN">Vietnam</option>
                        <option value="PL">Premier League</option>
                        <option value="CL">Champion League</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="input-heading">Heading</label>
                    <input required type="text" class="form-control" id="input-heading" placeholder="Enter heading" name="input-heading">
                </div>
                <div class="form-group">
                    <label for="input-summary">Summary</label>
                    <input required type="text" class="form-control" id="input-summary" placeholder="Enter summary" name="input-summary">
                </div>
                <div class="form-group">
                    <label for="input-content">Content</label>
                    <textarea class="form-control" id="input-content" rows="5" name="input-content">
                    </textarea>
                </div>
                <button class="btn btn-danger" type="submit">Submit</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
