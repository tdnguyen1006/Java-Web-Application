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
     DESCRIPTION: Reports page front end 
-->
<%@ include file="/partial/_head.jsp"%>
<%@ include file="/partial/_navigation.jsp"%>
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

<div class="container-fliud">
	<div class="container">
		<div class="row test">

			<h1 class="text-center">Reports</h1>
			<h4 class="text-center">Quick filter</h4>

	<!-- form start -->
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/ReportController"
				method="post">

				<div class="col-sm-4">
	<!--  report template-->
					<div class="form-group col-sm-12">
						<select class="form-control" name="template" id="template">
							<option value="0">Select report template</option>
							<option value="" selected>Fall Report 2017</option>
						</select> <span class="error"></span>
					</div>

				</div>
				<div class="col-sm-4">
	<!-- department -->
					<div class="form-group col-sm-12">
						<select class="form-control" name="department" id="department">
							<option value="0">Select department</option>
							<option value="" selected>Accounting</option>
						</select> <span class="error"></span>
					</div>
				</div>
				<div class="col-sm-4">
	<!--  employee -->
					<div class="form-group col-sm-12">

						<select class="form-control" name="employee" id="employee">
							<option value="0">Select report template</option>
							<option value="" selected>Bruce Wayne report</option>
						</select> <span class="error"></span>
					</div>
				</div>
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
	<!-- button controls -->
					<div class="form-group">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-default">View</button>
							<button type="reset" class="btn btn-default">Cancel</button>
						</div>
					</div>
				</div>
				<div class="col-sm-4"></div>
			</form>
			
	<!--  form end -->
	<div class="col-sm-12">
	       <hr>
	  
	<!--  report description table  -->     
	       <table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2">Details</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>Report</th>
							<td>Fall 2017 report</td>
						</tr>
						<tr>
							<th>Report title</th>
							<td>Bruce Wayne</td>
						</tr>
						<tr>
							<th>Date created</th>
							<td>02/12/2017</td>
						</tr>
						<tr>
							<th>Department</th>
							<td>Accounting</td>
						</tr>
						
					</tbody>
					
				</table>

			
				<table  class="table table-bordered">
	<!-- Contribution  -->			
				   <thead>
						<tr>
							<th colspan="3">Contribution</th>
							
						</tr>
						<tr>
							<th></th>
							<th>Evaluation</th>
							<th>Comment</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>Research and gathering</td>
							<td>4</td>
							<td rowspan="4">Bruce is always contributing to corporate objectives</td>
						</tr>
						<tr>
							<td>Sharing information</td>
							<td>4</td>
						</tr>
						<tr>
							<td>Using time wisely</td>
							<td>4</td>
						</tr>
						<tr>
							<td>Ready to work</td>
							<td>5</td>
						</tr>
						
						
					</tbody>
	
	<!-- Responsibilities  -->					
					<thead>
						<tr>
							<th colspan="3">Responsibilities</th>
							
						</tr>
						<tr>
							<th></th>
							<th>Evaluation</th>
							<th>Comment</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>Fulfill teams role</td>
							<td>4</td>
							<td rowspan="3">Bruce meets all his responsibilities</td>
						</tr>
						<tr>
							<td>Sharing work equally</td>
							<td>4</td>
						</tr>
						<tr>
							<td>Helping team members</td>
							<td>4</td>
						</tr>
						
						
						
					</tbody>
<!-- Value  -->			
					<thead>
						<tr>
							<th colspan="3">Value</th>
							
						</tr>
						<tr>
							<th></th>
							<th>Evaluation</th>
							<th>Comment</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>Listen to others</td>
							<td>4</td>
							<td rowspan="3">Overall, Bruce brings much value to our organization</td>
						</tr>
						<tr>
							<td>Includes teammates</td>
							<td>4</td>
						</tr>
						<tr>
							<td>Make fair decisions</td>
							<td>4</td>
						</tr>
												
						
						
					</tbody>
					<tfoot>
						<tr>
							<th>Total</th>
							<th>40/50</th>
							<th></th>
						</tr>
					</tfoot>
				
				</table>
	</div>
	
	<!--  table end -->
	
	   <% 
	     if(role.equals("A")){
	    	 
	   %>

			<div class="col-sm-12">
			<hr>

				<form class="form-horizontal"
				action=""
				method="post">

					<div class="col-sm-4"></div>
					<div class="col-sm-4">
	<!--edit button control -->
						<div class="form-group">
							
								<button type="submit" class="btn btn-default">Edit</button>
						
						</div>
					</div>
					<div class="col-sm-4"></div>

				</form>

			</div>
			
			<%
	     		}
			%>


		</div>
	</div>
</div>

<%@ include file="/partial/_footer.jsp"%>