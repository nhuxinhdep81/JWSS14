<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 09:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.tien.model.User" %>
<jsp:useBean id="user" class="com.tien.model.User" scope="session" />
<html>
<head><title>Trang chủ Đơn Hàng</title></head>
<body>
<h2>Chào mừng bạn đến với Đơn Hàng!</h2>
<p>Xin chào, <strong>${user.username}</strong> 👋</p>

<p><a href="orders">Vao đơn hàng</a></p>
<p><a href="/logout_cart">Đăng xuất</a></p>
</body>
</html>

