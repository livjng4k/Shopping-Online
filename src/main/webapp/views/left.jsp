<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/bootstrap.css" rel="stylesheet"/>
        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="col-md-3">
            <div class="list-group" style="margin-top: 125px">
                <c:forEach var="cate" items="${listCate}">
                <a href="./show?cateId=${cate.id}" class="list-group-item">${fn:toUpperCase(cate.name)}</a>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
