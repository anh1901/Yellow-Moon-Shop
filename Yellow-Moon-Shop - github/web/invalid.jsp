<%-- 
    Document   : invalid
    Created on : Oct 5, 2020, 2:36:54 PM
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
        <title>Yellow Moon Shop-login</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="yellowMoonShop">Yellow Moon Shop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="yellowMoonShop">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cartAccess">Your cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="trackOrder">Track your order</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Login Now!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="signup.jsp">Register Now!</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="padding-top: 10%; padding-bottom: 35%">
            <div class="row d-flex justify-content-center">
                <h1 style="color: red">Error: ${requestScope.ERROR}</h1><br>
                <a href="javascript:history.go(-1)">Click here to try again</a>
            </div>
        </div>
        <br><br>
        <footer class="fixed-bottom py-2 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
