<%-- 
    Document   : index
    Created on : Jan 31, 2022, 6:29:37 PM
    Author     : aqild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <style>
            body{
                margin: 0;
                background-color: white;
                font-family: helvetica, sans serif;
                color: black;
            }
            .container{
                overflow: hidden;
                color: white;
                width: 100%;
                text-align: center;
            }
            .container2{
                overflow: hidden;
                color: black;
                width: 100%;
                text-align: center;
                background-color: white;
                padding: 100px 0px;
            }
            .container3{
                overflow: hidden;
                color: white;
                width: 100%;
                text-align: center;
                background-color:  #562af0;
                padding: 100px 0px;
            }
            .centered{
                position: absolute;
                top: 40%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
            .centered h1{
                font-size: 60px;
            }
            .container img{
                width: 100%;
            }
            .centered img{
                width: 100px;
                height: auto;
                -webkit-transform: scaleX(-1);
                transform: scaleX(-1);
            }
            .centered2{
                width: 80%;
                margin: auto;
            }
            .centered2 p{
                font-size: 18px;
                font-weight: 700;
            }
            .centered2 h1{
                margin-bottom: 50px;
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
            <div class="right-links">
                <a href="loginPage.jsp">Login</a>
            </div>
        </div>
        <div class="container">
            <div class="centered">
                <h1>Merak Kayangan</h1>
                <img src="images/logo.png" >
            </div>
            <img src="images/kija_2.png">
        </div>
        <div class="container2">
            <div class="centered2">
                <h1>About Company Thingy</h1>
                <p>Merak Kayangan was founded in 2021 by a group of students who wanted to ease the process of registering interns that are trying to look for a rewarding job. 
This company is established to provide effective and efficient registering services to ambitious individuals in the next generation. </p>
            </div>
        </div>
        <div class="container3">
            <div class="centered2">
                <h1>About Company Thingy</h1>
                <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
                sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            </div>
        </div>
    </body>
</html>
