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
     DESCRIPTION: Database Connection
******************************************************************************************************************/
package database.utilities;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	
	private static String username = "admin";
	private static String password = "admin";
	private static String database = "COMP3095";
	
	private static Connection connect = null;
	public static Connection connectDatabase() throws Exception
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + 
													database + "?" + "user=" + username + "&password=" + password);
			System.out.println("Database connection Successful");
			return connect;
		}
		catch(Exception e)
		{
			throw e;
		}
	}
}
