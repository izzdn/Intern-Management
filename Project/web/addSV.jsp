<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : addSV
    Created on : Feb 1, 2022, 12:48:30 AM
    Author     : aqild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/ProjekDB;create=true" user="app" password="app" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Supervisor</title>
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
                margin-left: 5px;
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
            .container select{
                width: 38%;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
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
            <h1>Add Supervisor</h1>
            <form action="addSV.jsp" method="post">
                <input type="text" name="sfname" placeholder="Full Name"><br>
                <input type="text" name="semail" placeholder="Email Address"><br>
                <input type="text" name="sphone" placeholder="Contact No"><br>
                <select name="dept">
                    <option value="">SELECT DEPARTMENT</option>
                    <option value="INFORMATION TECHNOLOGY">INFORMATION TECHNOLOGY</option>
                    <option value="MANAGEMENT">MANAGEMENT</option>
                    <option value="ACCOUNTING">ACCOUNTING</option>
                    <option value="SALES">SALES</option>
                </select><br>
                <input type="submit" name="apply" value="Add">
            </form>
        </div>
            <c:set var="sfname" value="${param.sfname}"/>
            <c:set var="semail" value="${param.semail}"/>
            <c:set var="sphone" value="${param.sphone}"/>
            <c:set var="dept" value="${param.dept}"/>
        
            <c:if test="${(sfname!=null)&&(semail!=null)&&(sphone!=null)&&(dept!=null)}" var="result">
                <sql:update var="result" dataSource="${myDatasource}">
                    INSERT INTO SUPERVISOR (name, email, phone, dept)
                    VALUES (?, ?, ?, ?)
                    
                    <sql:param value="${sfname}"/>
                    <sql:param value="${semail}"/>
                    <sql:param value="${sphone}"/>
                    <sql:param value="${dept}"/>
                </sql:update>  
                    <script>alert('Supervisor added');</script>
            </c:if>
    </body>
</html>
