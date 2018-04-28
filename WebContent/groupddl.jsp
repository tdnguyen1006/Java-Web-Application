<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>
<%     
    session = request.getSession();  
    if(session.getAttribute("userInfo") == null){
    	response.sendRedirect("login.jsp");
    }  
    
 %>
<%
	response.setContentType("text/html");
	int department = Integer.parseInt(request.getParameter("dp"));
	if(department != 0)
	{
		String str = "<select class='form-control' name='group' id='group'><option value='0'>Select Group</option>";
		for(Group group : GroupService.getGroupNameWithDepartmentID(department))
		{
			str += "<option value='" + group.getGroupID() + "'>" + group.getGroupName() + "</option>";
		}
		str += "</select>";
		response.getWriter().println(str);
	}
	else
	{
		String str = "<select class='form-control' name='group' id='group' disabled><option value='0'>Select Group</option></select>";
		response.getWriter().println(str);
	}
%>