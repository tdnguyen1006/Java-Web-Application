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
     DESCRIPTION: employees page front end 
-->
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ include file="/partial/_head.jsp"%>
<%@ include file="/partial/_navigation.jsp"%>
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
<div class="container-fliud">
	<div class="container">
		<div class="row test">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<h1 class="text-center">Employee Entry</h1>
				<div class="col-sm-12 text-center"><span class="success">${messages.success}</span></div>
				<div class="col-sm-12 text-center"><span class="error">${messages.general}</span></div>
				<form class="form-horizontal" action="${pageContext.request.contextPath}/EmployeeController"
					method="post">
					<div class="form-group">
						<label class="control-label col-sm-3" for="firstName">First
							Name:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="firstName"
								id="firstName" placeholder="Enter first name">
								<span class="error">${messages.firstName}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="lastName">Last
							Name:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="lastName"
								id="lastName" placeholder="Enter last name">
								<span class="error">${messages.lastName}</span>
						</div>
					</div>
				
					<div class="form-group">
						<label class="control-label col-sm-3" for="email">Email:</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" name="email" id="email"
								placeholder="Enter email"> 
								<span class="error">${messages.email}</span>
						</div>
					</div>

					<!-- Date  -->


					<div class="form-group ">
						<label class="control-label col-sm-3" for="date">Date hired: </label>

						<div class="col-sm-9">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calculator"></i>
								</div>
								<input class="form-control" id="date" name="date"
									placeholder="DD/MM/YYYY" type="text" />
									
							</div>
							<span class="error">${messages.date}</span>
						</div>

					</div>

					<div class="form-group">
						<label class="control-label col-sm-3" for="jobPosition">Job
							position:</label>
						<div class="col-sm-9">
							<select class="form-control" name="jobPosition" id="jobPosition">
								<option value="0">Select Job Position</option>
								<%
									String url = "jdbc:mysql://localhost:3306/COMP3095";
									String dbusername = "admin";
									String dbpassword = "admin";
									String sql = "Select * from job where position != 'CEO'";
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection(url, dbusername, dbpassword);
									Statement stm = con.createStatement();
									ResultSet rs = stm.executeQuery(sql);
									while (rs.next()) {
								%> 
								<option value="<%=rs.getInt("id")%>"><%=rs.getString("position")%></option>
								<%
									}
								%>
							</select> <span class="error">${messages.jobPosition}</span>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button type="submit" class="btn btn-default">Submit</button>
							<button type="reset" class="btn btn-default">Cancel</button>
						</div>
					</div>

				</form>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</div>

<%@ include file="/partial/_footer.jsp"%>