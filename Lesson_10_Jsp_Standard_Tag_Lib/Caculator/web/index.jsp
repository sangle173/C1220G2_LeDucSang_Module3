<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/9/2021
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/calculator" method="post">
    <fieldset>
        <legend> CACULATOR</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td>
                    <input type="text" name="first">
                </td>
            </tr>
            <tr>
                <td>
                    Operator:
                </td>
                <td>
                    <select name="operator" id="">
                        <option value="+">Add</option>
                        <option value="-">Sub</option>
                        <option value="*">Mup</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td>
                    <input type="text" name="second">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit">
                </td>

            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
