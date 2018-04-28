package service.utilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.utilities.DatabaseConnection;
import models.Department;
import models.Employee;

public class EmployeeService {

	private static Connection connect = null;
	private static Statement st;
	private static List<Employee> employees;

	public static List<Employee> getEmployeesWithDepartmentID(int departmentId) {

		employees = new ArrayList<Employee>();
		try {
			connect = DatabaseConnection.connectDatabase();
			String sql = "SELECT * FROM EMPLOYEE " + "WHERE DEPARTMENTID = " + departmentId + " "
					+ "ORDER BY LASTNAME ASC";
			st = connect.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				employees.add(new Employee(rs.getInt("EmployeeNumber"), rs.getString("FirstName"),
						rs.getString("LastName"), rs.getString("Email"), rs.getDate("DateHired")));
			}
			
			connect.close();

		} catch (Exception ex) {
			System.out.println("Database error while retrieving employees" + ex);
		}finally{
			try{
				st.close();
			}catch(Exception e){
				System.out.println("unable to close statement " + e);
			}
			try{
				connect.close();
			}catch(Exception e){
				System.out.println("unable to close connection " + e);
			}
		}
		

		return employees;

	}
}
