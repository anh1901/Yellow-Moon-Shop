<%-- 
    Document   : checkout
    Created on : Oct 11, 2020, 10:46:26 AM
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
        <title>Yellow Moon Shop-Your cart</title>
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
        <form action="${initParam['posturl']}" method="POST">
            <div class="container" style="padding-top: 10%; padding-bottom: 35%">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6">
                        <h1>Order</h1>We need some of your info for shipping.
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <td>
                                        Name:
                                    </td>
                                    <td>
                                        <input type="text" name="customerName" value="${sessionScope.USER.userName}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Phone:
                                    </td>
                                    <td>
                                        <input type="text" name="customerPhone" value="${sessionScope.USER.phoneNumber}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Location:
                                    </td>
                                    <td>
                                        <input type="text" name="customerAddress" value="${sessionScope.USER.address}" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email:
                                    </td>
                                    <td>
                                        <input type="text" name="customerEmail" value="${sessionScope.USER.email}" required>
                                    </td>
                                </tr>
                                <c:if test="${sessionScope.USER.role eq 'GUEST'}">
                                    <tr>
                                        <td></td>
                                        <td>
                                            Have an account? <a href="login.jsp">Login now</a> for discount.
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <h1>Order detail</h1>
                        <c:set var="cart" value="${sessionScope.CART}"/>
                        <c:if test="${empty cart.items}">
                            <h1 style="color: red">No products yet. Shopping for more!!</h1>
                        </c:if>
                        <c:if test="${not empty cart.items}">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${cart.items}" varStatus="counter">
                                        <c:set var="productsInfo" value="${sessionScope.PRODUCTS}"/>
                                        <c:forEach var="productInfo" items="${productsInfo}">
                                            <c:if test="${item.key eq productInfo.productId}">
                                                <tr>
                                                    <td>
                                                        ${counter.count}                
                                                    </td>
                                                    <td>
                                                        ${productInfo.name}
                                                        <input type="hidden" name="item_name_${counter.count}" value="${productInfo.name}">
                                                    </td>
                                                    <td>
                                                        ${item.value}
                                                        <input type="hidden" name="quantity_${counter.count}" value="${item.value}">
                                                    </td>
                                                    <td>
                                                        <c:set var = "balance" value = "${productInfo.price*item.value}" />
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "${balance}" type = "currency"/>
                                                        <input type="hidden" name="amount_${counter.count}" value="${productInfo.price/23000}">
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
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
                                            <c:set var = "ship" value = "${param.subtotal*0.05}" />
                                            <fmt:formatNumber value = "${ship}" type = "currency"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <strong>Tax:</strong>
                                        </td>
                                        <td></td><td></td>
                                        <td>
                                            <c:set var = "tax" value = "${param.subtotal*0.1}" />
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
                                                <c:set var = "realTotal" value = "${(subtotal+ship+tax)}" />
                                    <strike><fmt:formatNumber value = "${realTotal}" type = "currency"/></strike>
                                    </td>
                                </c:if>
                                <c:if test="${sessionScope.USER.role ne 'USER'}">
                                    <td></td><td></td>
                                </c:if>
                                <td>
                                    <c:set var = "realTotal" value = "${(subtotal+ship+tax)*0.9}" />
                                    <fmt:formatNumber value = "${realTotal}" type = "currency"/>
                                </td>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>
                <input type="hidden" name="business" value="${initParam['business']}" >    
                <input type="hidden" name="return" value="${initParam['returnurl']}">
                <input type="hidden" name="upload" value="1">
                <input type="hidden" name="cmd" value="_cart">
                <c:set var="subtotal" value="${subtotal}" scope="session"/>
                <c:set var="ship" value="${ship}" scope="session"/>
                <c:set var="tax" value="${tax}" scope="session"/>
                <c:set var="realTotal" value="${realTotal}" scope="session"/>
                <c:set var="customerID" value="${sessionScope.USER.userId}" scope="session"/>
                <c:set var="customerAddress" value="${sessionScope.USER.address}" scope="session"/>
                <c:set var="customerPhone" value="${sessionScope.USER.phoneNumber}" scope="session"/>
                <c:set var="customerEmail" value="${sessionScope.USER.email}" scope="session"/>
                <input class="btn btn-dark" type="submit" value="Check out with Paypal">
            </div>
        </form>
        <footer class="fixed-bottom py-2 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>