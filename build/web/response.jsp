<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : response
    Author     : your name
--%>

<sql:query var="comp3732_employees" dataSource="jdbc/generico">
    SELECT * FROM comp3732_departments, comp3732_employees 
    WHERE comp3732_employees.department = comp3732_departments.dept_id 
    AND comp3732_departments.dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>
<sql:query var="comp3732_employees_mega" dataSource="jdbc/megacorp">
 SELECT * FROM comp3732_departments_mega, comp3732_employees_mega 
    WHERE comp3732_employees_mega.dept_id = comp3732_departments_mega.dept_id 
    AND comp3732_departments_mega.dept_id = ? <sql:param value="${param.dept_id}"/>
</sql:query>

<c:set var="comp3732_employeesDetails" value="${comp3732_employees.rows[0]}"/>
<c:set var="comp3732_employeesMegaDetails" value="${comp3732_employees_mega.rows[0]}"/>   

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Employee Details</title>
    </head>

    <body>
        <table>
            <tr>
                <th colspan="2">${comp3732_employeesDetails.firstName}${comp3732_employeesMegaDetails.name}</th>
            </tr>
            <tr>
                <td><strong>Role: </strong></td>
                <td><strong>${comp3732_employeesDetails.workRole}${comp3732_employeesMegaDetails.workRole}</strong></td>
            </tr>
         
        </table>
    </body>
</html>