<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../resources/css/bootstrap.css" rel="stylesheet"/>
    <script src="../resources/js/jquery.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header" style="font-weight: bold; font-size: larger">
                <a class="navbar-brand" href="../home/index">BG Shop</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="principal" property="principal"/>
                        <a href="#"><span class="glyphicon glyphicon-user"></span>
                            ${fn:toUpperCase(principal.username)}
                        </a>
                    </sec:authorize>

                    <sec:authorize access="!isAuthenticated()">
                        <a href="../auth/register"><span class="glyphicon glyphicon-user"></span>
                            Đăng ký
                        </a>
                    </sec:authorize>
                </li>
                <li>
                    <c:url value="/j_spring_security_logout" var="logoutUrl"/>
                    <sec:authorize access="isAuthenticated()">
                        <a href="${logoutUrl}"><span class="glyphicon glyphicon-user"></span>
                            Thoát
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a href="../auth/login"><span class="glyphicon glyphicon-user"></span>
                            Đăng nhập
                        </a>
                    </sec:authorize>
                </li>
                <li>
                    <a href="../shop/index" style="font-weight: bold">
                        <img src="/ShoppingOnline/hinhanh/cart-icon.png" style="height: 20px; width: 20px">
                        GIỎ HÀNG
                    </a>

                </li>
            </ul>
        </div>
        </div>
    </nav>
</body>
</html>
