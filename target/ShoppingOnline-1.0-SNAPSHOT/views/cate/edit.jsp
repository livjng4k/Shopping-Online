<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
    <body>
        <h1>Edit Categories</h1>
        <a href="./index" >Back</a>
        <form:form action="./edit" method="POST" modelAttribute="category">
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
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>
    </body>
</html>
