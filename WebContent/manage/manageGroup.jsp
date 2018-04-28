<!--  
     PROJECT: COMP3095 WEB APPLICATION DEVELOPMENT 
     ASSIGNMENT: 2 
     GROUP NAME: INFINNOV
     DATE: 01/04/2018
     AUTHORS: 
     		HAMAD AHMAD        -  101006399
     		MENTESNOT ABOSET   -  101022050
     		TOAN NGUYEN        -  100979753
     		ZHENG LIU          -  100970328
     DESCRIPTION: groups page front end 
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>
<%

	String error = "";
	String success = "";
	if (request.getParameter("error") != null) {
		error = request.getParameter("error");
	}
	if (request.getParameter("success") != null) {
		success = request.getParameter("success");
	}
%>

<%!int departmentID = 0;%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("department"))) {
		departmentID = Integer.parseInt(request.getParameter("department"));
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<script language="javascript" type="text/javascript">
	var xmlHttp;
	function showEmployee(str) {
		var xmlHttp = null;

		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var url = "../employeeddl.jsp";
		url += "?dp=" + str;
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
				document.getElementById("employee1").innerHTML = xmlHttp.responseText;
				document.getElementById("employee2").innerHTML = xmlHttp.responseText;
				document.getElementById("employee3").innerHTML = xmlHttp.responseText;
				document.getElementById("employee4").innerHTML = xmlHttp.responseText;
				document.getElementById("employee5").innerHTML = xmlHttp.responseText;
				document.getElementById("employee6").innerHTML = xmlHttp.responseText;
			}
		};
		xmlHttp.open("POST", url, true);
		xmlHttp.send();
	}
</script>
</head>
<body>
	<%@ include file="/partial/_navigation.jsp"%>
	<div class="container-fliud">
		<div class="container">
			<div class="row test">

				<h1 class="text-center">Group Entry</h1>
				<div class="col-sm-12 text-center">
					<span class="error">${messages.general}</span>
				</div>
				<form class="form-horizontal"
					action="${pageContext.request.contextPath}/GroupController"
					method="POST">
					<div class="col-sm-2"></div>
					<div class="col-sm-8">

						<div class="form-group">
							<label class="control-label col-sm-3" for="department">Department</label>
							<div class="col-sm-9">
								<select class="form-control" name="department" id="department"
									onchange="showEmployee(this.value)">
									<option value="0">Select Department</option>
									<%
										for (Department department : DepartmentService.getDepartments()) {
									%>
									<option value="<%=department.getDepartmentId()%>"
										<%if (departmentID == department.getDepartmentId()) {
					out.println("selected='selected'");
				}%>><%=department.getName()%></option>

									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-3" for="groupName">Group
								Name:</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="groupName"
									id="groupName" placeholder="Enter group name">
							</div>
						</div>

					</div>
					<div class="col-sm-2"></div>

					<%
						for (int i = 1; i <= 6; i++) {
					%>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label col-sm-4" for="employee<%=i%>">Employee
								<%=i%>:
							</label>
							<div class="col-sm-8">
								<select class="form-control" name="employee<%=i%>"
									id="employee<%=i%>">
									<option value='0'>Select Employee</option>
								</select>
							</div>
						</div>
					</div>
					<%
						}
					%>


					<div class="col-sm-2"></div>
					<div class="col-sm-8">

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-default">Submit</button>
								<button type="reset" class="btn btn-default">Cancel</button>
							</div>
						</div>
					</div>

					<div class="col-sm-2"></div>
				</form>

			</div>
		</div>
	</div>
	<%@ include file="/partial/_footer.jsp"%>