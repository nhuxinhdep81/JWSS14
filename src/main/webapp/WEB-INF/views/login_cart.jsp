<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 09:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Đăng nhập vào giỏ hàng</title></head>
<body>
<h2>Đăng nhập</h2>
<form action="login_save_cart" method="post">
    <div>
        <label for="username">UserName:</label>
        <input type="text" name="username" id="username" required>
    </div>
    <div>
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>
    </div>
    <input type="submit" value="Đăng nhập">
</form>
</body>
</html>

