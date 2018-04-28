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
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>
<%@ page import="models.*"%>
<%@ include file="/partial/_head.jsp"%>
<%@ include file="/partial/_navigation.jsp"%>

<%

   String departId = "";
  if(!HelperUtilities.isEmptyOrNull(request.getParameter("department"))){
	  departId = request.getParameter("department");
  }
%>

<div class="container-fluid">
	<div class="container">
		<div class="row test">
			<h1 class="text-center">Employees</h1>
			<h4 class="text-center">Quick filter</h4>
		
			
   <!--  from start -->
				<form class="form-horizontal"
					action="employee.jsp"
					method="post">
					
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
		<!--  departments -->
						<div class="form-group">
								<select class="form-control" name="department" id="department">
									<option value="0">Select department</option>
	<%
									String url = "jdbc:mysql://localhost:3306/COMP3095";
									String dbusername = "admin";
									String dbpassword = "admin";
									String sql = "Select * from departments";
									Class.forName("com.mysql.jdbc.Driver");
									Connection con = DriverManager.getConnection(url, dbusername, dbpassword);
									Statement stm = con.createStatement();
									ResultSet rs = stm.executeQuery(sql);
									while (rs.next()) {
								%>
								<option value="<%=rs.getInt("id")%>"><%=rs.getString("DepartmentName")%></option>
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
			
			
			<% if(!departId.equals("")) {%>
			<div class="col-sm-12">
			<hr>
			
	<!--  table start -->
			<table class="table table-striped">
					<thead>
						<tr>
							<th>Last name</th>
							<th>First name</th>
							<th>Employee #</th>
							<th>Date Hired</th>
							<th>Email</th>
							<th>Job position</th>
						</tr>
					</thead>
					<tbody>
				<% 

      			%>
					<% 
					
					try{
				
						String sql2 = "SELECT * FROM EMPLOYEE " + 
								"JOIN JOB ON EMPLOYEE.JOBID = JOB.ID " +
								"WHERE EMPLOYEE.DEPARTMENTID = " + departId + " "
								+ "ORDER BY EMPLOYEE.LASTNAME ASC";
						Class.forName("com.mysql.jdbc.Driver");
						Connection con2 = DriverManager.getConnection(url, dbusername, dbpassword);
						Statement stm2 = con.createStatement();
						ResultSet rs2 = stm.executeQuery(sql2);
						while(rs2.next()){
					%>
						<tr>

							<td><%=rs2.getString("LastName") %></td>
							<td><%=rs2.getString("FirstName") %></td>
							<td><%=rs2.getString("EmployeeNumber") %></td>
							<td><%=rs2.getDate("DateHired") %></td>  
							<td><%=rs2.getString("Email") %></td>
							<td><%=rs2.getString("position") %></td> 

						</tr>
					<% 
						}
							
						} catch (Exception e) {
						e.printStackTrace();
						}
					
					%>
					
					</tbody>
				</table>
	<!--  table end  -->
			
			</div>
			<%
			}
			%>
			
			
		</div><!-- row end -->
	</div><!--  container end-->
</div><!-- container-fluid end -->

<%@ include file="/partial/_footer.jsp"%>