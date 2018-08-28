<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
        <body>
            <h1>Danh sách sản phẩm</h1>      
            <a href="create">Tạo mới</a>       
        <s:if test="listProduct.size() > 0">
            <table border="1">
                <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Mô tả</th>
                        <th>Giá</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="row" items="${listProduct}">
                    <tr>
                        <td><c:out value="${row.id}"/></td>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.description}"/></td>
                        <td><c:out value="${row.price}"/></td>
                        <td>
                            <a href="./details?id=${row.id}" >Details</a>
                            <a href="./edit?id=${row.id}" >Edit</a>
                            <a href="./delete?id=${row.id}" >Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </s:if>       
</body>
</html>
