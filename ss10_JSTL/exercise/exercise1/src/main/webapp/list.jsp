<%--
  Created by IntelliJ IDEA.
  User: mylie
  Date: 8/28/2023
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
            width: 1000px;
            text-align: center;
        }
        .header{
            margin-left: 300px;
            font-size: 30px;
        }
    </style>
</head>
<body>
<table border="1px">
    <thead>
    <b class="header">Danh sách khách hàng</b>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Hình ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="c" items="${list}" varStatus="item">
        <tr>
            <td><c:out value="${item.count}"/></td>
            <td><c:out value="${c.name}"/></td>
            <td><c:out value="${c.birth}"/></td>
            <td><img src="${c.image}" alt="image" width="100px" height="100px"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
