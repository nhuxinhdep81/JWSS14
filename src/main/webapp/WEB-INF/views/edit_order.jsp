<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 09:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sửa đơn hàng</title>
</head>
<body>
<h2>Sửa đơn hàng</h2>
<form action="/orders/update" method="post">
    Mã đơn hàng: <input type="text" name="orderId" value="${product.orderId}" readonly><br>
    Tên sản phẩm: <input type="text" name="productName" value="${product.productName}" required><br>
    Số lượng: <input type="number" name="quantity" value="${product.quantity}" min="1" required><br>
    <button type="submit">Cập nhật</button>
</form>
</body>
</html>
