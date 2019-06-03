<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body
{
	background-image: url("Backgrounds/bg-others.jpg");
}
form
{
	text-align:center;
	margin-top:100px;
}
input
{
	margin: 10px;
}
input[name="itemSpecs"]
{
	width: 500px;
	height: 100px;
}
</style>
<%@ page import="shoppingsite.Stock"%>
</head>
<body>
<form action="addItem.jsp" method="Post">
	Enter item name: <input type="text" name="itemName"><br>
	Enter item cost: <input type="number" name="itemCost"><br>
	Enter item Specs: <input type="text" name="itemSpecs"><br>
	<input type="submit" name ="submit" value="Add Item">
</form>
</body>
</html>