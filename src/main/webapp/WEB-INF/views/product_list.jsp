<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 08:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh sách sản phẩm</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    table {
      width: 80%;
      border-collapse: collapse;
      margin: 20px auto;
    }
    th, td {
      border: 1px solid black;
      padding: 10px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
    h2 {
      text-align: center;
    }
    .delete-btn {
      background-color: #dc3545;
      color: white;
      border: none;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 3px;
    }
    .delete-btn:hover {
      background-color: #c82333;
    }
    .link {
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<h2>Danh sách sản phẩm</h2>
<table>
  <tr>
    <th>Mã sản phẩm</th>
    <th>Tên sản phẩm</th>
    <th>Giá</th>
    <th>Thao tác</th>
  </tr>
  <c:forEach var="product" items="${products}" varStatus="status">
    <tr>
      <td>${product.id}</td>
      <td>${product.name}</td>
      <td>${product.price}</td>
      <td>
        <form action="product_delete" method="post" style="display:inline;">
          <input type="hidden" name="index" value="${status.index}"/>
          <button type="submit" class="delete-btn">Xóa</button>
        </form>
      </td>
    </tr>
  </c:forEach>
</table>
<div class="link">
  <a href="product_form">Thêm sản phẩm mới</a>
</div>
</body>
</html>
