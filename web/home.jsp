

<%@page import="model.Page"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:useBean id="t" class="dao.PageDao" scope="request" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
        <link rel= "stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <style>
            footer {
                text-align: center;
                padding:1px;
                background-color: #dc3545;
                color: white;
            }
        </style>
    </head>
    <body>
        <% List<Page> pagesInSlide = (List<Page>) request.getAttribute("pagesInSlide"); %>
        <div class = "container">
            <nav class = "navbar navbar-expand-md navbar-dark bg-danger">

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item <c:if test="${pageType == 'ALL'}">active</c:if>">
                                <a class="nav-link" href="PageController?id=1&type=ALL">Home</a>
                            </li>
                            <li class="nav-item <c:if test="${pageType == 'VN'}">active</c:if>">
                                <a class="nav-link" href="PageController?id=1&type=VN">Việt Nam</a>
                            </li>
                            <li class="nav-item <c:if test="${pageType == 'PL'}">active</c:if>">
                                <a class="nav-link" href="PageController?id=1&type=PL">Premier League</a>
                            </li>
                            <li class="nav-item <c:if test="${pageType == 'CL'}">active</c:if>">
                                <a class="nav-link" href="PageController?id=1&type=CL">Champions League</a>
                            </li>
                        <% if (session.getAttribute("login") != null) { %>
                        <li class="nav-item dropdown">
                            <a class="nav-link">Welcome <% out.println(session.getAttribute("login"));%>!</a>
                            <!--                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                            <a class="dropdown-item" href="update_page.jsp">Update a page</a>
                                                            <a class="dropdown-item" href="#">Add a page</a>
                                                            <a class="dropdown-item" href="#">Delete a page</a>
                                                        </div>-->
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Log out</a>
                        </li>
                        <% } else { %>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Log in</a>
                        </li>
                        <% } %>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" onkeyup="searchItems();" type="search" placeholder="Search" aria-label="Search" id="search">
                    </form>
                </div>
            </nav>
            <div class="container-fluid" id="slide-container">
                <% if (session.getAttribute("login") != null) { %>
                <a role="button" class="btn btn-primary mt-2" href="AddController">Add a page</a>
                <% } %>
                <c:forEach var = "i" begin = "0" end = "${pagesInSlide.size()-1}">
                    <div class="row my-2" name="post">
                        <div class="col-sm-4">
                            <a data-toggle="collapse" href="#content<c:out value="${i}"/>" aria-expanded="false" aria-controls="content<c:out value="${i}"/>">
                                <img src="img/<c:out value="${pagesInSlide.get(i).getId()}" />.jpg" class="img-fluid">
                            </a>
                        </div>
                        <div class ="col-sm-8">
                            <h3 class="text-justify"><a class="title" data-toggle="collapse" href="#content<c:out value="${i}"/>" aria-expanded="false" aria-controls="content<c:out value="${i}"/>"><c:out value="${pagesInSlide.get(i).getHeading()}" /></a></h3>
                            <h5 class="text-justify"><c:out value="${pagesInSlide.get(i).getSummary()}" /></h5>
                            <% if (session.getAttribute("login") != null) { %>
                            <a role="button" class="btn btn-success" href="UpdateController?id=<c:out value="${pagesInSlide.get(i).getId()}" />&type=<c:out value="${pageType}"/>&slidePos=<c:out value="${id}"/>">Update</a>
                            <a role="button" class="btn btn-danger" href="DeleteController?id=<c:out value="${pagesInSlide.get(i).getId()}" />&type=<c:out value="${pageType}"/>">Delete</a>
                            <% }%>
                        </div>
                    </div>
                    <p class="text-justify collapse" id="content<c:out value="${i}"/>"><c:out value="${pagesInSlide.get(i).getContent()}" /></p>
                    <hr/>
                </c:forEach>
            </div>


            <nav aria-lable="page side bar">
                <ul class="pagination justify-content-center">
                    <li class="page-item <c:if test="${id == 1}">disabled</c:if>">
                        <a class="page-link" href="PageController?id=<c:out value="${id-1}"/>&type=<c:out value="${pageType}"/>" tabindex="-1">Previous</a>
                    </li>
                    <c:forEach var = "i" begin = "1" end = "${numSlides}">
                        <li class="page-item <c:if test="${i == id}">active</c:if>">
                            <a class="page-link" href="PageController?id=<c:out value="${i}"/>&type=<c:out value="${pageType}"/>" tabindex="-1"><c:out value="${i}"/></a>
                        </li>
                    </c:forEach>

                    <li class="page-item <c:if test="${id == numSlides}">disabled</c:if>">
                        <a class="page-link" href="PageController?id=<c:out value="${id+1}"/>&type=<c:out value="${pageType}"/>" tabindex="-1">Next</a>
                    </li>
                </ul>
            </nav>
            <footer>
                <div class="footbar">
                    <a class="nav-link link-footer" href="PageController?id=1&type=VN">Việt Nam</a>
                    <a class="nav-link link-footer" href="PageController?id=1&type=PL">Premier League</a>
                    <a class="nav-link link-footer" href="PageController?id=1&type=CL">Champions League</a>

                    <p>Author: Nguyễn Duy Toàn<br/><a href="mailto:toanndhe140540@fpt.edu.vn">toanndhe140540@fpt.edu.vn</a></p>

                </div>
            </footer>
        </div>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>


    <script>
                            function removeAccents(str) {
                                var AccentsMap = [
                                    "aàảãáạăằẳẵắặâầẩẫấậ",
                                    "AÀẢÃÁẠĂẰẲẴẮẶÂẦẨẪẤẬ",
                                    "dđ", "DĐ",
                                    "eèẻẽéẹêềểễếệ",
                                    "EÈẺẼÉẸÊỀỂỄẾỆ",
                                    "iìỉĩíị",
                                    "IÌỈĨÍỊ",
                                    "oòỏõóọôồổỗốộơờởỡớợ",
                                    "OÒỎÕÓỌÔỒỔỖỐỘƠỜỞỠỚỢ",
                                    "uùủũúụưừửữứự",
                                    "UÙỦŨÚỤƯỪỬỮỨỰ",
                                    "yỳỷỹýỵ",
                                    "YỲỶỸÝỴ"
                                ];
                                for (var i = 0; i < AccentsMap.length; i++) {
                                    var re = new RegExp('[' + AccentsMap[i].substr(1) + ']', 'g');
                                    var char = AccentsMap[i][0];
                                    str = str.replace(re, char);
                                }
                                return str;
                            }

                            function searchItems() {
                                var input, filter, searchingArea, a, txtValue;
                                input = document.getElementById('search');
                                filter = input.value.toUpperCase();
                                filter = removeAccents(filter);
                                items = document.getElementsByName('post');
                                for (i = 0; i < items.length; i++) {
                                    a = items[i].getElementsByClassName("title")[0];
                                    txtValue = a.textContent || a.innerText;
                                    txtValue = removeAccents(txtValue);
                                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                        items[i].style.display = "";
                                    } else {
                                        items[i].style.display = "none";

                                    }
                                }
                            }
    </script>
</html>
