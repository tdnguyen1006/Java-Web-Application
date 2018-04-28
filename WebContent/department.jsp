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
     DESCRIPTION: department page front end 
-->
<%@ page import="java.util.*"%>
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ include file="/partial/_head.jsp"%>
<%@ include file="/partial/_navigation.jsp"%>

<div class="container-fliud">
	<div class="container">
		<div class="row test">
			<h1 class="text-center">Departments</h1>

			<div class="col-sm-2"></div>
			<div class="col-sm-8">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Department name</th>
							<th>Department location</th>
						</tr>
					</thead>
					<tbody>
						<%														
							for (Department department : DepartmentService.getDepartments()) {
						%>
						<tr>
							<td><%=department.getName()%></td>
							<td><%=department.getLocation()%></td>
						</tr>
						<%
							}
						%>


					</tbody>
				</table>
			</div>
			<div class="col-sm-2"></div>


		</div>
	</div>
</div>

<%@ include file="/partial/_footer.jsp"%>