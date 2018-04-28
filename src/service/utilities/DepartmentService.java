package service.utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.utilities.DatabaseConnection;
import models.Department;

public class DepartmentService {

	private static Connection connect = null;
	private static Statement st;
	private static PreparedStatement ps;
	private static String departName;
	private static String departLocation;
	private static List<Department> departments;
	
	public static boolean departmentExists(Department department){
		
		departName = department.getName();
		departLocation = department.getLocation();
		
		try{		
			connect = DatabaseConnection.connectDatabase();
			String sql = "SELECT * FROM DEPARTMENTS WHERE departmentName = '" + departName + "' AND "
					+ " departmentLocation = '" + departLocation + "'" ;
			st = connect.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
		
			
		}catch(Exception ex){
			System.out.println("Database error");
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
		
		return false;		
	}
	
	public static boolean insertDepartment(Department department){
		
		departName = department.getName();
		departLocation = department.getLocation();
		
		try{		
			connect = DatabaseConnection.connectDatabase();
			String query = "INSERT INTO departments(DepartmentName, DepartmentLocation)" + "VALUES (?,?)";
			ps = connect.prepareStatement(query);
			ps.setString(1, departName);
			ps.setString(2, departLocation); 
			int i = ps.executeUpdate();
			if (i > 0) {
				return true;
			} 	
			
		}catch (Exception ex){
			System.out.println("Database error while inserting department");
		}finally{
			try{
				ps.close();
			}catch(Exception e){
				System.out.println("unable to close statement " + e);
			}
			try{
				connect.close();
			}catch(Exception e){
				System.out.println("unable to close connection " + e);
			}
		}
		
		return false;
	}
	
	public static List<Department> getDepartments(){
		
		departments = new ArrayList<Department>();
		try{		
			connect = DatabaseConnection.connectDatabase();
			String sql = "SELECT * FROM DEPARTMENTS";
			st = connect.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				departments.add(new Department(rs.getInt("id"), rs.getString("departmentName"), rs.getString("departmentLocation")));
			}
		
		}catch(Exception ex){
			System.out.println("Database error while retrieving departments");
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
		
		return departments;
		
	}
}
