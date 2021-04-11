<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/9/2021
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            background-color: gray ;
            border: none;
            border-collapse:collapse ;
        }
        table td, th{
            border: 1px solid red;
            padding: 10px;
        }
    </style>
</head>
<body>
<h2>list student by jstl</h2>
<table>
    <tr>
        <th>No</th>
        <th>Id</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Gender</th>
        <th>Degree</th>
    </tr>
    <tr>
        <c:forEach var="student" items="${studentListServlet}" varStatus="loop">
    <tr>
        <td>${loop.index+1}</td>
        <td><c:out value="${student.id}"></c:out></td>
        <td><c:out value="${student.name}"></c:out></td>
        <td><c:out value="${student.dateOfBirth}"></c:out></td>
        <td>
<%--            <c:if test="${student.gender==1}"> Male</c:if>--%>
<%--            <c:if test="${student.gender==0}"> Female</c:if>--%>
<%--            <c:otherwise>--%>
<%--                gender third--%>
<%--            </c:otherwise>--%>
            <c:choose>
                <c:when test="${student.gender==1}">
                    Male
                </c:when>
                <c:when test="${student.gender==0}">
                    Female
                </c:when>
                <c:otherwise>
                    Third of gender
                </c:otherwise>
            </c:choose>
        </td>
        <td>
            <c:choose>
            <c:when test="${student.grade<=4}">
            Bad
            </c:when>
            <c:when test="${student.grade<=7}">
            Good
            </c:when>
            <c:otherwise>
            Very Good
            </c:otherwise>
            </c:choose>

    </tr>
    </c:forEach>
    </tr>

</table>
</body>
</html>
