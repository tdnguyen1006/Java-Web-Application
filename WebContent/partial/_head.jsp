<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="helper.utilities.*"%>
<%
	session = request.getSession();
	if (session.getAttribute("userInfo") == null) {
	
		if (HelperUtilities.cookieExists(request, "username")) {
			session.setAttribute("userInfo", HelperUtilities.getCookieValue(request, "username"));
			session.setAttribute("role", HelperUtilities.getCookieValue(request, "role"));
	
		} else {
			response.sendRedirect("/COMP3095_INFINNOV/login.jsp");
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Web Application Assignment 1">
<meta name="keywords" content="Java, Servlet">
<meta name="autor" content="INFINNOV">
<title>INFINNOV</title>
<!-- Isolated Version of Bootstrap, not needed if your site already uses Bootstrap -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!-- Bootstrap Date-Picker Plugin -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>