<%@ page import="helper.utilities.*" %>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/index.jsp">INFINNOV</a>
		</div>
		<div class="navbar-collapse collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/department.jsp">Departments</a></li>
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/employee.jsp">Employees</a></li>
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/group.jsp">Group</a></li>
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/report.jsp">Reports</a></li>
				<li class="dropdown"><a
					href="${pageContext.request.contextPath}/attendance.jsp">Attendance</a></li>
				<%   String role = "";
					//if role is admin show the manage dropdown
                     if(!HelperUtilities.isEmptyOrNull((String)session.getAttribute("role"))){
                    	 role = (String)session.getAttribute("role");
                     }
					if (role.equals("A")) {
				%>


				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown"> Manage<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a
							href="${pageContext.request.contextPath}/manage/manageDepartment.jsp">Department</a></li>
						<li><a
							href="${pageContext.request.contextPath}/manage/manageEmployee.jsp">Employee</a></li>
						<li><a
							href="${pageContext.request.contextPath}/manage/manageGroup.jsp">Group</a></li>
									<li><a
							href="${pageContext.request.contextPath}/manage/reportTemplate.jsp">Report template</a></li>
						<li><a
							href="${pageContext.request.contextPath}/manage/manageReport.jsp">Report</a></li>
						<li><a
							href="${pageContext.request.contextPath}/manage/manageAttendance.jsp">Attendance</a></li>
					</ul></li>

				<%
					}
				%>
			</ul>

			<ul class="nav navbar-nav navbar-right">
		
				<li><a href="">Hello, <%=session.getAttribute("userInfo")%>
						!
				</a></li>
				<li><a href="${pageContext.request.contextPath}/LogoutController">Logout</a></li>
			</ul>
		</div>
	</div>
</nav>