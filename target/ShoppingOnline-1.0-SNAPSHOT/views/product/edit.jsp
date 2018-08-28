<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
        <body>
            <h1>Edit Product</h1>
            <a href="./index" >Back</a>
        <form:form action="./edit" method="POST" modelAttribute="product" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><form:label path="id">id</form:label></td>
                    <td><form:input path="id" readonly="true"/></td>
                </tr>
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name"/></td>
                </tr>
                <tr>
                    <td><form:label path="description" lang="VN">Description</form:label></td>
                    <td><form:input path="description"/></td>
                </tr>
                <tr>
                    <td><form:label path="price">Price</form:label></td>
                    <td><form:input path="price"/></td>
                </tr>
                <tr>
                    <td><form:label path="thumnail">Image</form:label>
                    <img src="/ShoppingOnline/hinhanh/${product.thumnail}" style="width: 10%; height: 10%"/>
                    </td>
                    
                    <td><input type="file" name="file"/>
                        <form:hidden path="thumnail"></form:hidden>
                    </td>
                    
                </tr>
                <tr>
                    <td><form:label path="category.id">Danh mục</form:label></td>
                        <td>
                        <form:select path="category.id">
                    <option value="-1">Select a type</option>
                    <c:forEach items="${listCate}" var="item">
                        <c:choose>
                            <c:when test = "${item.id == product.category.id}">
                                <option value="${item.id}" selected="true">${item.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${item.id}">${item.name}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </form:select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form:form>
</body>
</html>
