

<%@page import="model.Page"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="t" class="dao.PageDao" scope="request" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tin tức bóng đá Việt Nam</title>
        <link rel= "stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class = "container">
            <nav class = "navbar navbar-expand-md navbar-dark bg-danger">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Việt Nam</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Premier League</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Champions League</a>
                        </li>

                        <li class="nav-item disabled">
                            <a class="nav-link">Welcome <% out.println(session.getAttribute("login"));%>!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Log out</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
            <div class="container-fluid">
                <c:forEach items="${pages}" var="page">
                    <div class="row my-2">
                        <div class="col-sm-4">
                            <img src="img/<c:out value="${page.getId()}" />.jpg" class="img-fluid">
                        </div>
                        <div class ="col-sm-8">
                            <h2><c:out value="${page.getHeading()}" /></h2>
                            <p><c:out value="${page.getSummary()}" /></p>
                        </div>
                    </div>
                    <hr/>
                </c:forEach>
            </div>


            <nav aria-lable="page side bar">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="#" tabindex="-1">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#" tabindex="-1">2</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#" tabindex="-1">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
