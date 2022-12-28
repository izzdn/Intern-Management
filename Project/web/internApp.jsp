<%-- 
    Document   : internApp
    Created on : Jan 31, 2022, 10:43:00 PM
    Author     : aqild
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/ProjekDB;create=true" user="app" password="app" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply Internship</title>
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
                margin-top: 100px;
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
                margin-top: 30px;
                margin-bottom: auto;
                color: #fff;
                text-align: center;
                margin-right: 255px;
            }
            .container h1{
                margin-bottom: 50px;
            }
            .container p{
                text-align: left;
                margin: 0;
                margin-left: 375px;
            }
            .container a{
                text-decoration: none;
                color: #116dff;
                margin-right: 300px;
            }
            .container a,h1,p{
                text-align: center;
            }
            .container input[type=date]{
                font-family: Dmsans,sans-serif;
                padding: 5px 20px;
                margin: 0;
                margin-bottom: 20px;
                font-size: 16px;
                margin-left: 8px;
                border: 2px solid lightgrey;
                border-radius: 5px;
            }
            .container input[type=radio]{
                margin: 0;
                margin-left: 15px;
            }
            .container textarea{
                width: 35%;
                margin-bottom: 20px;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
                font-family: Dmsans,sans-serif;
            }
            .container input[type=file]{
                text-align: left;
                font-size: 16px;
                margin: 0;
                margin-right: 175px;
                margin-bottom: 20px;
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
            <h1>Internship Application Form</h1>
            <form action="internApp.jsp" method="post" enctype="multipart/form-data">
                <input type="text" name="aname" placeholder="Full Name"><br>
                <input type="text" name="aemail" placeholder="Email Address"><br>
                <input type="text" name="aphone" placeholder="Contact No"><br>
                <p>Date Start<input type="date" name="sdate"><br>Date End <input type="date" name="edate"></p><br>
                <p>Upload a copy of your CV/Resume</p><br>
                <a href="https://drive.google.com/drive/folders/1J-9haSK0Vfbt4nJyoFee9Ir0WGIRljNZ?usp=sharing">Upload Resume Here</a><br>
                <%-- <textarea placeholder="Additional Information"></textarea><br> --%>
                <input type="submit" name="apply" value="Apply">
            </form>
        </div>
        <c:set var="aname" value="${param.aname}"/>
        <c:set var="aemail" value="${param.aemail}"/>
        <c:set var="aphone" value="${param.aphone}"/>
        <c:set var="sdate" value="${param.sdate}"/>
        <c:set var="edate" value="${param.edate}"/>
        <c:if test="${(aname!=null)&&(aemail!=null)&&(aphone!=null)&&(sdate!=null)&&(edate!=null)}" var="result">
            <sql:update var="result" dataSource="${myDatasource}">
                INSERT INTO APPLICANT (name, email, phone, sdate, edate)
                VALUES (?, ?, ?, ?, ?)
                
                <sql:param value="${aname}"/>
                <sql:param value="${aemail}"/>
                <sql:param value="${aphone}"/>
                <sql:param value="${sdate}"/>
                <sql:param value="${edate}"/>
            </sql:update>     
        </c:if>
    </body>
</html>
