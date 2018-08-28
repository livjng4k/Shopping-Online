<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../header.jsp"></jsp:include>  
    <title>BG Shop - ${product.name}</title>
</head>
    <body>
        <jsp:include page="../nav.jsp"></jsp:include>
        <div class="container">
        <div class="row">
            <jsp:include page="../left.jsp"></jsp:include>
            <div class="col-md-9">
                <div class="thumbnail" style="margin-top: 75px">
                    <img class="img-responsive" src="/ShoppingOnline/hinhanh/${product.thumnail}" alt=""
                     style="width: 500px; height: 500px">
                    <div class="caption-full">
                        <h4 class="pull-right">
                            <fmt:formatNumber currencySymbol="$" type="number" maxFractionDigits="0" value="${product.price}"/> VNĐ
                        </h4>
                        <h4>${product.name}</h4>
                        <p>${product.description}</p>
                        <a href="../shop/order?id=${product.id}&quantity=1">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
    </body>
</html>
