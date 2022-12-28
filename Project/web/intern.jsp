<%-- 
    Document   : internApp
    Created on : Jan 31, 2022, 9:45:15 PM
    Author     : aqild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Internship</title>
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
                border: 5px solid #562af0;
                animation-name: brdr;
                animation-duration: 5s;
                animation-iteration-count: infinite;
                text-align: center;
            }
            .container h1{
                text-align: center;
                font-size: 60px;
            }
            @keyframes brdr {
                from {border: 5px solid #562af0;}
                to {border: 5px solid yellow;}
            }
            .content{
                display: inline-block;
                width: 400px;
                margin: 0px 7px 0px 7px;
                margin-top: 25px;
                margin-bottom: 50px;
                border: 5px solid #562af0;
                padding: 15px;
            }
            .content p{
                font-size: 18px;
                margin: 0;
                margin-bottom: 5px;
            }
            .content p, h2{
                text-align: left;
            }
            .content h2{
                margin: 0;
                margin-bottom: 10px;
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
            .content img{
                position: absolute;
                top: 46%;
                left: 0%;
                z-index:-1;
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
            <h1>We are hiring interns!</h1>
            <div class="content">
                <h2>Eligibility</h2>
                <p>- Must have completed high school</p>
                <p>- College students</p>
                <p>- Graduates</p>
                <img src="images\image_processing20200810-5788-p4wbx0.jpg">
            </div>
            <div class="content">
                <h2>Perks</h2>
                <p>- Get a chance to earn and built skill</p>
                <p>- Letter of recommendation</p>
                <p>- Flexible work hours all in comfort of your home</p>                
            </div>
            <br><a href="internApp.jsp"><button>Apply Now</button></a>
        </div>
    </body>
</html>
