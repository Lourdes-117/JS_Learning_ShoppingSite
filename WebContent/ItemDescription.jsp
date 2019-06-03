<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Buy <%out.println(request.getParameter("item"));%></title>
<style type="text/css">
body
{
	background: url("Backgrounds/bg-others.jpg") no-repeat;
  	background-size: cover;
}

  h1{
  text-align: center;
  }
  img{
	  display:block;
	  margin-left: auto;
	  margin-right: auto;
  }
  p
  {
  	text-align:center;
  }
  form
  {
  	text-align:center;
  }
  </style>
  <%@ page import="shoppingsite.Stock"%>
</head>
<body>
<jsp:include page="NavigationBar.html"></jsp:include>

<%
if(request.getParameter("AddToCart")!=null)
{
	session.setAttribute(request.getParameter("item"),request.getParameter("Count"));
}
%>
<%
boolean valid=false;
for(Stock StockIter: Stock.stockList)
{
	if(StockIter.Name.equals(request.getParameter("item")))
		valid=true;
}
if(!valid)
{
	response.sendRedirect("/JS_Learning_ShoppingSite/index.jsp");
}
%>
	<h1>Buy <%out.println(request.getParameter("item"));%>:</h1>
	<a href="/JS_Learning_ShoppingSite/ItemDescription.jsp?item=<%out.print(request.getParameter("item"));%>"><img
		src="ShopImages/<%out.println(request.getParameter("item"));%>.jpg" width="320" height="240" title="<%out.print(request.getParameter("item"));%>"></a>
	<br><br>
	<p>
	<%
	for(Stock iter: Stock.stockList)
	{
		if(iter.Name.equals(request.getParameter("item")))
		{
			out.print(iter.Specs);
		}
	}
	%>
	<br>Price: <%out.println(Stock.stock.get(request.getParameter("item")));%>/-
	<br> Give the Count:
	</p>
	<br>
	<form action="ItemDescription.jsp?item=<%out.print(request.getParameter("item"));%>" onsubmit=return Validate() method="post">
	<input type="number" id="numberOfProducts" min="1" name="Count" <%
	if(session.getAttribute(request.getParameter("item"))!=null)
	{
		out.print("value="+session.getAttribute(request.getParameter("item")));
		System.out.println("AddedJS");
	}
	else
	{
		out.print("value=0");
	}
	%>>
	<input type="submit" name="AddToCart" onclick="addToCart()" value="Add To Cart"/>
	</form>
	<script type="text/javascript">
	function addToCart()
	{
		var numberOfProducts = document.getElementById("numberOfProducts").value;
		if(numberOfProducts>0)
		{
			alert("Added To Cart!");
		}
		else
		{
			alert("Please Slelect a value greater than 0");
		}
	}
	</script>
</body>
</html>