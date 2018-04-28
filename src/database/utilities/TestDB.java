/***************************************************************************************************************
     PROJECT: COMP3095 WEB APPLICATION DEVELOPMENT 
     ASSIGNMENT: 1 
     GROUP NAME: INFINNOV
     DATE: 10/22/2017
     AUTHORS: 
     		HAMAD AHMAD        -  101006399
     		MENTESNOT ABOSET   -  101022050
     		TOAN NGUYEN        -  100979753
     		ZHENG LIU          -  100970328
     DESCRIPTION: Tests database connection
******************************************************************************************************************/
package database.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestDB {

	public static void main(String[] args) {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Found");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver not found" + e);
		}
        
		String url = "jdbc:mysql://localhost:3306/COMP3095";
		String username = "admin";
		String password = "admin";

		Connection connect = null;
		try {
			connect = DriverManager.getConnection(url, username, password);
			
			System.out.println("Connection success");
		} catch (SQLException e) {
			System.out.println("error connecting db" + e);
		}

	}

}
