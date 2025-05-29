<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 08:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #218838;
        }
        .link {
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Thêm sản phẩm mới</h2>
    <form:form action="product_save" method="post" modelAttribute="product">
        <div class="form-group">
            <label for="id">Mã sản phẩm:</label>
            <form:input path="id" id="id" required="true"/>
        </div>
        <div class="form-group">
            <label for="name">Tên sản phẩm:</label>
            <form:input path="name" id="name" required="true"/>
        </div>
        <div class="form-group">
            <label for="price">Giá:</label>
            <form:input path="price" id="price" required="true"/>
        </div>
        <div class="form-group">
            <button type="submit">Thêm sản phẩm</button>
        </div>
    </form:form>
    <div class="link">
        <a href="product_list">Xem danh sách sản phẩm</a>
    </div>
</div>
</body>
</html>
