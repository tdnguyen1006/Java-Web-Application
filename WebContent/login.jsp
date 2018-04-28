<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
 <%@ page import="helper.utilities.*" %>   
 
 <%
	 session = request.getSession();  
	 if(session.getAttribute("userInfo") == null){
	 	
	 	if(HelperUtilities.cookieExists(request, "username")){
	 		
	 		//retrieves cookie values if exists
	 		session.setAttribute("userInfo", HelperUtilities.getCookieValue(request, "username"));
	 		session.setAttribute("role", HelperUtilities.getCookieValue(request, "role"));
	 		
	 		response.sendRedirect("/COMP3095_INFINNOV/index.jsp");
	 	}
	 }else if(session.getAttribute("userInfo") != null){
	 	
		 response.sendRedirect("/COMP3095_INFINNOV/index.jsp");
	 	
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
	<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css">
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fliud">
	<div class="container">
		<div class="row test">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1 class="text-center">Login</h1>
				<form class="form-horizontal" action="LoginController" method="post">
					<div class="col-sm-3"></div>
					<div class="col-sm-9 error">
						${loginError}
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="username">Username:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="username"
								id="username" placeholder="Enter username">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="password">Password:</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" name="password"
								id="password" placeholder="Enter password">
						</div>
					</div>
					<div class="form-group">
						<div class="checkbox col-sm-offset-3 col-sm-9">
	    					<label><input type="checkbox" name="rememberMe"> Remember me</label>
	  					</div>
  					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-default">Login</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</div>


<%@ include file="/partial/_footer.jsp"%>
