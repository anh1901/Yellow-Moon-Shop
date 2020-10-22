<%-- 
    Document   : detail
    Created on : Oct 9, 2020, 9:56:37 AM
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
        <title>Yellow Moon Shop-Detail</title>
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
                            <a class="nav-link" href="../createAccess">Create Cake</a>
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
        <br><br>
        <div class="container">
            <form action="${pageContext.request.contextPath}/update" method="POST" accept-charset="UTF-8">
                <h3>Update cake</h3>
                <div class="form-group">
                    Photo:(must re-up)
                    <input class="form-control" type="file" name="photo" required  >
                </div>
                <div class="form-group">
                    Name:
                    <input class="form-control" type="text" name="cakeName" value="${param.name}" required >
                </div>
                <div class="form-group">
                    Price:
                    <input class="form-control" type="text" name="cakePrice" value="${param.price}" required>
                </div>
                <div class="form-group">
                    Category:
                    <select class="form-control" name="category">
                        <c:forEach items="${requestScope.categories}" var="category">
                            <option <c:if test="${param.categoryID eq category.categoryID}">selected="selected"</c:if> value="${category.categoryID}">
                                ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    Quantity:
                    <input class="form-control" type="number" name="quantity" min="0" max="1000" value="${param.quantity}" required >
                </div>
                <div class="form-group">
                    Description:
                    <input class="form-control" type="text" name="description" maxlength="1500" value="${param.description}" required>
                </div>
                <div class="form-group">
                    Start date:
                    <input class="form-control" type="text" name="startDate" value="${param.date}" required>
                    <c:if test="${not empty requestScope.ERROR1}">
                        <p style="color: red">${requestScope.ERROR1}</p>
                    </c:if>
                </div>
                <div class="form-group">
                    Expire date:
                    <input class="form-control" type="text" name="expireDate" value="${param.dateExpire}" required>
                    <c:if test="${not empty requestScope.ERROR2}">
                        <p style="color: red">${requestScope.ERROR2}</p>
                    </c:if>
                </div>
                <div class="form-group">
                    Status:
                    <select class="form-control" name="status">
                        <option value="Active" <c:if test="${param.status eq 'Active'}">selected="true"</c:if> >Active</option>
                        <option value="Deleted" <c:if test="${param.status eq 'Deleted'}">selected="true"</c:if> >Deleted</option>
                    </select>
                </div>
                <a class="btn btn-dark" href="javascript:history.go(-1)">Go back</a>
                <input type="hidden" value="${param.productId}" name="productId">
                <input class="btn btn-dark" type="submit" value="Update cake">
            </form>
        </div>
        <br><br>
        <footer class="fixed-bottom py-2 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; Yellow Moon Shop 2020</p>
            </div>
        </footer>
        <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

