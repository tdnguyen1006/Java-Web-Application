package service.utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import database.utilities.DatabaseConnection;
import helper.utilities.HelperUtilities;
import models.Employee;

public class LoginService {
	private static String username;
	private static String password;
	private static Connection connect = null;
	private static PreparedStatement ps;
	private static ResultSet rs;
	private static String query;

	public static boolean isValidUser(Employee employee) {

		username = HelperUtilities.filter(employee.getUsername());
		password = HelperUtilities.filter(employee.getPassword());

		// authenticates user login
		try {

			connect = DatabaseConnection.connectDatabase();

			query = "SELECT * FROM EMPLOYEE WHERE username = ? AND password = ? ";
			ps = connect.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) {

				employee.setFirstName(rs.getString("FirstName"));
				employee.setRole(rs.getString("Role"));

				return true;
			}

		} catch (SQLException e) {
			System.out.println("Sql database error " + e);
		} catch (Exception ex) {
			System.out.println("Error connecting db " + ex);
		}

		return false;

	}

	public static boolean isValidUserInput(Employee employee) {

		username = employee.getUsername();
		password = employee.getPassword();

		if (HelperUtilities.isEmptyOrNull(username) || HelperUtilities.isEmptyOrNull(password)) {
			return false;
		}
		return true;
	}

	

}
