<%@page import="shoppingsite.Crypter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style type="text/css">
body
{
	background-image: url("Backgrounds/bg-others.jpg");
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration:none;
}

li a:hover {
  background-color: #111;
  }

</style>
</head>
<body>
<%@ page import="shoppingsite.Stock" %>
<%@ page import="java.util.*" %>
<ul>
  <li><a href="/JS_Learning_ShoppingSite/Shop.jsp">Home</a></li>
  <li><a href="/JS_Learning_ShoppingSite/MyCart.jsp">MyCart</a></li>
  <li><a href="/JS_Learning_ShoppingSite/LogOut.jsp">LogOut</a></li>
</ul>
Hello, <%
Cookie ck[] =request.getCookies();
String username=null;
String random=null;
for(Cookie iter: ck)
{
	if(iter.getName().equals("cookie_username"))
	{
		username=iter.getValue();
	}
	if(iter.getName().equals("cookie_random"))
	{
		random=iter.getValue();
	}
}
try
{
	out.println(Crypter.decrypt(username,random));	
}
catch(Exception e)
{
	request.setAttribute("statusCode","userNotSignedIn");
	getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
}
%><br>
<%
	Enumeration sessions = session.getAttributeNames();
	boolean isEmpty=true;
	while(sessions.hasMoreElements())
	{
		String thisSession= (String) sessions.nextElement();
		if(request.getParameter(thisSession)!=null)
		{
			session.removeAttribute(thisSession);
			continue;
		}
		isEmpty=false;
		%>
		<p id=<%out.println(thisSession);%>>
			<a href="/JS_Learning_ShoppingSite/ItemDescription.jsp?item=<%out.println(thisSession);%>">
			<img src="ShopImages/<%out.println(thisSession);%>.jpg" width="160" height="120" title="<%out.println(thisSession);%>"></a>			
			<%
			out.print("\nProduct: "+thisSession+" Count:"+session.getAttribute(thisSession));%>
			<form method="post" action="/JS_Learning_ShoppingSite/MyCart.jsp">
			<input type="submit" onclick=Delete(thisSession) value="Remove From Cart" name="<%out.print(thisSession);%>"/>
			</form>
			</p>
		<%
	}
	if(isEmpty)
	{
		out.println("Your Cart is Empty");
	}
%>
<script>
function Delete(toDelete)
{
	var element = document.getElementById(toDelete);
    element.remove(element);
}
</script>
<br>The Total Cost is: <%
long total=0;
sessions = session.getAttributeNames();
while(sessions.hasMoreElements())
{
	String thisSession=(String) sessions.nextElement();
	int cost=Stock.stock.get(thisSession);
	total+=cost*Integer.parseInt((String)session.getAttribute(thisSession));
}
out.print(total);
%>
</body>
</html>