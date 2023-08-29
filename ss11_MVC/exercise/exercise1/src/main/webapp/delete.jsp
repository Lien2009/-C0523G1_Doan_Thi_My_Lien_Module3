<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/29/2023
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về</a>
<h1>Xóa sản phẩm</h1>
<form action="/product?action=delete" method="post">
    <label for="id">Mã sản phẩm</label>
    <input type="text" id="id" name="id"><br>
    <button type="submit">Xóa</button>
</form>
</body>
</html>
