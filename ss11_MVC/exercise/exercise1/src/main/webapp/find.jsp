<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/29/2023
  Time: 3:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Trở về</a>
<h1>Xem chi tiết sản phẩm</h1>
<form action="/product?action=find" method="post">
    <label for="id">Mã sản phẩm</label>
    <input type="text" id="id" name="id"><br>
    <button type="submit">Tìm</button>
    ${product}
    ${notice}
</form>
</body>
</html>
