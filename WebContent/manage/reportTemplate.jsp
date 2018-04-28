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
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>

<%!int departmentID = 0;%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("department"))) {
		departmentID = Integer.parseInt(request.getParameter("department"));
	}
%>
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
<div class="container-fluid">
	<div class="container">
		<div class="row test">
			<h1 class="text-center">Create report template</h1>
			<h3 class="text-center">Details</h3>

			<div class="col-sm-12 text-center">
				<span class="error">${messages.general}</span>
			</div>
			<!-- form start -->
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/ReportTemplateController"
				method="post">

				<!-- details start -->

				<div class="col-sm-2"></div>
				<div class="col-sm-8">

					<!-- Report template -->

					<div class="form-group">
						<label class="control-label col-sm-3" for="reportTemplate">Report
							template:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="reportTemplate"
								value="" id="reportTemplate"
								placeholder="Enter Report Template Name"> <span
								class="error"></span>
						</div>
					</div>

					<!-- Date  -->


					<div class="form-group ">
						<label class="control-label col-sm-3" for="date">Date: </label>

						<div class="col-sm-9">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="fa fa-calculator"></i>
								</div>
								<input class="form-control" id="date" name="date"
									placeholder="DD/MM/YYYY" type="text" />
							</div>
						</div>

					</div>

					<!-- Department  -->

					<div class="form-group">
						<label class="control-label col-sm-3" for="department">Department:</label>
						<div class="col-sm-9">
							<select class="form-control" name="department" id="department">
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
							</select> <span class="error"></span>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>

				<!-- details end -->


				<!--  section I start -->
				<div class="col-sm-12">
					<hr>
					<div class="col-sm-4">

						<!--  contribution start -->

						<div class="form-group">
							<label class="control-label col-sm-4" for="section1">Section
								I</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="section1"
									id="section1" value="" placeholder="Enter Section I"> <span
									class="error"></span>
							</div>
						</div>

						<!--  contribution end -->

					</div>
					<div class="col-sm-4">
						<!--  criteria start -->

						<!--  criteria 1 -->

						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria1">Criteria
								1</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria1"
									id="criteria1" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!--  criteria 2 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria2">Criteria
								2</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria2"
									id="criteria2" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!--  criteria 3 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria3">Criteria
								3</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria3"
									id="criteria3" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!--  criteria 4 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria4">Criteria
								4</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria4"
									id="criteria4" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!--  criteria 5 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria5">Criteria
								5</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria5"
									id="criteria5" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

					</div>
					<!--  criteria end -->


					<!--  score start -->
					<div class="col-sm-4">

						<!-- maximum 1 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum1">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum1" id="maximum1">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>

						<!-- maximum 2 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum2">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum2" id="maximum2">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>

						<!-- maximum 3 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum3">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum3" id="maximum3">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>

						<!-- maximum 4 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum4">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum4" id="maximum4">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>
						<!-- maximum 5 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum5">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum5" id="maximum5">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>
					</div>
					<!--  score end -->

				</div>
				<!-- section I end -->


				<!-- section II start -->
				<div class="col-sm-12">

					<hr>
					<div class="col-sm-4">

						<!--  responsibility -->
						<div class="form-group">
							<label class="control-label col-sm-4" for="section2">Section
								II</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="section2"
									id="section2" placeholder="Enter Section II" value="">
								<span class="error"></span>
							</div>
						</div>

					</div>
					<div class="col-sm-4">

						<!-- criteria 1 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria6">Criteria
								1</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria6"
									id="criteria6" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!-- criteria 2 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria7">Criteria
								2</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria7"
									id="criteria7" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!-- criteria 3 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria8">Criteria
								3</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria8"
									id="criteria8" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>
					</div>
					<!-- responsibility score start -->
					<div class="col-sm-4">

						<!-- maximum 1 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum6">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum6" id="maximum6">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>

						<!-- maximum 2 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum7">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum7" id="maximum7">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>
						<!-- maximum 3 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum8">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum8" id="maximum8">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>
					</div>
					<!-- responsibility score start -->

				</div>
				<!-- section II end -->


				<!-- section III start -->
				<div class="col-sm-12">

					<hr>
					<div class="col-sm-4">
						<!--  value -->
						<div class="form-group">
							<label class="control-label col-sm-4" for="section3">Section
								III</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="section3"
									id="section3" value="" placeholder="Enter Section III">
								<span class="error"></span>
							</div>
						</div>

					</div>

					<!--  value criteria start -->
					<div class="col-sm-4">

						<!-- criteria 1 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria10">Criteria
								1</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria10"
									id="criteria10" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!-- criteria 2 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria11">Criteria
								2</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria11"
									id="criteria11" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>

						<!-- criteria 3 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="criteria12">Criteria
								3</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="criteria12"
									id="criteria12" placeholder="Enter criteria"> <span
									class="error"></span>
							</div>
						</div>
					</div>
					<!-- value criteria end -->

					<!--  value score start -->
					<div class="col-sm-4">

						<!--  value maximum 1-->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum10">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum10" id="maximum10">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>
						<!--  value maximum 2 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum11">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum11" id="maximum11">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>

						<!--  value maximum 3 -->
						<div class="form-group">
							<label class="control-label col-sm-3" for="maximum12">maximum:</label>
							<div class="col-sm-3">
								<select class="form-control" name="maximum12" id="maximum12">
									<%
										for (int i = 1; i < 6; i++) {
									%><option value="<%=i%>"><%=i%></option>
									<%
										}
									%>
								</select> <span class="error"></span>
							</div>
						</div>

					</div>
					<!--  value score end -->

				</div>
				<!-- section III end -->


				<!-- button section start -->
				<div class="col-sm-12">
					<hr>
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
						<div class="form-group">
							<div class="col-sm-12">
								<button type="submit" class="btn btn-default">Create</button>
								<button type="reset" class="btn btn-default">Cancel</button>
							</div>
						</div>
					</div>
					<div class="col-sm-4"></div>
				</div>

				<!-- button section end -->

			</form>

			<!-- form end -->


		</div>
		<!--  row end -->
	</div>
	<!--  container end -->
</div>
<!--  container-fluid end -->

<%@ include file="/partial/_footer.jsp"%>