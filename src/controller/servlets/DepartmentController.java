package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.utilities.DatabaseConnection;
import helper.utilities.HelperUtilities;
import models.Department;
import service.utilities.DepartmentService;

@WebServlet("/DepartmentController")
public class DepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DepartmentController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		
		String errorMsg = "", successMsg = "";
		// Retrieve data from the Department form
		String departName = request.getParameter("departmentName");
		String departLocation = request.getParameter("departmentLocation");
		
		Department department = new Department();
		
		department.setName(departName);
		department.setLocation(departLocation);
		
				
		Map<String, String> messages = new HashMap<String, String>();
	    request.setAttribute("messages", messages);
	    
		// Create error messages
		if (HelperUtilities.isEmptyOrNull(departName)) {
			errorMsg = "Please Enter the Department Name.";
			messages.put("departmentName", errorMsg);
		} else if (!HelperUtilities.isAlphabet(departName)) {
			errorMsg = "Please Enter Only Text for Department Name.";
			messages.put("departmentName", errorMsg);
		} else if (HelperUtilities.isEmptyOrNull(departLocation)) {
			errorMsg = "Please Enter the Department Location.";
			messages.put("departmentLocation", errorMsg);
		}

		// Validate user input
		if (!HelperUtilities.isEmptyOrNull(departName) && HelperUtilities.isAlphabet(departName)
				&& !HelperUtilities.isEmptyOrNull(departLocation)) {
			if(DepartmentService.departmentExists(department)){
				
				errorMsg = "The department already exists.";
				messages.put("departmentExists", errorMsg);
				
			}else{				
				//attempt to insert department info
			   			
				if(DepartmentService.insertDepartment(department)){
					
					successMsg = "The department inserted succesfully";
					messages.put("success", successMsg);
				}else{
					errorMsg = "Something went wrong. Unable to insert the department.";
					messages.put("insertError", errorMsg);
				}			
			}
		} 
		request.getRequestDispatcher("manage/manageDepartment.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
