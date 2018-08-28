<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
    <body>
        <h1>Danh mục</h1>      
        <a href="create">Tạo mới</a>       
        <s:if test="listCate.size() > 0">
                <table>
                <thead>
                    <tr>
                        <th>Mã số</th>
                        <th>Tên</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${listCate}">
                        <tr>
                            <td><c:out value="${row.id}"/></td>
                            <td><c:out value="${row.name}"/></td>
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
