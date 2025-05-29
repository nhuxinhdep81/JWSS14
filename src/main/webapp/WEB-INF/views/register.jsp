<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><spring:message code="title.register"/></title>
</head>
<body>
<h2><spring:message code="title.register"/></h2>

<form action="${pageContext.request.contextPath}/register" method="post">
    <label><spring:message code="label.username"/></label><br/>
    <input type="text" name="username" value="${user.username}"/><br/>
    <span style="color:red">${usernameError}</span><br/>

    <label><spring:message code="label.password"/></label><br/>
    <input type="password" name="password"/><br/>
    <span style="color:red">${passwordError}</span><br/>

    <label><spring:message code="label.confirmPassword"/></label><br/>
    <input type="password" name="confirmPassword"/><br/>
    <span style="color:red">${confirmError}</span><br/>

    <label><spring:message code="label.email"/></label><br/>
    <input type="email" name="email" value="${user.email}"/><br/>
    <span style="color:red">${emailError}</span><br/><br/>

    <input type="submit" value="<spring:message code='label.submit'/>"/><br/><br/>

    <span style="color:green">${successMessage}</span>
</form>

<p>
    <a href="?lang=vi">Tiếng Việt</a> |
    <a href="?lang=en">English</a>
</p>

</body>
</html>

