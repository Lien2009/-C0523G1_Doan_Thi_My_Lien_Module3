<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
        .border-form{
            border: 1px solid;
            background-color: cornflowerblue;
            width: 200px;
            height: 200px;
            padding: 30px;
            font-size: 20px;
        }
    </style>
</head>
<body>
<h2>Product Discount Calculator</h2>
<form action="/calculator-servlet" method="post" class="border-form">
    <label>Product Description: </label><br>
    <input type="text" name="description" placeholder="description" value="${description}"><br>
    <label>List Price: </label><br>
    <input type="text" name="price" placeholder="price" value="${price}"><br>
    <label>Discount Percent : </label><br>
    <input type="text" name="discount" placeholder="discount" value="${discount}"><br>
    <input type="submit" id="submit" value="Calculate Discount">
</form>
<h1>Discount Amount: ${amount}</h1>
<h1>Discount Price: ${total}</h1>
</body>
</html>