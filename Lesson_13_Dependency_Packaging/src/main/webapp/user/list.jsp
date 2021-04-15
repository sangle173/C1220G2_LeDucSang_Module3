<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/14/2021
  Time: 1:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User information</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
</head>
<body onload="openModal(${flag})">
<div class="container">
    <h1>User management</h1>
    <section>
        <div class="row">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                    data-whatever="@mdo">Create
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create new user</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="/users">
                                <input type="hidden" name="action" value="create"/>
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
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section>
        <table class="table table-striped">
            <thead class="text-success">
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th scope="col" colspan="2" style="text-align: center">Action</th>
            </thead>
            <c:forEach items="${userList}" var="user">
                <tbody>
                <td scope="row"><c:out value="${user.getId()}"></c:out></td>
                <td><c:out value="${user.getName()}"></c:out></td>
                <td><c:out value="${user.getEmail()}"></c:out></td>
                <td><c:out value="${user.getCountry()}"></c:out></td>
                <td>
                    <section>
                        <div class="row">
                            <a class="btn btn-primary" href="users?action=edit&id=${user.getId()}">
                                Edit
                            </a>
                        </div>
                    </section>
                </td>
                <td>
                    <button class="btn btn-danger btn-xs" onclick="setIdToForm(${user.id})">
                        Delete
                    </button>
                </td>
                </tbody>
            </c:forEach>
        </table>
    </section>
    <!-- modal edit -->
    <section>
        <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel1">Edit user</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="modal-body">
                            <form method="post" action="/users">
                                <input type="hidden" name="action" value="edit"/>
                                <input type="hidden" name="id" value="${user.id}">
                                <div class="form-group">
                                    <label for="recipient-nam-edit" class="col-form-label">User name:</label>
                                    <input type="text" class="form-control" id="recipient-nam-edit" name="name"
                                           value="${user.name}">
                                </div>
                                <div class="form-group">
                                    <label for="email-edit" class="col-form-label">User Email:</label>
                                    <input class="form-control" id="email-edit" name="email" value="${user.email}">
                                </div>
                                <div class="form-group">
                                    <label for="country-edit" class="col-form-label">User Country:</label>
                                    <input class="form-control" id="country-edit" name="country"
                                           value="${user.country}">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close
                                    </button>
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="confirm-delete" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                </div>
                <div class="modal-body">
                    <p>Do you want to proceed ?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <form action="/users">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="idDelete" value="idDelete" id="idDelete">
                        <input type="submit" class="btn btn-danger" value="Delete">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script>
    function openModal(flag) {
        if (flag) {
            $('#exampleModal1').modal('show');
        }
    }

    function setIdToForm(userId) {
        $('#confirm-delete').modal('show');
        document.getElementById("idDelete").value = userId;
    }
</script>
</body>
</html>
