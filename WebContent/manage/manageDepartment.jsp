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
    <%@ include file="/partial/_head.jsp" %>
    <%@ include file="/partial/_navigation.jsp" %>
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
					<h1 class="text-center">Department Entry</h1>
					<div class="col-sm-12 text-center"><span class="error">${messages.general}</span></div>
					<div class="col-sm-12 text-center"><span class="error">${messages.departmentExists}</span></div>
					<div class="col-sm-12 text-center"><span class="success">${messages.success}</span></div>
					<form class="form-horizontal" action="${pageContext.request.contextPath}/DepartmentController" method="post">
					    <div class="form-group">
					      <label class="control-label col-sm-3" for="departmentName">Department Name:</label>
					      <div class="col-sm-9">
					        <input type="text" class="form-control" name="departmentName" id="departmentName" placeholder="Enter department name">
					        <span class="error">${messages.departmentName}</span>
					      </div>
					    </div>
					    <div class="col-sm-3"></div>  
					    <div class="col-sm-9 error"></div>
					    <div class="form-group">
					    
					      <label class="control-label col-sm-3" for="deprtmentLocation">Department Location:</label>
					      <div class="col-sm-9">     
					           
					        <input type="text" class="form-control" name="departmentLocation" id="departmentLocation" placeholder="Enter department location">
					        <span class="error">${messages.departmentLocation}</span>
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

	<%@ include file="/partial/_footer.jsp" %>