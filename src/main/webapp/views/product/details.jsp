

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"></jsp:include>  
    <body>
        <h2>Product Information</h2>
        <a href="./index" >Back</a>
        <table>
            <tr>
                <td>ID :</td>
                <td>${product.id}</td>
            </tr>
            <tr>
                <td>Name :</td>
                <td>${product.name}</td>
            </tr>
            <tr>
                <td>Description :</td>
                <td>${product.description}</td>
            </tr>
            <tr>
                <td>Price :</td>
                <td>${product.price}</td>
            </tr>
            <tr>
                <td>Thumnail :</td>
                <td><img src="/ShoppingOnline/hinhanh/${product.thumnail}" style="width: 10%; height: 10%"/></td>
            </tr>
            <tr>
                <td>Category :</td>
                <td>${product.category.name}</td>
            </tr>
        </table>
    </body>

</html>
