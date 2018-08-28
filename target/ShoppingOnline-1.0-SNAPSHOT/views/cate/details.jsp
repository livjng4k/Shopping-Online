

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
    <body>
        <h2>Categories Information</h2>
        <a href="./index" >Back</a>
        <table>
            <tr>
                <td>ID :</td>
                <td>${category.id}</td>
            </tr>
            <tr>
                <td>Name :</td>
                <td>${category.name}</td>
            </tr>
        </table>
    </body>

</html>
