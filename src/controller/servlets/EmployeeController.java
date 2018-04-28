package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helper.utilities.HelperUtilities;
import models.Attendance;

@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Create a session object if it is already not  created.
		HttpSession session = request.getSession(true);
		

		String userInfo = (String)session.getAttribute("userInfo");
		// Get session creation time.
		Date createTime = new Date(session.getCreationTime());

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String dateHired = request.getParameter("date");
		int jobPosition = Integer.parseInt(request.getParameter("jobPosition"));
		String result = "";
		
		Map<String, String> messages = new HashMap<String, String>();
	    request.setAttribute("messages", messages);

		if(HelperUtilities.isEmptyOrNull(firstName) || !HelperUtilities.isAlphabet(firstName))
		{
			messages.put("firstName", "Invalid First Name!");
		}
		else if(HelperUtilities.isEmptyOrNull(lastName) || !HelperUtilities.isAlphabet(lastName))
		{
			messages.put("lastName", "Invalid Last Name!");
		}
		else if(HelperUtilities.isEmptyOrNull(email) || !HelperUtilities.isValidEmail(email))
		{
			messages.put("email", "Invalid Email!");
		}
		else if(HelperUtilities.isEmptyOrNull(dateHired))
		{
			messages.put("dateHired", "Invalid hire date!");
		}
		else if(!HelperUtilities.isChosen(jobPosition))
		{
			messages.put("jobPosition", "Invalid Job Position!");
		}
		else
		{
			
			
			try
			{
				
				String myDriver = "com.mysql.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/COMP3095";
				String dbusername = "admin";
				String dbpassword = "admin";
				Class.forName(myDriver);
				Connection connect  = DriverManager.getConnection(url, dbusername, dbpassword);
				String sql = 	"SELECT * FROM EMPLOYEE " + 
						"WHERE FIRSTNAME = ? AND LASTNAME = ? AND EMAIL = ? AND DATEHIRED = ? AND JOBID = ? ";
				PreparedStatement ps = connect.prepareStatement(sql);
				ps.setString(1, firstName);
				ps.setString(2, lastName);
				ps.setString(3, email);
				ps.setDate(4, HelperUtilities.convertToSqlDate(HelperUtilities.convertStringToDate(dateHired)));
				ps.setInt(5, jobPosition);
			    ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					messages.put("general", "The specified Employee already exists.");
				}else
				{
					sql = "INSERT INTO EMPLOYEE (firstname, lastname, email, jobid, DepartmentID, datehired,username, password, role) values ('" + 
							firstName + "', '" + lastName + "', '" + email + "', "  + jobPosition + 
							", (Select departmentid from job where id = " + jobPosition + "), '" + 
							HelperUtilities.convertToSqlDate(HelperUtilities.convertStringToDate(dateHired)) + "', 'username', 'password', 'U')";
					Statement st = connect.createStatement();
					int j = st.executeUpdate(sql);
					if(j > 0)
					{
						result = "Employee " + firstName + " " + lastName + " has been successfully added on: " + createTime + ".\n";
						messages.put("success", result);
					}
					else
					{
						messages.put("general", "Insert Failed!");
					}
				}
				
				try{
					ps.close();
				}catch(Exception e){
					System.out.println("unable to close statement " + e);
				}
				try{
					rs.close();
				}catch(Exception e){
					System.out.println("unable to close result set " + e);
				}
				try{
					connect.close();
				}catch(Exception e){
					System.out.println("unable to close connection " + e);
				}
				
			}
			catch(Exception e)
			{
				messages.put("general", "Something went wrong. unable to insert the employee.");
				
			}
			
		}
		request.getRequestDispatcher("manage/manageEmployee.jsp").forward(request, response);
	}

}
