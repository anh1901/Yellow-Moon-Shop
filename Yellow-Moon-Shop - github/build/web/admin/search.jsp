<%-- 
    Document   : index
    Created on : Oct 7, 2020, 5:10:53 PM
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
        <title>Yellow Moon Shop-Search</title>
        <link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/index.jsp">Yellow Moon Shop</a>
                <c:if test="${not empty sessionScope.USER}">
                    Welcome ${sessionScope.USER.userName}
                </c:if>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/index.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/createAccess">Create Cake</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Update cake</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/trackOrder">View orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/log">View logs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <form action="${pageContext.request.contextPath}/search" method="POST">
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
                                <c:forEach items="${categories}" var="category">
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
            <br>
            <c:if test="${not empty requestScope.MSG}">
                <h4 style="color: red">${requestScope.MSG}</h4>
            </c:if>
            <div class="container" style="padding-top: 10%; padding-bottom: 35%">
                <div class="row d-flex justify-content-center">
                    <div class="col-md-12">
                        <c:if test="${empty requestScope.products}">
                            <h1 style="color: red">No product found</h1>
                        </c:if>
                        <c:if test="${not empty requestScope.products}">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th colspan="2">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <form action="${pageContext.request.contextPath}/delete" method="Post">
                                    <c:forEach var="product" items="${requestScope.products}" varStatus="counter">
                                        <tr>
                                            <td>
                                                ${counter.count}
                                            </td>
                                            <td>
                                                ${product.name}
                                            </td>
                                            <td>
                                                ${product.quantity}
                                            </td>
                                            <td>
                                                <c:set var = "balance" value = "${product.price}" />
                                                <fmt:setLocale value = "vi_VN"/>
                                                <fmt:formatNumber value = "${balance}" type = "currency"/>
                                            </td>
                                            <td>
                                                ${product.status}
                                            </td>
                                            <td>
                                                <a href="detailAccess?productId=${product.productId}&status=${product.status}&categoryID=${product.categoryID}&name=${product.name}&date=${product.date}&dateExpire=${product.dateExpire}&price=${product.price}&photo=${product.photo}&description=${product.description}&quantity=${product.quantity}">
                                                    View detail</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </form>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                    <ul class="pagination">
                        <c:if test="${requestScope.currentPage != 1 && requestScope.products.size() ==0}">
                            <li><a href="search?page=${requestScope.currentPage-1}&searchName=${param.searchName}&priceMin=${param.priceMin}&priceMax=${param.priceMax}&categoryChoice=${param.categoryChoice}"><<</li>
                            </c:if>
                            <c:forEach begin="1" end="${requestScope.numberOfPages}" var="i">
                                <c:choose>
                                    <c:when test="${requestScope.currentPage == i}">
                                    <li class="active"><a href="">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a href="search?page=${i}&searchName=${param.searchName}&priceMin=${param.priceMin}&priceMax=${param.priceMax}&categoryChoice=${param.categoryChoice}">${i}</a></li> 
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>    
                            <c:if test="${requestScope.currentPage lt requestScope.numberOfPages}">
                            <li><a href="search?page=${requestScope.currentPage+1}&searchName=${param.searchName}&priceMin=${param.priceMin}&priceMax=${param.priceMax}&categoryChoice=${param.categoryChoice}">>></li>
                            </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <footer class="fixed-bottom py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
