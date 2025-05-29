<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 08:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Language Selector</title>
    <script>
        function changeLanguage(selectElement) {
            var selectedLang = selectElement.value;
            window.location.href = "?lang=" + selectedLang;
        }
    </script>
</head>
<body>
<h2>Xin chào!!!!</h2>

<!-- Dropdown để chọn ngôn ngữ -->
<label for="language-select">Chọn ngôn ngữ:</label>
<select id="language-select" onchange="changeLanguage(this)">
    <option value="vi" ${param.lang == 'vi' ? 'selected' : ''}>Tiếng Việt</option>
    <option value="en" ${param.lang == 'en' ? 'selected' : ''}>English</option>
</select>

<div>
    <fmt:message key="mess.title"></fmt:message>
</div>
</body>
</html>

