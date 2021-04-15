<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/14/2021
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new user</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">

</head>
<body>
<section>
    <div class="container">
        <div class="row">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                <a href="users?action=create" style="color: white">Create</a></button>
            <button type="button" class="btn btn-secondary">
                <a href="users?action=users">List Users</a>
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create new user</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post">
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label">User name:</label>
                                    <input type="text" class="form-control" id="recipient-name" name="name">
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-form-label">User Email:</label>
                                    <input class="form-control" id="email" name="email">
                                </div>
                                <div class="form-group">
                                    <label for="country" class="col-form-label">User Country:</label>
                                    <input class="form-control" id="country" name="country">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<%--<h1>User management</h1>--%>
<%--<h2><a href="users?action=users">List all users</a></h2>--%>
<%--<form method="post">--%>
<%--    <table border="1px" cellpadding="5px">--%>
<%--        <cation>Add new user</cation>--%>
<%--        <tr>--%>
<%--            <th>User Name</th>--%>
<%--            <td><input type="text" name="name" size="45" id="name"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>User Email</th>--%>
<%--            <td><input type="text" name="email" size="45" id="email"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th>User Country</th>--%>
<%--            <td><input type="text" name="country" size="45" id="country"></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2"><input type="submit" value="Create New"></td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>
