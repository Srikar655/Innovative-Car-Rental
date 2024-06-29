<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.iss.services.*,java.util.*,com.iss.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<c:choose>
    	<c:when test="${param.btn eq 'login'}">
    		<c:if test="${param.username != 'null' and pram.password != 'null'}">
    			<%
    				Customers customer=new CustomerService().checkIsThere(request.getParameter("username"), request.getParameter("password"));
    				if(customer!=null)
    				{
    					for(int i=0;i<10;i++)
    						System.out.println("Login");
    					session.setAttribute("loginsuccess", "Welcome - "+request.getParameter("username"));
    						session.setAttribute("customerno",customer.getCustomerNo());
    							response.sendRedirect("UserHomePageService.jsp");
    				}
    				else
    				{
    					session.setAttribute("loginfailure", "UserName or Password Incorrect");
    					response.sendRedirect("UserHomePage.jsp");
    				}
    			%>
    		</c:if>
    	</c:when>
    	<c:when test="${param.btn eq 'logintobuy'}">
    		<c:if test="${param.username != 'null' and pram.password != 'null'}">
    			<%
    				Customers customer=new CustomerService().checkIsThere(request.getParameter("username"), request.getParameter("password"));
    				if(customer!=null)
    				{
    					session.setAttribute("loginsuccess", "Welcome - "+request.getParameter("username"));
    						session.setAttribute("customerno",customer.getCustomerNo());
    						response.sendRedirect("UserHomePageService.jsp?btn=buy");
    				}
    				else
    				{
    					session.setAttribute("loginfailure", "UserName or Password Incorrect");
    					response.sendRedirect("UserLogin.jsp");
    				}
    			%>
    		</c:if>
    	</c:when>
    </c:choose>
</body>
</html>