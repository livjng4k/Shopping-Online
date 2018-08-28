<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register User</title>
    <script type="text/JavaScript">
        function validateInput(){
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var msg = ""; 
            var passwordEr = "";
            if(username == ""){
                msg+="\nPlease enter Username!";
            }
            if(password == ""){
                msg+="\nPlease enter password!";
            }
            if(!(msg == "")){
                return false;
            }
        }
    </script>
</head>
<body>
<center>
    <br/> <br/> <br/>
    <h2>Sign Up</h2>
    <br/>
    <div style="text-align: center; padding: 30px; border: 1px solid green; width: 300px">
        <form action="./register" method="post" onsubmit="return validateInput();">
            <table>
                <tr>
                    <td colspan="2" style="color: red">${message}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Username</td>
                    <td><input type="text" name="username" id="username" /></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Password</td>
                    <td><input type="password" name="password" id="password"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Re-Password</td>
                    <td><input type="password" name="repassword" id="repassword"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Sign Up"/></td>
                </tr>
            </table>
        </form>
    </div>
</center>
</body>
</html>
