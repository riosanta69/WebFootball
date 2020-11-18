<%-- 
    Document   : view
    Created on : Nov 16, 2020, 2:52:13 PM
    Author     : Riosanta69
--%>

<%@page import="model.Page"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update a page</title>
        <link rel= "stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body>
        <% Page p = (Page) request.getAttribute("page");%>
        <div class="container">
            <h1>Update page</h1>
            <form class="m-5" method="post" action="UpdateController">
                <div class="form-group collapse">
                    <input type="text" class="form-control" name="input-id" value="<%=p.getId()%>">
                    <input type="text" class="form-control" name="slidePos" value="<%=request.getParameter("slidePos")%>">
                    <input type="text" class="form-control" name="type" value="<%=request.getParameter("type")%>">

                </div>
                <div class="form-group">
                    <label for="input-type">Type</label>
                    <select class="form-control" id="input-type" name="input-type">
                        <option value="VN" <% if (request.getAttribute("pageType").equals("VN")) { %>selected <% } %>>Vietnam</option>
                        <option value="PL" <% if (request.getAttribute("pageType").equals("PL")) { %>selected <% } %>>Premier League</option>
                        <option value="CL" <% if (request.getAttribute("pageType").equals("CL")) { %>selected <% }%>>Champion League</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="input-heading">Heading</label>
                    <input required type="text" class="form-control" id="input-heading" name="input-heading" value="<%=p.getHeading()%>">
                </div>
                <div class="form-group">
                    <label for="input-summary">Summary</label>
                    <input required type="text" class="form-control" id="input-summary" name="input-summary" value="<%=p.getSummary()%>">
                </div>
                <div class="form-group">
                    <label for="input-content">Content</label>
                    <textarea class="form-control" id="input-content" rows="5" name="input-content">
                        <%=p.getContent()%>
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
