<%-- 
    Document   : loginAdmin
    Created on : Jan 31, 2022, 6:29:46 PM
    Author     : aqild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <style>
            body{
                margin: 0;
                background-color: white;
                font-family: Dmsans,sans-serif;
                color: black;
            }
            .container{
                color: black;
                max-width: 1200px;
                display: block;
                margin-top: 150px;
                margin-left: auto;
                margin-right: auto;
                text-align: center;
            }
            .container input[type=text]{
                width: 35%;
                margin-bottom: 20px;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
            }
            .container input[type=password]{
                width: 35%;
                margin-bottom: 20px;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
            }
            .container input[type=submit]{
                font-family: Dmsans,sans-serif;
                padding: 20px 70px;
                text-align: center;
                flex: 0;
                border-radius: 999px;
                background-color: #562af0;
                box-shadow: -5px 30px 20px -20px rgba(86,93,113,.38);
                border: 0;
                font-size: 16px;
                font-weight: bold;
                margin-top: auto;
                margin-bottom: auto;
                color: #fff;
                text-align: center;
                margin-right: 255px;
            }
            .container a{
                text-decoration: none;
                color: #116dff;
                margin-left: 5px;
            }
            .container a,h1,p{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
                <a href="intern.jsp">Internship</a>
            </div>
        </div>
        <div class="container">
            <h1>Login Admin</h1>
            <p>Don't have an account?<a href="registerAdmin.jsp">Sign Up</a></p>
            <form action="LoginAdminServlet" method="post">
                <input type="text" name="aemail" placeholder="Email Address"><br>
                <input type="password" name="apassword" placeholder="Password"><br>
                <input type="submit" name="login" value="Login">
            </form>
        </div>
    </body>
</html>
