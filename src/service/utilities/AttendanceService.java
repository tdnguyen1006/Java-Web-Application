package service.utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import database.utilities.DatabaseConnection;
import helper.utilities.HelperUtilities;
import models.Attendance;
import models.Employee;

public class AttendanceService {

	private static Connection connect = null;
	private static Statement st;
	private static PreparedStatement ps;
	private static ResultSet rs;
	private static String query;
	private static List<Attendance> attendanceRecords;
	private static List<Employee> employeeAttendance;
	private static List<Attendance> attendanceStatus;

	public static boolean insertAttendance(Date date, int employeeNumber) {
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "INSERT INTO ATTENDANCE(AttendanceDate, EmployeeNumber)" + "VALUES (?,?)";
			ps = connect.prepareStatement(query);
			ps.setDate(1, HelperUtilities.convertToSqlDate(date));
			ps.setInt(2, employeeNumber);
			int inserted = ps.executeUpdate();

			if (inserted > 0) {

				return true;
			}

		} catch (Exception ex) {
			System.out.println("Database error while inserting attendance record" + ex);
		} finally {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}
		}

		return false;
	}

	public static boolean updateAttendance(Date date, int status, int employeeNumber) {

		try {
			connect = DatabaseConnection.connectDatabase();
			query = "UPDATE ATTENDANCE SET AttendanceStatus = ? WHERE AttendanceDate = ? AND EmployeeNumber = ? ";
			ps = connect.prepareStatement(query);
			ps.setInt(1, status);
			ps.setDate(2, HelperUtilities.convertToSqlDate(date));
			ps.setInt(3, employeeNumber);
			int updated = ps.executeUpdate();

			if (updated > 0) {

				return true;
			}

		} catch (Exception ex) {
			System.out.println("Database error while updating attendance record" + ex);
		} finally {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}
		}

		return false;
	}

	public static List<Attendance> getAttendanceRecords() {

		attendanceRecords = new ArrayList<Attendance>();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT * FROM ATTENDANCE";
			st = connect.createStatement();
			rs = st.executeQuery(query);
			while (rs.next()) {
				attendanceRecords.add(new Attendance(rs.getInt("AttendanceId"), rs.getDate("AttendanceDate"),
						rs.getInt("AttendanceStatus")));
			}

		} catch (Exception ex) {
			System.out.println("Database error while retrieving attendance record");
		} finally {
			try {
				st.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}
		}

		return attendanceRecords;

	}

	public static List<Attendance> getDistinctAttendanceDate(int departmentID) {

		attendanceRecords = new ArrayList<Attendance>();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT DISTINCT ATTENDANCEDATE FROM ATTENDANCE " + "JOIN EMPLOYEE "
					+ "ON ATTENDANCE.EMPLOYEENUMBER = EMPLOYEE.EMPLOYEENUMBER "
					+ "WHERE EMPLOYEE.DEPARTMENTID = ? ORDER BY ATTENDANCEDATE ASC";
			ps = connect.prepareStatement(query);
			ps.setInt(1, departmentID);
			rs = ps.executeQuery();
			while (rs.next()) {
				attendanceRecords.add(new Attendance(rs.getDate("AttendanceDate")));
			}

		} catch (Exception ex) {
			System.out.println("Database error while retrieving attendance date " + ex);
		} finally {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}
		}

		return attendanceRecords;

	}

	public static List<Employee> getEmployeeAttendance(int departmentID) {

		employeeAttendance = new ArrayList<Employee>();

		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT DISTINCT EMPLOYEE.EMPLOYEENUMBER, EMPLOYEE.FIRSTNAME, " + "EMPLOYEE.LASTNAME "
					+ "FROM ATTENDANCE " + "JOIN EMPLOYEE " + "ON ATTENDANCE.EMPLOYEENUMBER = EMPLOYEE.EMPLOYEENUMBER "
					+ "WHERE EMPLOYEE.DEPARTMENTID = ? ";
			ps = connect.prepareStatement(query);
			ps.setInt(1, departmentID);
			rs = ps.executeQuery();

			while (rs.next()) {
				employeeAttendance.add(
						new Employee(rs.getInt("EmployeeNumber"), rs.getString("FirstName"), rs.getString("LastName")));
			}

		} catch (Exception ex) {
			System.out.println("Database error while retrieving attendance " + ex);
		} finally {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}

		}

		return employeeAttendance;

	}

	public static List<Attendance> getDistinctAttendanceStatus(int departmentID, int employeeNumber) {

		attendanceStatus = new ArrayList<Attendance>();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT DISTINCT ATTENDANCESTATUS, ATTENDANCEDATE FROM ATTENDANCE " + "JOIN EMPLOYEE "
					+ "ON ATTENDANCE.EMPLOYEENUMBER = EMPLOYEE.EMPLOYEENUMBER "
					+ "WHERE EMPLOYEE.DEPARTMENTID = ? AND ATTENDANCE.EMPLOYEENUMBER = ? ORDER BY ATTENDANCEDATE ASC";
			ps = connect.prepareStatement(query);
			ps.setInt(1, departmentID);
			ps.setInt(2, employeeNumber);
			rs = ps.executeQuery();
			while (rs.next()) {
				attendanceStatus.add(new Attendance(rs.getInt("AttendanceStatus")));
			}

		} catch (Exception ex) {
			System.out.println("Database error while retrieving attendance date " + ex);
		} finally {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}
		}

		return attendanceStatus;

	}

	public static boolean attendanceExists(int departmentID, Date date) {

		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT DISTINCT EMPLOYEE.EMPLOYEENUMBER, ATTENDANCE.ATTENDANCEDATE " + "FROM ATTENDANCE "
					+ "JOIN EMPLOYEE " + "ON ATTENDANCE.EMPLOYEENUMBER = EMPLOYEE.EMPLOYEENUMBER "
					+ "WHERE EMPLOYEE.DEPARTMENTID = ? AND ATTENDANCE.ATTENDANCEDATE = ? ";
			ps = connect.prepareStatement(query);
			ps.setInt(1, departmentID);
			ps.setDate(2, HelperUtilities.convertToSqlDate(date));

			rs = ps.executeQuery();
			if (rs.next()) {

				return true;
			}

		} catch (Exception ex) {
			System.out.println("Database error while retrieving attendance " + ex);
		} finally {
			try {
				ps.close();
			} catch (Exception e) {
				System.out.println("unable to close statement " + e);
			}
			try {
				connect.close();
			} catch (Exception e) {
				System.out.println("unable to close connection " + e);
			}
		}

		return false;

	}
}
