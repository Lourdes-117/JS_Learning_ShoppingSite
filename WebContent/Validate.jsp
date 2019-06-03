<%@page import="shoppingsite.Crypter"%>
<%@page import="shoppingsite.Validation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="shoppingsite.UserList"%>
<%@ page import ="java.util.Random"%>
<%
	if(request.getParameter("Button").equals("Login"))
	{
		if(shoppingsite.Validation.Validate(request.getParameter("Username"),request.getParameter("Password")).equals("User"))
		{
			Random random = new Random();
			int random_number=random.nextInt(50);
			String cryptedUsername = shoppingsite.Crypter.encrypt(request.getParameter("Username"),random_number); 
			Cookie cookie_username=new Cookie("cookie_username",cryptedUsername);
			Cookie cookie_random=new Cookie("cookie_random",random_number+"");
		    response.addCookie(cookie_username);
		    response.addCookie(cookie_random);
		    setSession(request, response);
			response.sendRedirect("/JS_Learning_ShoppingSite/Shop.jsp");
		}
		else if(shoppingsite.Validation.Validate(request.getParameter("Username"),request.getParameter("Password")).equals("Admin"))
		{
			Random random = new Random();
			int random_number=random.nextInt(50);
			String cryptedUsername = shoppingsite.Crypter.encrypt(request.getParameter("Username"),random_number); 
			Cookie cookie_username=new Cookie("cookie_username",cryptedUsername);
			Cookie cookie_random=new Cookie("cookie_random",random_number+"");
		    response.addCookie(cookie_username);
		    response.addCookie(cookie_random);
			response.sendRedirect("/JS_Learning_ShoppingSite/AdminPage.jsp");
		}
		else if(shoppingsite.Validation.Validate(request.getParameter("Username"),request.getParameter("Password")).equals("NoUser"))
		{
			request.setAttribute("statusCode","NoUser");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		else
		{
			request.setAttribute("statusCode","yes");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}		
	}
	else if(request.getParameter("Button").equals("Register"))
	{
		if(Validation.addUser(request.getParameter("Username"), request.getParameter("Password")))
		{
			request.setAttribute("statusCode","registered");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		else
		{
			request.setAttribute("statusCode","userExists");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
	}
%>
<%!
public static void setSession(HttpServletRequest request, HttpServletResponse response)
{
	if(UserList.JsessionID.get(request.getParameter("Username"))==null)
	{
		Cookie ck[]= request.getCookies();
		for(int iter=0; iter< ck.length; iter++)
		{
			if(ck[iter].getName().equals("JSESSIONID"))
			{
				UserList.JsessionID.put(request.getParameter("Username"), ck[iter].getValue());
				break;
			}
		}
	}
	else
	{
		Cookie ck[]= request.getCookies();
		int length = ck.length;
		for(int iter=0; iter< length; iter++)
		{
			if(ck[iter].getName().equals("JSESSIONID"))
			{
				Cookie cookie = new Cookie(ck[iter].getName(),null);
				cookie.setPath("/JS_Learning_ShoppingSite");
		        cookie.setMaxAge(0);
		        response.addCookie(cookie);
				break;
			}
		}
		Cookie sessionCookie = new Cookie("JSESSIONID", UserList.JsessionID.get(request.getParameter("Username")));
		response.addCookie(sessionCookie);
	}
}
%>
</body>
</html>