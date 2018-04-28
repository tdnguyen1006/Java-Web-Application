package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helper.utilities.HelperUtilities;

@WebServlet("/GroupController")
public class GroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GroupController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String> messages = new HashMap<String, String>();
	    request.setAttribute("messages", messages);

		int department = Integer.parseInt(request.getParameter("department"));
		String groupName = request.getParameter("groupName");
		int employee1 = Integer.parseInt(request.getParameter("employee1"));
		int employee2 = Integer.parseInt(request.getParameter("employee2"));
		int employee3 = Integer.parseInt(request.getParameter("employee3"));
		int employee4 = Integer.parseInt(request.getParameter("employee4"));
		int employee5 = Integer.parseInt(request.getParameter("employee5"));
		int employee6 = Integer.parseInt(request.getParameter("employee6"));

		ArrayList<Integer> arr = new ArrayList<Integer>();
		arr.add(employee1);
		arr.add(employee2);
		arr.add(employee3);
		arr.add(employee4);
		arr.add(employee5);
		arr.add(employee6);

		String url = "jdbc:mysql://localhost:3306/COMP3095";
		String username = "admin";
		String password = "admin";

		if (!HelperUtilities.isChosen(department) || HelperUtilities.isEmptyOrNull(groupName)
				|| !HelperUtilities.isChosen(employee1) || !HelperUtilities.isChosen(employee2)
				|| !HelperUtilities.isChosen(employee3) || !HelperUtilities.isChosen(employee4)
				|| !HelperUtilities.isChosen(employee5) || !HelperUtilities.isChosen(employee6)) {
			messages.put("general", "All fields are required");
		} else {
			if (HelperUtilities.isDuplicate(arr) == false) {
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection connect = DriverManager.getConnection(url, username, password);
					String sql = "Select e.*, g.groupname from employee as e left join groups as g on e.groupid = g.id where g.groupname = ? ";
					PreparedStatement ps = connect.prepareStatement(sql);
					ps.setString(1, groupName);
					ResultSet rs = ps.executeQuery();
					if (rs.next()) {
						messages.put("general", "Group Already Existed!");
					}
					else
					{
						String sql2 = "Select e.*, g.groupname from employee as e left join groups as g on e.groupid = g.id where e.groupid = g.Id  ";
						Statement st = connect.createStatement();
						ResultSet rs2 = st.executeQuery(sql2);
						if(rs2.next())
						{
							messages.put("general", rs2.getString("FirstName") + " " + rs2.getString("LastName") + " is already in " + rs2.getString("GroupName"));
						}
						else
						{
							String ins = "Insert into groups (groupname) values (?)";
							PreparedStatement ps2 = connect.prepareStatement(ins);
							ps2.setString(1, groupName);
							int i = ps2.executeUpdate();
							if (i > 0)
							{
								String sql3 = "Select * from groups where groupname = ?";
								PreparedStatement ps3 = connect.prepareStatement(sql3);
								ps3.setString(1, groupName);
								ResultSet rs3 = ps3.executeQuery();
								if(rs3.next())
								{
									for(int j = 0; j < arr.size(); j++)
									{
										String update = "Update Employee SET groupid = ? where employeenumber = ?";
										PreparedStatement ps4 = connect.prepareStatement(update);
										ps4.setInt(1, rs3.getInt("id"));
										ps4.setInt(2, arr.get(j));
										int k = ps4.executeUpdate();
										if(k > 0)
										{
											messages.put("general", "Update Employee Group Successfully!");
										}
										else
										{
											messages.put("general", "Update Employee Group Failed!");
										}
										ps4.close();
									}
								}
							}
							else
							{
								messages.put("general", "Insert into Group Failed!");
							}
							ps2.close();
						}
						rs2.close();
						st.close();
					}
					
					rs.close();
					ps.close();
					connect.close();
				} catch (Exception e) {
					messages.put("general", e.toString());
				}
			} else {
				messages.put("general", "Cannot have duplicate employee");
			}
			
		}
		request.getRequestDispatcher("manage/manageGroup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
