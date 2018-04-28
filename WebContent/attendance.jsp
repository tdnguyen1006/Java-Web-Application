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

<%!int departmentID = 0;%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("department"))) {
		departmentID = Integer.parseInt(request.getParameter("department"));
	}
%>

<div class="container-fliud">
	<div class="container">
		<div class="row test">

			<h1 class="text-center">Attendance</h1>
			<h3 class="text-center">Quick filter</h3>

			<!--  from start -->
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/attendance.jsp"
				method="post">

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
								<%if (departmentID == department.getDepartmentId()) {
									out.println("selected='selected'");
								}%>><%=department.getName()%></option>

							<%
								}
							%>


						</select> <span class="error"></span>

					</div>

					<!--  button controls -->
					<div class="form-group">

						<button type="submit" class="btn btn-default">Search</button>
						<button type="reset" class="btn btn-default">Cancel</button>
					</div>

				</div>
				<div class="col-sm-4"></div>
			</form>

			<!--  from end -->
			
			
             <%
                if(departmentID != 0) {
             %>
			<div class="col-sm-12">
				<hr>
				
				<%
			   if(AttendanceService.getEmployeeAttendance(departmentID).size() > 0){
				%>


				<!--  table start -->
				<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Employee Last name</th>
							<th>Employee First name</th>
							<th>Employee #</th>
							<%
								for (Attendance attendance : AttendanceService.getDistinctAttendanceDate(departmentID)) {
							%>
							<th><%=attendance.getAttendanceDate()%></th>
							<%
								}
							%>

						</tr>
					</thead>
					<tbody>
						<%
							for (Employee employee : AttendanceService.getEmployeeAttendance(departmentID)) {
						%>
						<tr>
							<td><%=employee.getLastName()%></td>
							<td><%=employee.getFirstName()%></td>
							<td><%=employee.getEmployeeNumber()%></td>
							
							<%
							for (Attendance attendance : AttendanceService.getDistinctAttendanceStatus(departmentID, employee.getEmployeeNumber())) {
								
								if(attendance.getAttendanceStatus() == 1){
							%>
							<td><span class="glyphicon glyphicon-ok"></span></td>
							<%}else{%>
							
							<td></td>
								<%
								}
							}
								%>

						</tr>
						<%
							}
						%>


					</tbody>
				</table>
				<!--  table end  -->
				
				</div>
				
				<%
			   		}else{
				%>
				<h4 class="text-center">No attendance record found for this department.</h4>

                <%
			   		}
                %>
			</div>
			
			<%
                }
			%>





		</div>
		<!-- row end -->
	</div>
	<!-- container end -->
</div>
<!--  container-fluid end -->

<%@ include file="/partial/_footer.jsp"%>