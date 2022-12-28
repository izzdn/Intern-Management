<%-- 
    Document   : registerUser
    Created on : Feb 6, 2022, 11:26:25 PM
    Author     : aqild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
                <a href="intern.jsp">Internship</a>
            </div>
            <div class="right-links">
                <a href="loginUser.jsp">Login</a>
            </div>
        </div>
        <div class="container">
            <h1>Sign Up</h1>
            <p>Already have an account?<a href="loginUser.jsp">Login</a></p>
            <form action="RegisterUserServlet" method="post">
                <input type="text" name="uemail" placeholder="Email Address"><br>
                <input type="text" name="ufname" placeholder="Full Name"><br>
                <input type="password" name="upassword" placeholder="Password"><br>
                <input type="submit" name="signup" value="Sign Up">
            </form>
        </div>
    </body>
</html>
