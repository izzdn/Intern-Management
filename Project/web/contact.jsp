<%-- 
    Document   : contact
    Created on : Jan 31, 2022, 6:30:04 PM
    Author     : aqild
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/ProjekDB;create=true" user="app" password="app" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link rel="stylesheet" type="text/css" href="css/navbar.css">
        <style>
            body{
                margin: 0;
                background-color: white;
                font-family: calibri;
                color: white;
            }
            .container{
                color: black;
                max-width: 1200px;
                display: flex;
                margin-top: 150px;
                margin-left: auto;
                margin-right: auto;
            }
            .contact{
                display: block;
                width: 520px;
                margin-right: 20px;
                font-family: Dmsans,sans-serif;
            }
            .contact h1{
                font-size: 50px;
                margin: 0;
                margin-top: 20px;
            }
            contact p{
                margin: 0;
            }
            .contact-form{
                display: block;
                width: 540px;
            }
            .contact-form input[type=text]{
                width: 100%;
                margin-bottom: 20px;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
            }
            .contact-form textarea{
                width: 100%;
                margin-bottom: 20px;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
                font-family: Dmsans,sans-serif;
            }
            .contact-form input[type=submit]{
                font-family: Dmsans,sans-serif;
                padding: 20px 35px;
                text-align: center;
                flex: 0;
                border-radius: 12px;
                background-color: #562af0;
                box-shadow: -5px 30px 20px -20px rgba(86,93,113,.38);
                border: 0;
                font-size: 16px;
                font-weight: bold;
                margin-top: auto;
                margin-bottom: auto;
                color: #fff;
            }
            .container img{
                position: absolute;
                top: 50%;
                left: 10%;
                width: 500px;
                height: auto;
            }
       </style>
    </head>
    <body>
        <c:set var="adminid" value="<%= session.getAttribute("adminId")%>" />


        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM APP.ADMIN where ADMIN_ID='${adminid}'
        </sql:query>
        <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
            </div>
            <div class="right-links">
                <a href="adminPage.jsp">
                    <c:forEach var="row" items="${result.rows}">
                        <c:out value="${row.ADMIN_NAME}"/>
                    </c:forEach>
                </a>
                <a href="LogoutAdminServlet">Logout</a>
            </div>
        </div>
        <div class="container">
            <div class="contact">
                <h1>Need help? Let's chat.</h1>
                <p>Let's create something better together.</p>
            </div>
            <div class="contact-form">
                <form action="contact.jsp" method="post" onsubmit="myFunction()">
                    <input type="text" name="fname" placeholder="Full Name"><br>
                    <input type="text" name="email" placeholder="Email Address"><br>
                    <input type="text" name="subject" placeholder="Subject"><br>
                    <textarea name="comment" placeholder="Comment"></textarea><br>
                    <input type="submit" name="send" value="Send Message">
                </form>
            </div>
            <img src="images\8fd8eb59bb027e607c6d14cdff1812eb.png">
        </div>
        <script>
            function myFunction(){
                alert('something');
            }
        </script>
    </body>
</html>
