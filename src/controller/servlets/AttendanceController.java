package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helper.utilities.HelperUtilities;
import models.Attendance;
import models.Employee;
import service.utilities.AttendanceService;
import service.utilities.EmployeeService;

@WebServlet("/AttendanceController")
public class AttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AttendanceController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Attendance attendance = new Attendance();
		Employee employee = new Employee();
		boolean successfull = false;

		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);

		String date = request.getParameter("date");
		int departmentID = 0;

		if (!HelperUtilities.isEmptyOrNull(request.getParameter("departmentID"))) {
			departmentID = Integer.parseInt(request.getParameter("departmentID"));
		}

		if (!HelperUtilities.isEmptyOrNull(request.getParameter("date"))) {
			request.setAttribute("date", date);
		}

		String[] present = request.getParameterValues("present");

		if (HelperUtilities.isEmptyOrNull(date)) {
			messages.put("error", "Please select attendance date.");
		} else if (present == null) {
			messages.put("error", "Please enter attendance record.");
		} else {
			attendance.setAttendanceDate(HelperUtilities.convertStringToDate(date));
			
			if(AttendanceService.attendanceExists(departmentID, attendance.getAttendanceDate())){
				messages.put("error", "The attendance record already exists.");			
			}else{
				for (Employee e : EmployeeService.getEmployeesWithDepartmentID(departmentID)) {
					successfull = AttendanceService.insertAttendance(attendance.getAttendanceDate(), e.getEmployeeNumber());
				}

				for (int i = 0; i < present.length; i++) {
					attendance.setAttendanceStatus(1);
					employee.setEmployeeNumber(Integer.parseInt(present[i]));
					successfull = AttendanceService.updateAttendance(attendance.getAttendanceDate(),
							attendance.getAttendanceStatus(), employee.getEmployeeNumber());
				}

				if (successfull) {
					request.removeAttribute("date");
					messages.put("success", "Attendance record entered successfully");
				} else {
					messages.put("error", "Unable to enter attendance record");
				}
				
			}
		}

		request.getRequestDispatcher("manage/manageAttendance.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
