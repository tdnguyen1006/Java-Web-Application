package service.utilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import database.utilities.DatabaseConnection;
import models.Group;

public class GroupService {
	// put all data access methods here such as getDepartment(id)
	private static Connection connect = null;
	private static Statement st;
	private static List<Group> group;

	public static List<Group> getGroupNameWithDepartmentID(int departmentId) {

		group = new ArrayList<Group>();
		try {
			connect = DatabaseConnection.connectDatabase();
			String sql = "SELECT DISTINCT G.*, D.DepartmentName, D.Id FROM groups AS G"
					+ " JOIN employee AS E ON G.Id = E.GroupID"
					+ " JOIN departments AS D ON E.DepartmentId = D.Id WHERE d.Id = " + departmentId;
			st = connect.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				group.add(new Group(departmentId, rs.getInt("G.ID"), rs.getString("G.GroupName")));
			}

			connect.close();

		} catch (Exception ex) {
			System.out.println("Database error while retrieving group" + ex);
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

		return group;

	}

	public static List<Group> getGroupMemberWithGroupID(int groupID) {

		group = new ArrayList<Group>();
		try {
			connect = DatabaseConnection.connectDatabase();
			String sql = "SELECT E.*, D.DepartmentName, G.GroupName FROM employee AS E "
					+ "JOIN groups AS G ON E.GroupID = G.Id JOIN departments AS D ON E.DepartmentId = D.Id "
					+ "WHERE E.GroupId = " + groupID;
			st = connect.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				group.add(new Group(rs.getInt("E.DepartmentID"), rs.getInt("E.GroupID"), rs.getInt("E.EmployeeNumber"),
						rs.getString("G.GroupName"), rs.getString("E.FirstName"), rs.getString("E.LastName")));
			}

			connect.close();

		} catch (Exception ex) {
			System.out.println("Database error while retrieving group" + ex);
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

		return group;

	}

}
