<%-- 
    Document   : viewStudent
    Created on : Jan 31, 2022, 11:35:57 PM
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
        <title>View Applicants</title>
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
            .container button{
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
        <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
                <a href="intern.jsp">List</a>
            </div>
            <div class="right-links">
                <a href="adminPage.jsp">
                    <c:forEach var="row" items="${result.rows}">
                        <c:out value="${row.ADMIN_NAME}"/>
                    </c:forEach>
                </a>
            </div>
        </div>
        <div class="container">
            <h1>List of Applicant(s)</h1>
            <table>
                <tr>
                    <th>No</th>
                    <th>FULL NAME</th>
                    <th>SUPERVISOR</th>
                    <th>DEPARTMENT</th>
                    <th>STATUS</th>
                </tr>
                <sql:query var="result" dataSource="${myDatasource}">
                    SELECT id, name, supervisor, department, status FROM APPLICANT
                </sql:query>
                <c:set var="count" value="0" scope="page"/>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td><c:out value="${count+1}"/></td>
                            <td><c:out value="${row.name}"/></td>
                            <td><c:out value="${row.supervisor}"/></td>
                            <td><c:out value="${row.department}"/></td>
                            <td><c:out value="${row.status}"/></td>
                            <td><a href="viewAppDetails.jsp?id=${row.id}"><button>Details</button></a></td>
                        </tr>
                        <c:set var="count" value="${count+1}" scope="page"/>
                    </c:forEach>   
            </table>
        </div>
    </body>
</html>
