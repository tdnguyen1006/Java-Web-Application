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
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>
<%@ include file="/partial/_head.jsp"%>
<%@ include file="/partial/_navigation.jsp"%>

<%!int departmentID = 0;%>
<%!int groupID = 0;%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("department"))) {
		departmentID = Integer.parseInt(request.getParameter("department"));
	}

	if (!HelperUtilities.isEmptyOrNull(request.getParameter("group"))) {
		groupID = Integer.parseInt(request.getParameter("group"));
	}
%>

<script language="javascript" type="text/javascript">
	var xmlHttp;
	function showGroup(str) {
		var xmlHttp = null;

		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var url = "groupddl.jsp";
		url += "?dp=" + str;
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
				document.getElementById("group").innerHTML = xmlHttp.responseText;
				if (str != 0) {
					document.getElementById("group").disabled = false;
				} else {
					document.getElementById("group").disabled = true;
				}
			}
		};
		xmlHttp.open("POST", url, true);
		xmlHttp.send();
	}
</script>


<div class="container-fliud">
	<div class="container">
		<div class="row test">
			<h1 class="text-center">Groups</h1>

			<h4 class="text-center">Quick filter</h4>
			<div class="col-sm-12 text-center">
				<h4 class="text-center" id="error"></h4>
			</div>
			<!-- from start -->
			<form class="" action="${pageContext.request.contextPath}/group.jsp"
				method="post">
				<div class="col-sm-3"></div>
				<div class="col-sm-3">
					<!--  department -->
					<div class="form-group">
						<select class="form-control" name="department" id="department"
							onchange="showGroup(this.value)">
							<option value="0">Select Department</option>
							<%
								for (Department department : DepartmentService.getDepartments()) {
							%>
							<option value="<%=department.getDepartmentId()%>"><%=department.getName()%></option>
							<%
								}
							%>
						</select> <span class="error"></span>
					</div>
				</div>
				<div class="col-sm-3">
					<!--  group -->
					<div class="form-group">
						<select class="form-control" name="group" id="group" disabled>
							<option value="0">Select Group</option>
						</select> <span class="error"></span>
					</div>
				</div>
				<div class="col-sm-3"></div>

				<div style="padding: 0px;" class="col-sm-12">
					<div class="col-sm-3"></div>
					<div class="col-sm-9">
						<!--  button controls -->
						<div class="form-group">
							<button type="submit" class="btn btn-default">Search</button>
							<button type="reset" class="btn btn-default">Cancel</button>
						</div>

					</div>
				</div>

			</form>
			<!--  from end -->

			<%
				if (groupID != 0) {
			%>
			<div class="col-sm-12">
				<hr>
				<!--  table start -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Department</th>
							<th>Group name</th>
							<th>Employee last name</th>
							<th>Employee first name</th>
							<th>Employee #</th>

						</tr>
					</thead>
					<tbody>
						<%
							for (Group group : GroupService.getGroupMemberWithGroupID(groupID)) {
						%>
						<tr>
							<td><%=group.getDepartmentID()%></td>
							<td><%=group.getGroupName()%></td>
							<td><%=group.getEmployeeLastName()%></td>
							<td><%=group.getEmployeeFirstName()%></td>
							<td><%=group.getEmployeeID()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<!--  table end -->
				<%
					}
				%>
			</div>
		</div>
	</div>
</div>

<%@ include file="/partial/_footer.jsp"%>