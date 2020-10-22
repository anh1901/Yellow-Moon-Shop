<%-- 
    Document   : track
    Created on : Oct 8, 2020, 8:10:40 AM
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
                        <li class="nav-item">
                            <a class="nav-link" href="yellowMoonShop">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cartAccess">Your cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Track your order</a>
                        </li>
                        <c:if test="${sessionScope.USER.role eq 'GUEST'}">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Login Now!</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="signup.jsp">Register Now!</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.USER.role eq 'USER' || sessionScope.USER.role eq 'ADMIN'}">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav><br>
        <form action="searchOrder" method="POST">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-2 col-lg-3">
                        Order ID:
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <input type="number" class="form-control" placeholder="Search by order ID" name="searchID" value="${param.searchID}" min="0" maxlength="50" required>
                    </div>
                    <input type="submit" value="Search" class="btn btn-dark">
                </div>
            </div>
        </form>
        <div class="container" style="padding-top: 10%; padding-bottom: 35%">
            <div class="row d-flex justify-content-center">
                <h1>Your orders</h1>
                <div class="col-md-12">
                    <c:set var="order" value="${sessionScope.orders}"/>
                    <c:if test="${empty order}">
                        <h1 style="color: red">No order found!!</h1>
                    </c:if>
                    <c:if test="${not empty order}">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Order ID</th>
                                    <th>Price</th>
                                    <th>view</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="orderInfo" items="${order}" varStatus="counter">
                                    <tr>
                                        <td>
                                            ${counter.count}
                                        </td>
                                        <td>
                                            ${orderInfo.orderID}
                                        </td>
                                        <td>
                                            <c:set var = "balance" value = "${orderInfo.total}" />
                                            <fmt:setLocale value = "vi_VN"/>
                                            <fmt:formatNumber value = "${balance}" type = "currency"/>
                                        </td>
                                        <td>
                                            <a class="btn btn-dark" href="orderDetail?date=${orderInfo.dateOrder}&orderID=${orderInfo.orderID}&userID=${orderInfo.customerID}&phone=${orderInfo.phoneNumber}&location=${orderInfo.address}&email=${orderInfo.email}&subtotal=${orderInfo.subtotal}&ship=${orderInfo.shipping}&tax=${orderInfo.tax}&total=${orderInfo.total}">View details</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <a class="btn bg-light" href="javascript:history.back()">Back</a>
                </div>
            </div>
        </div>
        <footer class="fixed-bottom py-2 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
