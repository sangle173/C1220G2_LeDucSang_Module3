<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/19/2021
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
</head>
<body>
<table>
    <tr>
        <th>
            customer id
        </th>
        <th>
            customer type
        </th>
    </tr>
    <tr>
        <td>${customerEdit.id}</td>
    </tr>
</table>
<form action="/customers" method="post">
    <input type="hidden" name="action" value="create">
    <table>
        <tr>
            <td>
                <label for="id">Customer Id:</label>
            </td>
            <td>
                <input type="text" id="id" name="id" value="${customerEdit.id}">
            </td>
        </tr>
        <tr>
            <td>
                <label for="customerType">Customer Type:</label>
            </td>
            <td>
                <select name="customerType" id="customerType">
                    <option value="${customerEdit.id}">${customerEdit.typeName}</option>
                    <c:forEach items="${customerTypeListEdit}" var="customerTypeEdit">
                        <option value="${customerTypeEdit.id}">${customerTypeEdit.typeName}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="name">Customer Name:</label>
            </td>
            <td>
                <input type="text" id="name" name="name" value="${customerEdit.name}">
            </td>
        </tr>
        <tr>
            <td>
                <label for="birthday">Customer Birthday:</label>
            </td>
            <td>
                <input type="date" id="birthday" name="birthday" value="${customerEdit.birthday}">
            </td>
        </tr>
        <tr>
            <td>
                Gender
            </td>
            <td>
                <input type="radio" name="gender" value="male"> Male<br>
                <input type="radio" name="gender" value="female"> Female<br>
                <input type="radio" name="gender" value="other"> Other
            </td>
        </tr>
        <tr>
            <td>
                <label for="idCard">Id Card</label>
            </td>
            <td>
                <input type="text" id="idCard" name="idCard" value="${customerEdit.idCard}">
            </td>
        </tr>
        <tr>
            <td>
                <label for="phone">Phone</label>
            </td>
            <td>
                <input type="text" id="phone" name="phone" value="${customerEdit.phone}">
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">Email:</label>
            </td>
            <td>
                <input type="text" id="email" name="email" value="${customerEdit.email}">
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">Address:</label>
            </td>
            <td>
                <input type="text" id="address" name="address" value="${customerEdit.address}">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="Create">
            </td>
        </tr>
    </table>

</form>
</body>
</html>
