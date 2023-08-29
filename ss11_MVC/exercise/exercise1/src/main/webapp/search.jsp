<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/29/2023
  Time: 7:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về</a>
<h1>Tìm kiếm sản phẩm</h1>
<form action="/product?action=search" method="post">
    <label for="name">Tên sản phẩm</label>
    <input type="text" id="name" name="name"><br>
    <button type="submit">Tìm</button>
    ${product}
    ${notice}
</body>
</html>
