<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
    Document   : index
    Author     : your name
--%>

<sql:query var="comp3732_departments" dataSource="jdbc/generico">
SELECT dept_id, deptName FROM comp3732_departments;
</sql:query>

<sql:query var="comp3732_employees_mega" dataSource="jdbc/megacorp">
 SELECT dept_id, deptName FROM comp3732_departments_mega; 
</sql:query>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Generico (and the previous Megacorp)</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>

    <body>
        <h1>Display Employees in Generico</h1>
        <p>
<form action="response.jsp">
    <strong>Select a Department:</strong>
    <select name="dept_id">
       <c:forEach var="row" items="${comp3732_departments.rows}">
            <option value="${row.dept_id}">${row.deptName}</option>
        </c:forEach>
         <c:forEach var="row" items="${comp3732_employees_mega.rows}">
            <option value="${row.dept_id}">${row.id_name}</option>
        </c:forEach>
    <input type="submit" value="submit" name="submit" />
</form>
        </p>
    </body>
</html>
