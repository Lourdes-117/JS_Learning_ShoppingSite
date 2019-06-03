<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.util.*"%>
<%
	Cookie ck[] = request.getCookies();
	for(int iter=0;iter<ck.length;iter++)
	{
		System.out.println(ck[iter].getValue());
		ck[iter].setMaxAge(0);
		response.addCookie(ck[iter]);
		if(ck[iter].getName().equals("JSESSIONID"))
		{
			Cookie cookie = new Cookie(ck[iter].getName(),null);
			cookie.setPath("/JS_Learning_ShoppingSite");
	        cookie.setMaxAge(0);
	        response.addCookie(cookie);
			break;
		}
	}
	response.sendRedirect("/JS_Learning_ShoppingSite/index.jsp");
%>
</body>
</html>