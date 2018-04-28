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
		String str = "<select name='employee'><option value='0'>Select Employee</option>";
		for(Employee employee : EmployeeService.getEmployeesWithDepartmentID(department))
		{
			str += "<option value='" + employee.getEmployeeNumber() + "'>" + 
					employee.getFirstName() + " " + employee.getLastName() + "</option>";
		}
		str += "</select>";
		response.getWriter().println(str);
	}
%>