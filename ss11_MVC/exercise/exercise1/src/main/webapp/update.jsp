<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/29/2023
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về</a>
<h1>Sửa sản phẩm</h1>
<form action="/product?action=update" method="post">
    <label for="id">Mã sản phẩm</label>
    <input type="text" id="id" name="id"><br>
    <label for="name">Tên</label>
    <input type="text" id="name" name="name"><br>
    <label for="price">Gía</label>
    <input type="text" id="price" name="price"><br>
    <label for="description">Mô tả</label>
    <input type="text" id="description" name="description"><br>
    <label for="company">Công ty</label>
    <input type="text" id="company" name="company"><br>
    <button type="submit">Sửa</button>
</form>
</body>
</html>
