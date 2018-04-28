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
     DESCRIPTION: Attendance page front end 
-->
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>
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
<%!int departmentID = 0;
  String date = "";

%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("department"))) {
		departmentID = Integer.parseInt(request.getParameter("department"));
	}
	if(!HelperUtilities.isEmptyOrNull((String)request.getAttribute("date"))){
		date = (String)request.getAttribute("date");
	}
%>


<div class="container-fluid">
	<div class="container">
		<div class="row test">
			<h1 class="text-center">Attendance Entry</h1>
			<h3 class="text-center">Quick filter</h3>
			<span id="result"></span>

			<!--  from start -->
			<form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/manage/manageAttendance.jsp">

				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<!--  departments -->
					<div class="form-group">
						<select class="form-control" name="department" id="department">
							<option value="0" selected>Select department</option>
							<%
								for (Department department : DepartmentService.getDepartments()) {
							%>
							<option value="<%=department.getDepartmentId()%>" 
							
									<%
										if (departmentID == department.getDepartmentId()) {
											out.println("selected='selected'");
										}
									%>
									
									><%=department.getName()%></option>

							<%
								}
							%>
							
						
						</select> <span class="error"></span>

					</div>

					<!--  button controls -->
					<div class="form-group">

						<input type="submit" value="Search" class="btn btn-default"
							id="btnSearch"> <input type="reset" value="Cancel"
							class="btn btn-default" id="btnCancel">
					</div>

				</div>
				<div class="col-sm-4"></div>
				<span id="result"></span>
			</form>

			<!--  from end -->


			<%
				if (departmentID != 0) {
			%>
			<div class="col-sm-12">
				<hr>

				<!--  form start -->
				<form class="form-horizontal" action="${pageContext.request.contextPath}/AttendanceController" method="post">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
					<span class="success">${messages.success }</span>
					<span class="error">${messages.error }</span>
						<!-- date picker -->
						<div class="form-group ">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calculator"></i>
								</div>
								<input class="form-control" id="date" name="date"
									placeholder="DD/MM/YYYY" type="text" value="<%=date %>"/>
							</div>
						</div>
						<div class="form-group ">
							<input type="hidden" value="<%=departmentID%>" name="departmentID" >
						</div>
					</div>
					<div class="col-sm-4"></div>

					<!--  table start -->

					<table class="table table-striped">
						<thead>
							<tr>
								<th>Employee Last name</th>
								<th>Employee First name</th>
								<th>Employee #</th>
								<th>Present</th>

							</tr>
						</thead>
						<tbody>
							<%
								for (Employee employee : EmployeeService.getEmployeesWithDepartmentID(departmentID)) {
							%>
							<tr>
								<td><%=employee.getLastName()%></td>
								<td><%=employee.getFirstName()%></td>
								<td><%=employee.getEmployeeNumber()%></td>
								<td><input type="checkbox" name="present"
									value="<%=employee.getEmployeeNumber()%>"></td>

							</tr>
							<%
								}
							%>

						</tbody>
					</table>
					<!--  table end  -->

					<hr>

					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<!--edit button control -->
						<div class="form-group">
							<button type="submit" class="btn btn-default">Enter</button>
						</div>
					</div>
					<div class="col-sm-4"></div>

				</form>
				<!--  form end -->
			</div>

			<%
				}
			%>

		</div>
		<!--  row end-->

	</div>
	<!--  container end-->

</div>


<%@ include file="/partial/_footer.jsp"%>

