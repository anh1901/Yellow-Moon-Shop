<%-- 
    Document   : test
    Created on : Oct 6, 2020, 2:30:19 PM
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
                            <a class="nav-link" href="#">Home
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
                        <c:if test="${sessionScope.USER.role eq 'USER' || sessionScope.USER.role eq 'ADMIN'}">
                            <li class="nav-item">
                                <a class="nav-link" href="logout">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav><br>
        <form action="search" method="POST">
            <div class="container">
                <div class="row">
                    <div class="col-xs-6 col-sm-1 col-md-1 col-lg-1">
                        Name:
                    </div>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-2">
                        <input type="text" class="form-control" placeholder="Name" name="searchName" value="${param.searchName}" maxlength="50">
                    </div>
                    <div class="col-xs-6 col-sm-1 col-md-1 col-lg-1">
                        Price:
                    </div>
                    <div class="col-xs-6 col-sm-2 col-md-3 col-lg-1">
                        <input type="number" class="form-control" placeholder="min" name="priceMin" value="${param.priceMin}" min="0" maxlength="8">
                    </div>
                    <div class="col-xs-6 col-sm-1 col-md-1 col-lg-1">
                        ->
                    </div>
                    <div class="col-xs-6 col-sm-2 col-md-3 col-lg-1">
                        <input type="number" class="form-control" placeholder="max" name="priceMax" value="${param.priceMax}" min="0" maxlength="8">
                    </div>
                    <div class="col-xs-6 col-sm-2 col-md-1 col-lg-1">
                        Category:
                    </div>
                    <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                        <select type="text" class="form-control" name="categoryChoice">
                            <option value="All">
                                All category
                            </option>
                            <c:forEach items="${requestScope.categories}" var="category">
                                <option value="${category.name}">
                                    ${category.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="submit" value="Search" class="btn btn-dark">
                </div>
            </div>
        </form>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <h1 class="my-4">Enjoy!</h1>
                    <div class="list-group">
                        <a href="yellowMoonShop" class="list-group-item">All products</a>
                        <c:if test="${! empty requestScope.categories}">
                            <c:forEach items="${requestScope.categories}" var="category">
                                <a href="yellowMoonShop?category=${category.categoryID}" class="list-group-item">${category.name}</a>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>

                <div class="col-lg-9">
                    <h1 class="my-4">Best sell</h1>
                    <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#" data-slide-to="0" class="active"></li>
                            <li data-target="#" data-slide-to="1"></li>
                            <li data-target="#" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img style="width: 100%;height:400px" class="d-block img-fluid" src="images/timthumb.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img style="width: 100%;height:400px" class="d-block img-fluid" src="images/bánh-đậu-xanh-440x440.png" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img style="width: 100%;height:400px" class="d-block img-fluid" src="images/deo-thap-cam.png" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="row">
                        <c:if test="${empty requestScope.products}">
                            <h1 style="color: red">No products found.</h1> 
                        </c:if>
                        <c:if test="${not empty requestScope.products}">
                            <c:forEach items="${requestScope.products}" var="product">
                                <div class="col-lg-4 col-md-6 mb-4">
                                    <div class="card h-100">
                                        <a href="productdetail.jsp?productId=${product.productId}&name=${product.name}&price=${product.price}&date=${product.date}&dateExpire=${product.dateExpire}&price=${product.price}&photo=${product.photo}&description=${product.description}&quantity=${product.quantity}"><img class="card-img-top" src="images/${product.photo}" alt=""></a>
                                        <div class="card-body">
                                            <h4 class="card-title">
                                                <a href="productdetail.jsp?productId=${product.productId}&name=${product.name}&price=${product.price}&date=${product.date}&dateExpire=${product.dateExpire}&price=${product.price}&photo=${product.photo}&description=${product.description}&quantity=${product.quantity}">${product.name}</a>
                                            </h4>
                                            <c:set var = "balance" value = "${product.price}" />
                                            <fmt:setLocale value = "vi_VN"/>
                                            <h5>
                                                <fmt:formatNumber value = "${balance}" type = "currency"/>
                                            </h5>
                                            <p class="card-text">${product.description}</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <ul class="pagination">
                        <c:if test="${not empty query}">
                            <c:set var="stringQuery" value="&category=${requestScope.query}"/>
                        </c:if>
                        <c:if test="${requestScope.currentPage != 1 && requestScope.products.size() ==0}">
                            <li><a href="yellowMoonShop?page=${requestScope.currentPage-1}${requestScope.stringQuery}"><<</li>
                            </c:if>
                            <c:forEach begin="1" end="${requestScope.numberOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${requestScope.currentPage == i}">
                                    <li class="active"><a href="">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="yellowMoonShop?page=${i}${stringQuery}">${i}</a></li> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>    
                            <c:if test="${requestScope.currentPage lt requestScope.numberOfPages}">
                            <li><a href="yellowMoonShop?page=${requestScope.currentPage+1}${requestScope.stringQuery}">>></li>
                            </c:if>
                    </ul>
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

