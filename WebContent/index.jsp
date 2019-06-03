<%@page import="shoppingsite.UserList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style type="text/css">

body {
	background-image: url("Backgrounds/bg-login.jpg");
}
div {
	width: 500px;
	padding: 20px;
	border: 5px solid grey;
	border-radius:25px;
	background-color:rgba(255, 255, 255, 0.8);
	margin-left:auto;
	margin-right:auto;
	margin-top:150px;
	box-shadow: 10px 10px 10px 10px rgba(0, 0, 0, 0.3); 
}
input[type="submit"]
{
	margin-left: 20px;
	width: 100px;
	height:30px;
}
</style>
</head>
<body>
<%@ page session="false" %>
<%
request.getSession(true);
try
{
	Cookie ck[] = request.getCookies();
	if(ck.length>2)
	{
		getServletContext().getRequestDispatcher("/Shop.jsp").forward(request,response);
	}
}catch(Exception e){}
%>
 
<div>
	<form action="Validate.jsp" method="post">
		<h1>Enter your Login Details Here</h1>
		<p>Enter the Username: <input type="text" name="Username"<%
		try
		{
			if(request.getParameter("Username")!=null)
			{
				out.println("value=\""+request.getParameter("Username")+"\"");
			}
		}
		catch(Exception e){}
		%>></p>
		<p>Enter the Password: <input type="Password" name="Password"
		<%
		try
		{
			if(request.getParameter("Password")!=null)
			{
				out.println("value=\""+request.getParameter("Password")+"\"");
			}
		}
		catch(Exception e){}%>></p><br>
		<input type="submit" name="Button" value="Login"/>
		<input type="submit" name="Button" value="Register"/>
	</form>
	<%
	try
	{
		if(request.getAttribute("statusCode").equals("yes"))
		{%>
			<p style="color:red">Wrong Username/Password Try Again!
		<%}
		else if(request.getAttribute("statusCode").equals("NoUser"))
		{%>
			<p style="color:red">UserName not found! Please Register.
		<%}
		else if(request.getAttribute("statusCode").equals("registered"))
		{%>
		<p style="color:green">Registration Done!
		<script type="text/javascript">
		alert("Success!");
		</script>
		<%}
		else if(request.getAttribute("statusCode").equals("userExists"))
		{%>
		<p style="color:red">UserName already Exists!
		<%}
		else if(request.getAttribute("statusCode").equals("userNotSignedIn"))
		{%>
		<p style="color:red">Please Sign in to View Your Cart
		<script type="text/javascript">
			alert("Please Sign in to view your Cart");
		</script>
		<%}
	}catch(Exception e){}
	%>
</div>
</body>
</html>