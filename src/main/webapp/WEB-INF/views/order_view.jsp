<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Đơn hàng</title></head>
<body>
<h2>Đơn hàng đã đặt</h2>

<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
<p style="color:red;"><%= msg %></p>
<% } %>

<jsp:useBean id="order" class="com.tien.model.OrderB8" scope="request" />
<% if (request.getAttribute("order") != null) { %>
<ul>
    <li><strong>Khách hàng:</strong> ${order.customerName}</li>
    <li><strong>Sản phẩm:</strong> ${order.product}</li>
    <li><strong>Số lượng:</strong> ${order.quantity}</li>
</ul>
<% } %>

<a href="order_form">Quay lại đặt hàng</a>
</body>
</html>

