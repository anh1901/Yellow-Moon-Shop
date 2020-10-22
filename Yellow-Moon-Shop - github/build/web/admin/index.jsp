<%-- 
    Document   : index
    Created on : Oct 7, 2020, 5:10:53 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Yellow Moon Shop">
        <meta name="author" content="Anh">
        <title>Yellow Moon Shop-Lunar Cake</title>
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Yellow Moon Shop</a>
                <c:if test="${not empty sessionScope.USER}">
                    Welcome ${sessionScope.USER.userName}
                </c:if>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/createAccess">Create Cake</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="search.jsp">Update cake</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/trackOrder">View orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/log">View logs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <h1>This is the ADMIN page.</h1>
        </div>
        <footer class="fixed-bottom py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
