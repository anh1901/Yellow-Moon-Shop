<%-- 
    Document   : productdetail
    Created on : Oct 7, 2020, 9:02:25 AM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Yellow Moon Shop">
        <meta name="author" content="Anh">

        <title>Yellow Moon Shop-Lunar Cake</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="yellowMoonShop">Yellow Moon Shop</a>
                <c:if test="${not empty sessionScope.USER}">
                    Welcome ${sessionScope.USER.userName}
                </c:if>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
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
                        <c:if test="${sessionScope.USER.role eq 'GUEST'}">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login Now!</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signup.jsp">Register Now!</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.USER.role eq 'USER' && sessionScope.USER.role eq 'ADMIN'}">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="padding-top: 10%; padding-bottom: 35%">
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col">
                    <h1>${param.name}</h1>
                    <img class="img-thumbnail rounded-circle" src="images/${param.photo}"/>
                </div>
                <div class="col-md-6">
                    <h5>
                        <strong>Product ID:</strong> ${param.productId}</br></br>
                        <strong>Price:</strong>
                        <c:set var = "balance" value = "${param.price}" />
                        <fmt:setLocale value = "vi_VN"/>
                        <fmt:formatNumber value = "${balance}" type = "currency"/></br></br>
                        <strong>Expire period:</strong> ${param.date}-${param.dateExpire}</br></br>
                        <strong>Description:</strong> ${param.description}</br></br>
                        <strong>Quantity:</strong>${param.quantity}</br></br>
                    </h5>
                    <form action="addProduct" method="post" accept-charset="UTF-8">
                        <input class="btn btn-dark" type="submit" value="Add to your cart" name="button">
                        <input type="hidden" value="${param.productId}" name="productID">
                        <input type="hidden" value="${param.price}" name="price">
                    </form>
                    <br>
                    <a class="btn btn-dark" href="cartAccess">View your cart</a>
                    <a class="btn btn-dark" href="yellowMoonShop">Keep shopping</a>
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
