<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : response
    Author     : your name
--%>
<sql:query var="departments" dataSource="jdbc/generico">
    SELECT deptName FROM comp3732_departments
    WHERE dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>
<sql:query var="departments_mega" dataSource="jdbc/megacorp">
    SELECT deptName FROM comp3732_departments_mega
    WHERE dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>
<sql:query var="comp3732_employees" dataSource="jdbc/generico">
    SELECT * FROM comp3732_departments, comp3732_employees 
    WHERE comp3732_employees.department = comp3732_departments.dept_id
    AND comp3732_departments.dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>
<sql:query var="comp3732_employees_mega" dataSource="jdbc/megacorp">
 SELECT * FROM comp3732_departments_mega, comp3732_employees_mega, comp3732_positions_mega
    WHERE comp3732_employees_mega.dept_id = comp3732_departments_mega.dept_id
    AND comp3732_employees_mega.role_id = comp3732_positions_mega.pos_id
    AND comp3732_departments_mega.dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>

<c:set var="dept" value="${departments.rows[0]}"/>
<c:set var="dept_mega" value="${departments_mega.rows[0]}"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Employee Details</title>
    </head>

    <body>
        <h1>${dept.deptName}</h1>
        <table>
            <tr>
                <th colspan="2">Name</th>
                <th>Role</th>
            </tr>
            <c:forEach var="row" items="${comp3732_employees.rows}">
                <c:if test="${row.deptName == dept.deptName}">
                    <tr>
                        <td><strong>${row.firstName}</strong></td>
                        <td><strong>${row.lastName}</strong></td>
                        <td><strong>${row.workRole}</strong></td>
                    </tr>
                </c:if>
            </c:forEach>
            <c:forEach var="row" items="${comp3732_employees_mega.rows}">
                <c:choose>
                    <c:when test="${row.deptName == dept_mega.deptName}">
                        <tr>
                            <td><strong>${row.firstName}</strong></td>
                            <td><strong>${row.lastName}</strong></td>
                            <td><strong>${row.positionName}</strong></td>
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
        </table>
    </body>
</html>