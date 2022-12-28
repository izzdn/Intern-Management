<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : viewSV
    Created on : Feb 1, 2022, 2:40:48 PM
    Author     : aqild
--%>
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
                font-family: arial, sans-serif;
                color: black;
            }
            .container{
                width: 1300px;
                margin: 100px auto;
                text-align: center;
            }
            .container h1{
                margin-bottom: 50px;
            }
            .container table{
                width: 100%;
            }
            .container td, th{
                text-align: left;
                padding: 5px 3px;
            }
            .container td{
              border: none;
              border-bottom: 1px solid lightgrey;
            }
            .container input[type=submit]{
                padding: 5px 20px;
                font-size: 15px;
                color: white;
                background-color: #562af0;
                border: none;
                border-radius: 999px;
            }
            .container select{
                padding: 3px 15px;
                font-size: 16px;
            }
            .container a{
                text-decoration: none;
                color: black;
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
            
            <c:set var="id" value="${param.id}"/>
            
            <sql:update var="delete" dataSource="${myDatasource}">
                DELETE FROM SUPERVISOR
                WHERE ID =?
                
                <sql:param value="${id}" />
            </sql:update>
            
        <div class="container">
            <h1>List of Supervisor</h1>
            <form action="viewSV.jsp" method="post">
            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM SUPERVISOR
            </sql:query>
                <table>
                    <!-- column headers -->
                    <tr>
                        <th>NO</th>
                        <th>NAME</th>
                        <th>EMAIL</th>
                        <th>CONTACT NO</th>
                        <th>DEPARTMENT</th>
                    </tr>
                    <!-- column data -->
                    <c:set var="count" value="1" scope="page" />
                    <c:forEach var="row" items="${result.rows}">  
                        <tr>
                            <td><c:out value="${count}"/></td>
                            <input type="hidden" name="id" value="${row.id}">
                            <td><c:out value="${row.name}"/></td>
                            <td><c:out value="${row.email}"/></td>
                            <td><c:out value="${row.phone}"/></td>
                            <td><c:out value="${row.dept}"/></td>
                            <td><input type="submit" name="delete" value="Remove"></td>
                        </tr>
                        <c:set var="count" value="${count + 1}" scope="page"/>
                    </c:forEach>
                </table>
            </form>
        </div>
    </body>
</html>
