<%-- 
    Document   : cart
    Created on : Oct 7, 2020, 10:13:37 AM
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
                            <a class="nav-link" href="cart.jsp">Your cart</a>
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
                <h1>Your cart</h1>
                <div class="col-md-12">
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
                                    <th>Remove</th>
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
                                                </td>
                                                <td>
                                                    <form action="changeQuantity" method="POST">
                                                        <c:set var="oldNumber" value="${item.value}"/>
                                                        <input type="number" min="1" max="${productInfo.quantity}" value="${item.value}" name="number">
                                                        <input type="hidden" name="oldNumber" value="${oldNumber}">
                                                        <input type="hidden" name="price" value="${productInfo.price}">
                                                        <input type="hidden" name="productID" value="${productInfo.productId}">
                                                        <input class="btn bg-light" type="submit" value="Apply">
                                                    </form>
                                                </td>
                                                <td>
                                                    <c:set var = "balance" value = "${productInfo.price*item.value}" />
                                                    <fmt:setLocale value = "vi_VN"/>
                                                    <fmt:formatNumber value = "${balance}" type = "currency"/>
                                                </td>
                                                <td>
                                                    <form action="removeProduct" method="Post">
                                                        <a href="#myModal" class="btn trigger-btn" data-toggle="modal">Remove</a>
                                                        <%--cofirmation modal--%>
                                                        <div id="myModal" class="modal fade">
                                                            <div class="modal-dialog modal-confirm">
                                                                <div class="modal-content">
                                                                    <div class="modal-header flex-column">
                                                                        <h4 class="modal-title w-100">Are you sure?</h4>	
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <p>Do you really want to remove this from your cart? This process cannot be undone.</p>
                                                                    </div>
                                                                    <div class="modal-footer justify-content-center">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                                        <input type="hidden" name="productID" value="${productInfo.productId}"/>
                                                                        <input type="submit" class="btn btn-danger" value="Remove"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>   
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                                <tr>
                                    <td>
                                        Total:
                                    </td>
                                    <td></td><td></td>
                                    <td>
                                        <c:set var = "balance" value = "${sessionScope.CART.getTotalMoney()}" />
                                        <fmt:setLocale value = "vi_VN"/>
                                        <fmt:formatNumber value = "${balance}" type = "currency"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <a class="btn bg-light" href="yellowMoonShop">Back</a>
                    <a class="btn bg-light" href="checkout.jsp?subtotal=${balance}">Order</a>
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
