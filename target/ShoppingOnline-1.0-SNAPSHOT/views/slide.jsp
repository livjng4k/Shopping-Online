<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/bootstrap.css" rel="stylesheet"/>
        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="row carousel-holder" style="margin-top: 25px">

            <div class="col-md-12">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <img class="slide-image" style="width: 650px; height: 500px"
                                 src="/ShoppingOnline/hinhanh/${firstBanner.banner}" alt="">
                        </div>
                        <c:forEach var="banner" items="${banner}" end="2">
                            <div class="item">
                                <img class="slide-image" style="width: 650px; height: 500px"
                                     src="/ShoppingOnline/hinhanh/${banner.banner}" alt="">
                            </div>
                        </c:forEach>
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
