<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 09:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý đơn hàng</title>
</head>
<body>
<h2>Thêm đơn hàng mới</h2>
<form action="/orders/add" method="post">
    Mã đơn hàng: <input type="text" name="orderId" required><br>
    Tên sản phẩm: <input type="text" name="productName" required><br>
    Số lượng: <input type="number" name="quantity" min="1" required><br>
    <button type="submit">Thêm</button>
</form>

<h2>Danh sách đơn hàng</h2>
<table border="1">
    <tr>
        <th>Mã</th>
        <th>Tên sản phẩm</th>
        <th>Số lượng</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="o" items="${orders}">
        <tr>
            <td>${o.orderId}</td>
            <td>${o.productName}</td>
            <td>${o.quantity}</td>
            <td>
                <a href="/orders/edit?orderId=${o.orderId}">Sửa</a> |
                <a href="/orders/delete?orderId=${o.orderId}">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

