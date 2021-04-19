<%--
  Created by IntelliJ IDEA.
  User: SANG
  Date: 4/19/2021
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>

    <script>
        $(document).ready(function () {

            // Cấu hình các nhãn phân trang
            $('#example').dataTable({
                "language": {
                    "sProcessing": "Đang xử lý...",
                    "sLengthMenu": "Xem _MENU_ mục",
                    "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
                    "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                    "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                    "sInfoPostFix": "",
                    "sSearch": "Tìm:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Đầu",
                        "sPrevious": "Trước",
                        "sNext": "Tiếp",
                        "sLast": "Cuối"
                    }
                }
            });

        });
    </script>
</head>
<body>
<a type="button" href="http://localhost:8080/create_customer">Create Customer</a>
<table id="example" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Customer Type</th>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" varStatus="loop" var="customer">
        <tr>
            <td scope="row">${loop.index+1}</td>
            <td>${customer.typeName}</td>
            <td>${customer.name}</td>
            <td>${customer.birthday}</td>
            <td>${customer.gender}</td>
            <td>${customer.idCard}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <td>
                    <%--                <a  href="/customers?action=edit&id=${customer.id}">--%>
                    <%--                    Edit--%>
                    <%--                        &lt;%&ndash;                                    edit&ndash;%&gt;--%>
                    <%--                </a>--%>
                <form action="/customers">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="id" value="${customer.id}">
                    <input type="submit" value="Edit">
                </form>
            </td>
            <td>
                <button type="button" onclick="setIdToForm(${customer.id})">
                        <%--                                    delete--%>
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
