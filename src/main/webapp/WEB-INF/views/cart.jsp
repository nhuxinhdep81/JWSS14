<%--
  Created by IntelliJ IDEA.
  User: lemanh
  Date: 29/05/2025
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Giỏ hàng</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        h2 {
            color: #333;
            margin-bottom: 25px;
            font-size: 1.8rem;
            text-align: center;
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        h3 {
            color: #555;
            margin: 30px 0 15px 0;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-container {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            border: 1px solid #e9ecef;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            background: white;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .btn-primary {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        .cart-section {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
        }

        .cart-list {
            list-style: none;
        }

        .cart-item {
            background: white;
            padding: 15px 20px;
            margin-bottom: 10px;
            border-radius: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-left: 4px solid #667eea;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .cart-item:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }

        .item-info {
            font-weight: 500;
            color: #333;
        }

        .item-quantity {
            background: #e9ecef;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 14px;
            color: #555;
            margin-left: 10px;
        }

        .btn-delete {
            background: linear-gradient(45deg, #ff6b6b, #ee5a52);
            color: white;
            text-decoration: none;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 14px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .btn-delete:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
            text-decoration: none;
            color: white;
        }



        .empty-message {
            text-align: center;
            color: #888;
            font-style: italic;
            padding: 20px;
        }

        .icon {
            width: 20px;
            height: 20px;
            display: inline-block;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 20px;
            }

            .cart-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }

            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>🛒 Giỏ hàng của bạn</h2>

    <div class="form-container">
        <form method="post" action="/cart/add">
            <div class="form-group">
                <label for="name">📦 Tên sản phẩm:</label>
                <input type="text" id="name" name="name" required placeholder="Nhập tên sản phẩm...">
            </div>
            <div class="form-group">
                <label for="quantity">🔢 Số lượng:</label>
                <input type="number" id="quantity" name="quantity" min="1" required placeholder="1">
            </div>
            <button type="submit" class="btn-primary">Thêm vào giỏ</button>
        </form>
    </div>

    <div class="cart-section">
        <h3>🛍️ Danh sách sản phẩm trong giỏ</h3>
        <c:choose>
            <c:when test="${empty cart}">
                <div class="empty-message">Giỏ hàng của bạn đang trống</div>
            </c:when>
            <c:otherwise>
                <ul class="cart-list">
                    <c:forEach var="item" items="${cart}">
                        <li class="cart-item">
                            <div class="item-info">
                                    ${item.name}
                                <span class="item-quantity">SL: ${item.quantity}</span>
                            </div>
                            <a href="/cart/delete?name=${item.name}" class="btn-delete">Xóa</a>
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>


</div>
</body>
</html>