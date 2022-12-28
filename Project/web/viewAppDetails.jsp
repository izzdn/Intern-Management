<%-- 
    Document   : viewAppDetails
    Created on : Feb 1, 2022, 12:21:18 AM
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
        <title>View Details</title>
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
        <div class="navbar">
            <div class="left-links">
                <a href="index.jsp">Home</a>
                <a href="contact.jsp">Contact</a>
                <a href="intern.jsp">Internship</a>
            </div>
            <div class="right-links">
                <a href="adminPage.jsp">
                    <c:forEach var="row" items="${result.rows}">
                        <c:out value="${row.ADMIN_NAME}"/>
                    </c:forEach>
                </a>
            </div>
        </div>
        
        <div class="navig">
            <a href="viewApplicant.jsp">< Back to list</a>
        </div>
        
        <c:set var="id" value="${param.id}"/>
        <c:set var="supervisor" value="${param.supervisor}"/>
        <c:set var="department" value="${param.department}"/>
         <c:set var="status" value="${param.status}"/>
        
        <sql:update var="exception" dataSource="${myDatasource}">
            UPDATE APPLICANT
            SET SUPERVISOR=?, DEPARTMENT=?, STATUS=?
            WHERE id=?
                
            <sql:param value="${supervisor}" />
            <sql:param value="${department}" />
            <sql:param value="${status}" />
            <sql:param value="${id}" />
        </sql:update>
        
        <sql:query var="result" dataSource="${myDatasource}">
            SELECT * FROM APPLICANT WHERE id=?
            
            <sql:param value="${id}" />
        </sql:query>
            
        <div class="container">
            <h1>Details</h1>
            <c:forEach var="row" items="${result.rows}">
                <form action="viewAppDetails.jsp" method="post" onsubmit="myFunction()">
                    <input type="hidden" name="id" value="${row.id}">
                    <input type="text" name="sfname" value="${row.name}"><br>
                    <input type="text" name="semail" value="${row.email}"><br>
                    <input type="text" name="sphone" value="${row.phone}"><br>
                    <input type="text" name="sdate" value="${row.sdate}"><br>
                    <input type="text" name="sedate" value="${row.edate}"><br>
                    <select name="status">
                        <option value="ACCEPTED" ${row.status == "ACCEPTED" ? 'selected="selected"' : ''}>ACCEPTED</option>
                        <option value="DECLINED" ${row.status == "DECLINED" ? 'selected="selected"' : ''}>DECLINED</option>
                        <option value="ENDED" ${row.status == "ENDED" ? 'selected="selected"' : ''}>ENDED</option>
                    </select><br>
                    <select name="supervisor">
                        <sql:query var="result" dataSource="${myDatasource}">
                            SELECT name FROM SUPERVISOR
                        </sql:query>
                            <c:forEach var="rows" items="${result.rowsByIndex}">
                            <c:forEach var="column" items="${rows}">
                                <option value="${column}" ${column == row.supervisor ? 'selected="selected"' : ''}><c:out value="${column}" /></option>
                            </c:forEach>
                        </c:forEach>
                    </select><br>
                    <select name="department">
                        <option value="INFORMATION TECHNOLOGY" ${row.department == "INFORMATION TECHNOLOGY" ? 'selected="selected"' : ''}>INFORMATION TECHNOLOGY</option>
                        <option value="MANAGEMENT" ${row.department == "MANAGEMENT" ? 'selected="selected"' : ''}>MANAGEMENT</option>
                        <option value="ACCOUNTING" ${row.department == "ACCOUNTING" ? 'selected="selected"' : ''}>ACCOUNTING</option>
                        <option value="SALES" ${row.department == "SALES" ? 'selected="selected"' : ''}>SALES</option>
                    </select><br>
                    <a href="https://drive.google.com/drive/folders/1J-9haSK0Vfbt4nJyoFee9Ir0WGIRljNZ?usp=sharing">Download Resume</a><br>
                    <%-- <textarea placeholder="Additional Information"></textarea><br> --%>
                    <input type="submit" name="apply" value="Update">
                </form>
            </c:forEach>
        </div> 
            <script>
                function myFunction(){
                    alert('Information has been updated');
                }
            </script>
    </body>
</html>
