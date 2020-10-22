<%-- 
    Document   : orderdetail
    Created on : Oct 12, 2020, 9:47:18 AM
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
        <title>Yellow Moon -Order detail</title>
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
                        <li class="nav-item active">
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
                        <c:if test="${sessionScope.USER.role eq 'USER' || sessionScope.USER.role eq 'ADMIN'}">
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
                <div class="col-md-6">
                    <h1>Order</h1>
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <td>
                                    Customer ID:
                                </td>
                                <td>
                                    ${param.userID}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone:
                                </td>
                                <td>
                                    ${param.phone}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Location:
                                </td>
                                <td>
                                    ${param.location}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email:
                                </td>
                                <td>
                                    ${param.email}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Order Date:
                                </td>
                                <td>
                                    ${param.date}
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="col-md-6">
                    <h1>Order detail</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th colspan="2">Product id</th>
                                <th>Quantity</th>
                                <th>Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="orderInfo" items="${requestScope.DETAILS}">
                                <c:if test="${param.orderID eq orderInfo.orderID}">
                                    <tr>
                                        <td colspan="2">
                                            ${orderInfo.productID}
                                        </td>
                                        <td>
                                            ${orderInfo.quantity}
                                        </td>
                                        <td>
                                            <c:set var = "balance" value = "${orderInfo.price}" />
                                            <fmt:setLocale value = "vi_VN"/>
                                            <fmt:formatNumber value = "${balance}" type = "currency"/>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            <tr>
                                <td>
                                    <strong>Total:</strong>
                                </td>
                                <td></td><td></td>
                                <td>
                                    <c:set var = "subtotal" value = "${param.subtotal}" />
                                    <fmt:formatNumber value = "${subtotal}" type = "currency"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Shipping cost:</strong>
                                </td>
                                <td></td><td></td>
                                <td>
                                    <c:set var = "ship" value = "${param.ship*0.1}" />
                                    <fmt:formatNumber value = "${ship}" type = "currency"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Tax:</strong>
                                </td>
                                <td></td><td></td>
                                <td>
                                    <c:set var = "tax" value = "${param.tax}" />
                                    <fmt:formatNumber value = "${tax}" type = "currency"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <strong>Total:</strong>
                                </td>
                                <c:if test="${sessionScope.USER.role eq 'USER'}">
                                    <td>Discount: 10%</td>
                                    <td>
                                        <c:set var = "realTotal" value = "${param.total}" />
                            <strike><fmt:formatNumber value = "${realTotal*1.1}" type = "currency"/></strike>
                            </td>
                        </c:if>
                        <c:if test="${sessionScope.USER.role ne 'USER'}">
                            <td></td><td></td>
                        </c:if>
                        <td>
                            <c:set var = "realTotal" value = "${param.total}" />
                            <fmt:formatNumber value = "${realTotal}" type = "currency"/>
                        </td>
                        </tr>
                        </tbody>
                    </table>
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