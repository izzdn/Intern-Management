<%-- 
    Document   : loginPage
    Created on : Feb 7, 2022, 11:16:13 AM
    Author     : aqild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <style>
            body{
                margin: 0;
                background-color: white;
                font-family: arial, sans-serif;
                color: black;
            }
            .container{
                width: 1200px;
                margin: 100px auto;
                margin-top: 300px;
                text-align: center;
            }
            button{
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
                margin-bottom: 50px;
                color: #fff;
            }
            img{
                width: 150px;
                height: auto;
                position: absolute;
                top: 33%;
                left: 60%;
            }
            h1{
                font-size: 60px;
                margin-bottom: 70px;
            }
        </style>
    </head>
    <body>
        <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
            </div>
        </div>
        <div class="container">
            <h1>Merak Kayangan</h1>
            <img src="images\logo3.png" >
            <a href="loginUser.jsp"><button>Login as User</button></a>
            <a href="loginAdmin.jsp"><button>Login as Admin</button></a>
        </div>
    </body>
</html>
