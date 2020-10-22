<%-- 
    Document   : login
    Created on : Oct 7, 2020, 3:06:44 PM
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
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h3>Sign In</h3>
                        </div>
                        <c:if test="${not empty requestScope.MSG}">
                            <h6 style="color: green">${requestScope.MSG}</h6>
                        </c:if>
                        <div class="card-body">
                            <form action="login" method="POST">
                                <div class="input-group form-group">
                                    <input type="email" class="form-control" placeholder="Email" name="email" required>
                                </div>
                                <div class="input-group form-group">
                                    <input type="password" class="form-control" placeholder="Password" name="password" required>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Login" class="btn btn-dark">
                                </div>
                            </form>
                        </div>
                        <div class="card-footer">
                            <div class="d-flex justify-content-center links">
                                <a class="btn btn-dark" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/J3.L.P0011.-Yellow-Moon-Shop/loginGoogle&response_type=code
                                   &client_id=486130408267-kkevt3fqsvm2m4bh3gpvo0dafo75r510.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                                Don't have an account?<a href="signup.jsp">Sign Up</a>
                            </div>
                        </div>
                    </div>
                </div>
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

