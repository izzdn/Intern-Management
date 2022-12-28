<%-- 
    Document   : userPage
    Created on : Feb 7, 2022, 12:07:09 AM
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
        <title>JSP Page</title>
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
                margin-top: 50px;
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
                margin-right: 315px;
                margin-bottom: 20px;
            }
            .container h1,p{
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
            .container select{
                width: 38%;
                padding: 15px;
                border: 2px solid lightgrey;
                font-size: 16px;
                text-align: left;
                border-radius: 8px;
                margin-bottom: 20px;
            }
            .navig a{
                font-size: 18px;
                text-decoration: none;
                color: #116dff;
                font-weight: bold;
                font-family: inherit;
            }
            .navig{
                margin-left: 50px;
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <c:set var="uemail" value="<%= session.getAttribute("email")%>" />

        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM APP.USERS where EMAIL='${uemail}'
        </sql:query>
        <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
            </div>
            <div class="right-links">
                <a href="userPage.jsp">
                    <c:forEach var="row" items="${result.rows}">
                        <c:out value="${row.FULLNAME}"/>
                    </c:forEach>
                </a>
                <a href="LogoutUserServlet">Logout</a>
            </div>
        </div>
        <c:set var="email" value="${param.email}"/>
        <c:set var="supervisor" value="${param.supervisor}"/>
        <c:set var="department" value="${param.department}"/>
         <c:set var="status" value="${param.status}"/>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM APPLICANT WHERE EMAIL = '${uemail}'
            
        </sql:query>
            
        <div class="container">
            <h1>Details</h1>
            <c:forEach var="row" items="${result.rows}">
                <input type="hidden" name="id" value="${row.id}">
                <input type="text" name="ufname" value="${row.name}"><br>
                <input type="text" name="uemail" value="${row.email}"><br>
                <input type="text" name="uphone" value="${row.phone}"><br>
                <input type="text" name="udate" value="${row.sdate}"><br>
                <input type="text" name="uedate" value="${row.edate}"><br>
                <input type="text" name="ustatus" value="${row.status}"><br>
                <input type="text" name="usuperv" value="${row.supervisor}"><br>
                <input type="text" name="udept" value="${row.deparment}"><br>
                <%-- <textarea placeholder="Additional Information"></textarea><br> --%>
            </c:forEach>
        </div> 
    </body>
</html>
