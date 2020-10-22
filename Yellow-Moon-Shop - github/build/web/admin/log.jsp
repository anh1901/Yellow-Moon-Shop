<%-- 
    Document   : log
    Created on : Oct 13, 2020, 2:34:40 PM
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
        <title>Yellow Moon Shop-Lunar Cake</title>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/index.jsp">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/createAccess">Create Cake</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/search.jsp">Update cake</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/trackOrder">View orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">View logs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="padding-top: 10%; padding-bottom: 35%">
            <div class="row d-flex justify-content-center">
                <h1>Logs</h1>
                <div class="col-md-12">
                    <c:set var="name" value="${requestScope.MAPNAME}"/>
                    <c:set var="log" value="${requestScope.MAPLOG}"/>
                    <table class="table table-hover">
                        <tbody>
                            <c:forEach var="name" items="${name}" varStatus="counter">
                                <c:forEach var="log" items="${log}" varStatus="counter">
                                    <tr><td>${counter.count}. ${name.value} updated product with ID(${log.value.productID}) at ${log.value.updateDate}</td></tr>
                                </c:forEach>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a class="btn bg-light" href="javascript:history.back()">Back</a>
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

