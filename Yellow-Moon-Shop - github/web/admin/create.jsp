<%-- 
    Document   : create
    Created on : Oct 7, 2020, 7:42:45 PM
    Author     : DELL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Yellow Moon Shop">
        <meta name="author" content="Anh">
        <title>Yellow Moon Shop-Create</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/shop-homepage.css" rel="stylesheet">
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
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin.index.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Create Cake</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/search.jsp">Update cake</a>
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
        <br><br>
        
        <div class="container">
            <form action="${pageContext.request.contextPath}/createCake" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
                <h3>Create a cake</h3>
                <div class="form-group">
                    Name:
                    <input class="form-control" type="text" name="cakeName" required>
                </div>
                <div class="form-group">
                    Price:
                    <input class="form-control" type="text" name="cakePrice" required>
                </div>
                <div class="form-group">
                    Category:
                    <select class="form-control" name="category">
                        <c:forEach items="${requestScope.categories}" var="category">
                            <option>
                                ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    Quantity:
                    <input class="form-control" type="number" name="quantity" min="0" max="1000" required >
                </div>
                <div class="form-group">
                    Description:
                    <input class="form-control" type="text" name="description" maxlength="1500" required>
                </div>
                <div class="form-group">
                    Start date:
                    <input class="form-control" type="date" name="startDate" min="${requestScope.TODAY}" required>
                </div>
                <div class="form-group">
                    Expire date:
                    <input class="form-control" type="date" name="expireDate" min="${requestScope.TODAY}" required>
                </div>
                <div class="form-group">
                    Photo:
                    <input class="form-control" type="file" name="photo" accept="image/x-png,image/gif,image/jpeg" required>
                </div>
                <input class="btn btn-dark" type="submit" value="Create cake">
            </form>
        </div>
        </br>
        <footer class="fixed-bottom py-5 bg-dark ">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>