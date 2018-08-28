
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
        <body>
            <h3>Welcome, Enter The Product Details</h3>
            <a href="./index" >Back</a>
        <form:form method="POST" action="./create" modelAttribute="product" enctype="multipart/form-data">
            <table>
                <tr>
                    <td><form:label path="name">Name</form:label></td>
                    <td><form:input path="name"/></td>
                </tr>
                <tr>
                    <td><form:label path="description">Description</form:label></td>
                    <td><form:input path="description"/></td>
                </tr>
                <tr>
                    <td><form:label path="price">Price</form:label></td>
                    <td><form:input path="price"/></td>
                </tr>
                <tr>
                    <td>Upload Image :</td>
                    <td><input type="file" name="file" /></td>
                </tr>
                <tr>
                    <td><form:label path="category.id">Danh mục</form:label></td>
                        <td>
                        <form:select path="category.id">
                    <option value="-1">Select a type</option>
                    <c:forEach items="${listCate}" var="item">
                        <option value="${item.id}">${item.name}</option>
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
