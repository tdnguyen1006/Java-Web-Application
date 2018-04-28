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
     DESCRIPTION: Index page front end 
-->

   <%@ include file="/partial/_head.jsp" %>
   <%@ include file="/partial/_navigation.jsp" %>
   
	<div class="container-fliud">
		<div class="container">
			<div class="row test">

				<div class="col-sm-12 banner">
					<h1 class="text-center">Welcome <%=session.getAttribute("userInfo") %> !</h1>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/partial/_footer.jsp" %>

	