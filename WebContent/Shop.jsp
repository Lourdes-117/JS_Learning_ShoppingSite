 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop</title>
<style type="text/css">
body
{
	background-image: url("Backgrounds/bg-others.jpg");
}
ul {
  list-style-type: none;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
}

li a:hover {
  background-color: #111;
  }
  item img
  {
  margin-left:20px;
  margin-right:20px;
  margin-bottom:20px;
  margin-bottom:50px;
  border-radius:8px;
  }
  item img:hover
  {
  background-color: #111;
  box-shadow: 10px 10px 5px black;
  }
  </style>
  <%@ page import="shoppingsite.Stock"%>
</head>
<body>
<ul>
  <li><a href="/JS_Learning_ShoppingSite/Shop.jsp">Home</a></li>
  <li><a href="/JS_Learning_ShoppingSite/MyCart.jsp">MyCart</a></li>
  <li><a href="/JS_Learning_ShoppingSite/LogOut.jsp">LogOut</a></li>
</ul>
<item>
<%
if(!Stock.isPrinted)
{
	Stock.test();
	Stock.isPrinted=true;
}
for(Stock iter: Stock.stockList)
{
	%>
	<a href="/JS_Learning_ShoppingSite/ItemDescription.jsp?item=<%out.print(iter.Name);%>"><img src="ShopImages/<%out.print(iter.Name);%>.jpg" width="320" height="240" title="<%out.print(iter.Name);%>"></a>
	<%	
}
%>
</item>
</body>
</html>