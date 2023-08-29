<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/29/2023
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về</a>
<h1>Thêm mới sản phẩm</h1>
<form action="/product?action=create" method="post">
    <label for="name">Tên</label>
    <input type="text" id="name" name="name"><br>
    <label for="price">Gía</label>
    <input type="text" id="price" name="price"><br>
    <label for="description">Mô tả</label>
    <input type="text" id="description" name="description"><br>
    <label for="company">Công ty</label>
    <input type="text" id="company" name="company"><br>
    <button type="submit">Thêm mới</button>
</form>
</body>
</html>
