<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Form đặt hàng</title></head>
<body>
<h2>Form đặt hàng</h2>

<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
<p style="color:green;"><%= msg %></p>
<% } %>

<form action="order_save" method="post">
  <div>
    <label for="customerName">Tên khách hàng:</label>
    <input type="text" name="customerName" id="customerName" required>
  </div>
  <div>
    <label for="product">Sản phẩm:</label>
    <select name="product" id="product">
      <option value="Laptop">Laptop</option>
      <option value="Điện thoại">Điện thoại</option>
      <option value="Tai nghe">Tai nghe</option>
    </select>
  </div>
  <div>
    <label for="quantity">Số lượng:</label>
    <input type="number" name="quantity" id="quantity" min="1" required>
  </div>
  <input type="submit" value="Đặt hàng">
</form>

<br>
<a href="order_view">Xem lại đơn hàng</a>
</body>
</html>

