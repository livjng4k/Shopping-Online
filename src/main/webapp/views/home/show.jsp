<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp"></jsp:include>  
    <title>${fn:toUpperCase(title)}</title>
</head>
    <body>
    <jsp:include page="../nav.jsp"></jsp:include>  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/shop-homepage.css" rel="stylesheet">

        <div class="container" style="margin-top: 65px">
            <div class="row">
            <jsp:include page="../left.jsp"></jsp:include>  
                <div class="col-md-9">
                    <div class="row">
                        <!-- show product-->
                    <c:forEach var="row" items="${listProduct}">
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <a href="./details?id=${row.id}">
                                    <img src="/ShoppingOnline/hinhanh/${row.thumnail}" alt="" style="width: 295px; height: 295px"/>
                                </a>
                                <div class="caption">
                                    <h4 class="pull-right">
                                        <fmt:formatNumber currencySymbol="$" type="number" maxFractionDigits="0" value="${row.price}"/>
                                        VNĐ
                                    </h4>
                                    <h4><a href="./details?id=${row.id}">${row.name}</a>
                                    </h4>
                                    <p>${fn:substring(row.description, 0, 65)} <br/>
                                        <a href="../shop/order?id=${row.id}&quantity=1">MUA NGAY</a>.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- end of show product-->
                </div>
                <div class="row">
                    <div style="align-content: flex-end">
                        <c:if test="${not empty SearchError}">
                            <h3>${SearchError}</h3>
                        </c:if>
                        <c:if test="${empty SearchError}">
                            <c:if test="${page > 0}">
                                <a href="./show?page=${page-1}&cateId=${cateId}">Previous</a>
                            </c:if>
                            |
                            <c:if test="${page + 1 < pageNumber}">
                                <a href="./show?page=${page+1}&cateId=${cateId}">Next</a>
                            </c:if>
                            <p>Page ${page + 1}/${pageNumber}</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
