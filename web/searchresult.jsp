<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : searchresult
    Created on : 21/10/2016, 3:12:35 AM
    Author     : JOEL
--%>

<jsp:useBean id="search" class="utilities.SearchTerm"/>
<jsp:setProperty name="search" property="searchTerm" value="${param.search}"/>
<c:set var="searchTerm" value="${search.searchTerm}"/>
<sql:query var="matches_generico" dataSource="jdbc/generico">
    SELECT firstName, lastName, workRole, deptName
    FROM comp3732_employees, comp3732_departments
    WHERE comp3732_employees.department = comp3732_departments.dept_id
    AND (firstName LIKE ? <sql:param value="%${searchTerm}%"/>
    OR lastName LIKE ? <sql:param value="%${searchTerm}%"/>)
</sql:query>
<sql:query var="matches_mega" dataSource="jdbc/megacorp">
    SELECT firstName, lastName, positionName, deptName
    FROM comp3732_employees_mega, comp3732_positions_mega, comp3732_departments_mega
    WHERE comp3732_employees_mega.dept_id = comp3732_departments_mega.dept_id
    AND comp3732_employees_mega.role_id = comp3732_positions_mega.pos_id
    AND (firstName LIKE ? <sql:param value="%${searchTerm}%"/>
    OR lastName LIKE ? <sql:param value="%${searchTerm}%"/>)
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Search Results</title>
    </head>
    <body>
        <h1>Results</h1>
        <table>
            <tr>
                <th colspan="2">Name</th>
                <th>Role</th>
                <th>Department</th>
            </tr>
            <tr>
                
            </tr>
        </table>
    </body>
</html>
