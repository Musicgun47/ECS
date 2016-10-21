<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : response
    Author     : your name
--%>

<jsp:useBean id="department" class="handlers.DepartmentHandle"/>
<jsp:setProperty name="department" property="index" value="${param.loop.index}" />
<c:set var="dept_id_generico" value="${department.dept_id_generico}"/>
<c:set var="dept_id_mega" value="${department.dept_id_mega}"/>
<sql:query var="comp3732_employees" dataSource="jdbc/generico">
    SELECT * FROM comp3732_departments, comp3732_employees 
    WHERE comp3732_employees.department = comp3732_departments.dept_id
    AND comp3732_departments.dept_id = ? <sql:param value="${dept_id_generico}"/>
</sql:query>
<sql:query var="comp3732_employees_mega" dataSource="jdbc/megacorp">
 SELECT * FROM comp3732_departments_mega, comp3732_employees_mega, comp3732_positions_mega
    WHERE comp3732_employees_mega.dept_id = comp3732_departments_mega.dept_id
    AND comp3732_employees_mega.role_id = comp3732_positions_mega.pos_id
    AND comp3732_departments_mega.dept_id = ? <sql:param value="${dept_id_mega}"/>
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Employee Details</title>
    </head>

    <body>
        <h1><jsp:getProperty name="department" property="dept" /></h1>
        <table>
            <tr>
                <th colspan="2">Name</th>
                <th>Role</th>
            </tr>
            <c:forEach var="row" items="${comp3732_employees.rows}">
                <tr>
                    <td><strong>${row.firstName}</strong></td>
                    <td><strong>${row.lastName}</strong></td>
                    <td><strong>${row.workRole}</strong></td>
                </tr>
            </c:forEach>
            <c:forEach var="row" items="${comp3732_employees_mega.rows}">
                <tr>
                    <td><strong>${row.firstName}</strong></td>
                    <td><strong>${row.lastName}</strong></td>
                    <td><strong>${row.positionName}</strong></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>