<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/14/2021
  Time: 1:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/js  p/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit form user</title>
</head>
<body>
<h1>Edit user</h1>
<h2><a href="users?action=users">List all users</a></h2>
<form method="post">
    <table border="1px" cellpadding="5px">
        <cation>Edit user</cation>
        <tr>
            <th>User Name</th>
            <td><input type="text" name="name" size="45" id="name" value="${sessionScope.user.id}"></td>
        </tr>
        <tr>
            <th>User Email</th>
            <td><input type="text" name="email" size="45" id="email" value="${sessionScope.user.email}"></td>
        </tr>
        <tr>
            <th>User Country</th>
            <td><input type="text" name="country" size="45" id="country" value="${sessionScope.user.country}"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Edit New"></td>
        </tr>
    </table>
</form>
</body>
</html>
