<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="models.*"%>
<%@ page import="service.utilities.*"%>
<%@ page import="helper.utilities.*"%>

<%
	response.setContentType("text/html");
	int reportTemplateID = Integer.parseInt(request.getParameter("rt"));
	String str = "<select class='form-control' name='group' id='group'>";
	String str1 = "<select name='employee'><option value='0'>Select Employee</option>";
	if (reportTemplateID != 0) {
		Department department = ReportService.getDepartmentWithReportTemplateID(reportTemplateID);
		str += "<option value='" + department.getDepartmentId() + "'>" + department.getName() + "</option>";
		str += "</select>";
		response.getWriter().println(str);
		
		
		for(Employee employee : EmployeeService.getEmployeesWithDepartmentID(department.getDepartmentId()))
		{
			str1 += "<option value='" + employee.getEmployeeNumber() + "'>" + 
					employee.getFirstName() + " " + employee.getLastName() + "</option>";
		}
		str1 += "</select>";
		response.getWriter().println(str1);
		
		
// 		List<Report> section = ReportService.getAllReportSectionTemplate(reportTemplateID);
		
// 		System.out.println(section.get(0).getSectionName());
// 		System.out.println(section.get(1).getSectionName());
// 		System.out.println(section.get(2).getSectionName());
		
// 		String s1 = "<input type='text' class='form-control' name='section1' id='section1' value='" + section.get(0).getSectionName() + "' disabled></input>";
// 		String s2 = "<input type='text' class='form-control' name='section2' id='section2' value='" + section.get(1).getSectionName() + "' disabled>";
// 		String s3 = "<input type='text' class='form-control' name='section3' id='section3' value='" + section.get(2).getSectionName() + "' disabled>";
	
	}
	else
	{
		str += "<option value='0'>Select Department</option></select>";
		response.getWriter().println(str);
		
		str1 += "<option value='0'>Select Employee</option></select>";
		response.getWriter().println(str1);
// 		String s1 = "<input type='text' class='form-control' name='section1' id='section1' value='' placeholder='Enter Section 1' disabled>";
// 		String s2 = "<input type='text' class='form-control' name='section2' id='section2' value='' placeholder='Enter Section 1' disabled>";
// 		String s3 = "<input type='text' class='form-control' name='section3' id='section3' value='' placeholder='Enter Section 1' disabled>";
				
		
	}
%>
