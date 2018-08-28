<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <h1>Giỏ hàng</h1>
        <a href="../home/index">Tiếp tục mua hàng</a>
        <p style="color: red">${msg}</p>
    <s:if test="myCart.size() > 0">
        <table>
            <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Thao tác</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="row" items="${myCart}">
                    <tr>
                        <td>${row.product.name}</td>
                        <td>${row.quantity}</td>
                        <td>
                            <a href="./order?id=${row.product.id}&quantity=1">+</a>
                            <a href="./order?id=${row.product.id}&quantity=-1">-</a>
                            <a href="./remove?id=${row.product.id}">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                    <tr>
                        <td style="font-weight: bold">Tổng Cộng:</td>
                        <td>
                            <fmt:formatNumber currencySymbol="$" type="number" maxFractionDigits="0" value="${total}"/> VNĐ
                        </td>
                    </tr>
            </tbody>
        </table>
        <a href="./payment">Thanh toán</a>
    </s:if>
    </body>
</html>
