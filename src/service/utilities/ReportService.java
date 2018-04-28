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
import models.*;

public class ReportService {
	
	private static Connection connect = null;
	private static Statement st;
	private static PreparedStatement ps;
	private static ResultSet rs;
	private static String query;
	private static List<Report> reportTemplate;
	private static int departmentID;
	private static Department dp;
	
	public static boolean insertReportTemplate(int departmentID, Date date, String title) {
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "INSERT INTO REPORTTEMPLATE (DepartmentID, Description, CreatedDate) VALUES (?, ?, ?)";
			ps = connect.prepareStatement(query);
			ps.setInt(1, departmentID);
			ps.setString(2, title);
			ps.setDate(3, HelperUtilities.convertToSqlDate(date));
			int inserted = ps.executeUpdate();

			if (inserted > 0) {

				return true;
			}

		} catch (Exception ex) {
			System.out.println("Database error while inserting report template record" + ex);
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
	
	public static int getReportTemplateID(int departmentID, Date date, String title) {
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT * FROM REPORTTEMPLATE WHERE DepartmentID = ? AND description = ? AND createddate = ?";
			ps = connect.prepareStatement(query);
			ps.setInt(1, departmentID);
			ps.setString(2, title);
			ps.setDate(3, HelperUtilities.convertToSqlDate(date));
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt("ID");
			}
		} catch (Exception ex) {
			System.out.println("Database error while retrieving report template record" + ex);
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
		
		return 0;
	}
	
	public static List<Report> getAllReportTemplate() {
		reportTemplate = new ArrayList<Report>();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT * FROM REPORTTEMPLATE";
			ps = connect.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				reportTemplate.add(new Report(rs.getInt("ID"), rs.getString("Description")));
			}
		} catch (Exception ex) {
			System.out.println("Database error while retrieving report template record" + ex);
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
		
		return reportTemplate;
	}
	
	public static boolean insertReportTemplateSection(int ReportTemplateID, String Description) {
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "INSERT INTO Section(ReportTemplateID, Description)" + "VALUES (?, ?)";
			ps = connect.prepareStatement(query);
			ps.setInt(1, ReportTemplateID);
			ps.setString(2, Description);
			int inserted = ps.executeUpdate();

			if (inserted > 0) {

				return true;
			}

		} catch (Exception ex) {
			System.out.println("Database error while inserting report template section record" + ex);
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
	
	public static int getReportTemplateSectionID(int ReportTemplateID, String Description) {
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT * FROM Section WHERE ReportTemplateID = ? AND description = ?";
			ps = connect.prepareStatement(query);
			ps.setInt(1, ReportTemplateID);
			ps.setString(2, Description);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt("ID");
			}
		} catch (Exception ex) {
			System.out.println("Database error while retrieving report template section record" + ex);
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
		
		return 0;
	}
	
	public static void insertReportTemplateCriteria(int SectionID, String Description, int maximum) {
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "INSERT INTO criteria(SectionID, Description, Max_Value)" + "VALUES (?, ?, ?)";
			ps = connect.prepareStatement(query);
			ps.setInt(1, SectionID);
			ps.setString(2, Description);
			ps.setInt(3, maximum);
			int inserted = ps.executeUpdate();

			if (inserted > 0) {
				System.out.println("Successfully");
			}

		} catch (Exception ex) {
			System.out.println("Database error while inserting report template criteria record" + ex);
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
	}
	
	public static Department getDepartmentWithReportTemplateID(int reportTemplateID)
	{
		dp = new Department();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT R.*, D.DepartmentName FROM REPORTTEMPLATE AS R JOIN DEPARTMENTS AS D ON R.DEPARTMENTID = D.ID WHERE R.ID = ?";
			ps = connect.prepareStatement(query);
			ps.setInt(1, reportTemplateID);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				dp.setDepartmentId(rs.getInt("R.DepartmentID"));
				dp.setName(rs.getString("D.DepartmentName"));
			}
		} catch (Exception ex) {
			System.out.println("Database error while retrieving report template record" + ex);
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
		return dp;
	}

	public static List<Report> getAllReportSectionTemplate(int ReportTemplateID) {
		reportTemplate = new ArrayList<Report>();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT * FROM SECTION WHERE REPORTTEMPLATEID = ?";
			ps = connect.prepareStatement(query);
			ps.setInt(1, ReportTemplateID);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				reportTemplate.add(new Report(rs.getInt("ID"), ReportTemplateID, rs.getString("Description")));
			}
		} catch (Exception ex) {
			System.out.println("Database error while retrieving report template record" + ex);
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
		
		return reportTemplate;
	}
	
	public static List<Report> getSectionCriteria(int sectionID) {
		reportTemplate = new ArrayList<Report>();
		try {
			connect = DatabaseConnection.connectDatabase();
			query = "SELECT * FROM CRITERIA WHERE SECTIONID = ?";
			ps = connect.prepareStatement(query);
			ps.setInt(1, sectionID);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				reportTemplate.add(new Report(rs.getString("Description")));
			}
		} catch (Exception ex) {
			System.out.println("Database error while retrieving report template record" + ex);
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
		
		return reportTemplate;
	}
	
	
}
