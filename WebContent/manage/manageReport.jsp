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

<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>

<%!int departmentID = 0;%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("department"))) {
		departmentID = Integer.parseInt(request.getParameter("department"));
	}
%>

<%!int ReportTemplateID = 0;%>
<%
	if (!HelperUtilities.isEmptyOrNull(request.getParameter("template"))) {
		ReportTemplateID = Integer.parseInt(request.getParameter("template"));
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

<script language="javascript" type="text/javascript">
	function disableGroup() {
		document.getElementById('group').disabled = true;
		document.getElementById('employee').disabled = false;
	}

	function disableEmployee() {
		document.getElementById('group').disabled = false;
		document.getElementById('employee').disabled = true;
	}
</script>

<script language="javascript" type="text/javascript">
	var xmlHttp;
	function showTemplate(str) {
		var xmlHttp = null;

		if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		var url = "../rtlist.jsp";
		url += "?rt=" + str;
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
				document.getElementById("department").innerHTML = xmlHttp.responseText;
				document.getElementById("employee").innerHTML = xmlHttp.responseText;
				// 				document.getElementById("section1").innerHTML = xmlHttp.responseText;
				// 				document.getElementById("section2").innerHTML = some.getElementById("section2");
				// 				document.getElementById("section3").innerHTML = some.getElementById("section3");
			}
		};
		xmlHttp.open("POST", url, true);
		xmlHttp.send();
	}
</script>

<div class="container-fluid">
	<div class="container">
		<div class="row test">
			<h1 class="text-center">Report Entry</h1>
			<h3 class="text-center">Details</h3>



			<!--  from start -->
			<form class="form-horizontal" action="manageReport.jsp" method="post">

				<div class="col-sm-4"></div>
				<div class="col-sm-12">
					<div class="col-sm-4">
						<!--  report template -->
						<div class="form-group">
							<select class="form-control" name="template" id="template"
								onchange="showTemplate(this.value)">
								<option value="0">Select report template</option>
								<%
									for (Report reportTemplate : ReportService.getAllReportTemplate()) {
								%>
								<option value="<%=reportTemplate.getReportTemplateID()%>"><%=reportTemplate.getReportTemplateName()%></option>
								<%
									}
								%>
							</select> <span class="error"></span>
						</div>
					</div>
					<div class="col-sm-4">
						<!-- title -->
						<div class="form-group">
							<label class="control-label col-sm-4" for="title">Report
								title:</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="title" id="title"
									value="" placeholder="Enter report title"> <span
									class="error"></span>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<!-- date  -->
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
					</div>
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
									<option value="<%=department.getDepartmentId()%>"><%=department.getName()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="col-sm-6">
							<!--  group -->
							<div class="form-group">
								<div class="col-sm-12">
									<select class="form-control" name="group" id="group" disabled>
										<option value="0">Select group</option>
									</select> <span class="error"></span>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<!--  employee -->
							<div class="form-group">
								<div class="col-sm-12">
									<select class="form-control" name="employee" id="employee"
										disabled>
										<option value="0">Select Employee</option>
									</select> <span class="error"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<!--  button controls -->
						<div class="form-group">
							<button type="submit" class="btn btn-default">Search</button>
							<button type="reset" class="btn btn-default">Cancel</button>
						</div>
					</div>
				</div>
				<!--  details end -->
			</form>


			<!--  from end -->



			<div class="col-sm-12">
				<hr>
				<!-- form start -->
				<form class="form-horizontal"
					action="${pageContext.request.contextPath}/ReportController"
					method="post">

					<!--  section I start -->


					<%
						for (Report report : ReportService.getAllReportSectionTemplate(ReportTemplateID)) {
					%>
					<div class="col-sm-12">
						<hr>
						<div class="col-sm-8">

							<div class="col-sm-4">
								<!-- contribution -->
								<div class="form-group">

									<div class="col-sm-12">
										<input type="text" class="form-control" name="section1"
											placeholder="Enter Section 1" id="section1"
											value="<%=report.getSectionName()%>" disabled> <span
											class="error"></span>
									</div>
								</div>

							</div>
							<div class="col-sm-4">

								<!--  criteria -->

								<!--  criteria 1-->
								<%
									for (Report criteria : ReportService.getSectionCriteria(report.getSectionID())) {
								%>

								<div class="form-group">
									<div class="col-sm-12">
										<input type="text" class="form-control" name="criteria1"
											id="criteria1" value="<%=criteria.getCriteria()%>"
											placeholder="Enter criteria" disabled> <span
											class="error"></span>
									</div>
								</div>

								<%
									}
								%>

							</div>

							<!--  contribution score -->
							<div class="col-sm-4">

								<!-- evaluation 1 -->
								<div class="form-group">
									<label class="control-label col-sm-6" for="evaluation">Evaluation:</label>
									<div class="col-sm-6">
										<select class="form-control" name="evaluation" id="evaluation">
											<%
												for (int i = 1; i < 6; i++) {
											%><option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select> <span class="error"></span>
									</div>
								</div>
								<!-- evaluation 2 -->
								<div class="form-group">
									<label class="control-label col-sm-6" for="evaluation">Evaluation:</label>
									<div class="col-sm-6">
										<select class="form-control" name="evaluation" id="evaluation">
											<%
												for (int i = 1; i < 6; i++) {
											%><option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select> <span class="error"></span>
									</div>
								</div>
								<!-- evaluation 3 -->
								<div class="form-group">
									<label class="control-label col-sm-6" for="evaluation">Evaluation:</label>
									<div class="col-sm-6">
										<select class="form-control" name="evaluation" id="evaluation">
											<%
												for (int i = 1; i < 6; i++) {
											%><option value="<%=i%>"><%=i%></option>
											<%
												}
											%>
										</select> <span class="error"></span>
									</div>
								</div>
								<!-- evaluation 4 -->
								<div class="form-group">
									<label class="control-label col-sm-6" for="evaluation">Evaluation:</label>
									<div class="col-sm-6">
										<select class="form-control" name="evaluation" id="evaluation">
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

						</div>
						<div class="col-sm-4">


							<div class="form-group">

								<textarea class="form-control textarea-long" rows="5"
									id="comment">Excellent work</textarea>
							</div>

						</div>
					</div>

					<%
						}
					%>

					<!--  section I end -->


					<!--  buttons section start -->
					<div class="col-sm-12">
						<hr>
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<div class="form-group">
								<div class="col-sm-12">
									<button type="submit" class="btn btn-default">Enter</button>
									<button type="reset" class="btn btn-default">Cancel</button>
								</div>
							</div>
						</div>
						<div class="col-sm-4"></div>
					</div>
					<!--  buttons section end -->


				</form>
				<!-- from end  -->

			</div>



		</div>
		<!--  row end -->
	</div>
	<!--  container end -->
</div>
<!-- container-fluid end  -->

<%@ include file="/partial/_footer.jsp"%>