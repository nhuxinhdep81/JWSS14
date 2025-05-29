<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 08:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Đăng nhập</title></head>
<body>
<h2>Đăng nhập</h2>
<form action="login_save" method="post">
  <div>
    <label for="username">UserName:</label>
    <input type="text" name="username" id="username" value="${username}" required>
  </div>
  <div>
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" value="${password}" required>
  </div>
  <div>
    <input type="checkbox" name="remember" ${not empty username ? 'checked' : ''}> Ghi nhớ tôi
  </div>
  <input type="submit" value="Đăng nhập">
</form>
</body>
</html>


