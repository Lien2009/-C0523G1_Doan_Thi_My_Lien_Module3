<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/29/2023
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<a href="/product?action=showformcreate">Thêm mới sản phẩm</a><br>
<a href="/product?action=showformfind">Xem chi tiết một sản phẩm</a><br>
<a href="/product?action=showformdelete">Xóa sản phẩm</a><br>
<a href="/product?action=showformupdate">Sửa sản phẩm</a><br>
<a href="/product?action=showformsearch">Tìm sản phẩm</a><br>
<table border="1px">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Gía</th>
        <th>Mô tả</th>
        <th>Công ty</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${list}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${p.name}"/></td>
            <td><c:out value="${p.price}"/></td>
            <td><c:out value="${p.description}"/></td>
            <td><c:out value="${p.company}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
