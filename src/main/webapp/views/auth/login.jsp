<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script type="text/JavaScript">
        function validateInput(){
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var msg = true; 
            if(username == ""){
                var er = document.getElementById("usernameErMsg").innerHTML = "Please enter Username!";
                msg = false;
            }
            if(password == ""){
               var er = document.getElementById("passwordErMsg").innerHTML = "Please enter Password!";
                msg = false;
            }
            return msg;
        }
        </script>
    </head>
    <body>
    <center>
        <br/> <br/> <br/>
        <h2>Login Here</h2>
        <div style="text-align: center;width: 100%">
            <center>
            <form method="post" action="<c:url value='/j_spring_security_check'/>" onsubmit="return validateInput();">
                <table>
                    <tr>
                        <!--<td colspan="2" style="color: red">${message}</td>-->
                    </tr>
                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" id="username"/></td>
                        <td><p id="usernameErMsg"></p></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" id="password"/></td>
                        <td><p id="passwordErMsg"></p></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Login"/></td>
                    </tr>
                </table>
            </form>
            </center>
        </div>
    </center>
</body>
</html>
