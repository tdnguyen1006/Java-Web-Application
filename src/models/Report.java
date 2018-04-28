package models;

import java.util.Date;

public class Report {
	
	private int DepartmentID;
	private int ReportTemplateID;
	private int SectionID;
	
	private String ReportTemplateName;
	private String ReportTitle;
	private Date ReportDate;
	
	private String ReportType;
	
	private String SectionName;
	private String criteria;
	
	public Report()
	{
		
	}
	
	public Report(int ReportTemplateID, String ReportTemplateName)
	{
		this.ReportTemplateID = ReportTemplateID;
		this.ReportTemplateName = ReportTemplateName;
	}
	
	public Report(int SectionID, int ReportTemplateID, String SectionName)
	{
		this.SectionID = SectionID;
		this.ReportTemplateID = ReportTemplateID;
		this.SectionName = SectionName;
	}
	
	public Report(String criteria)
	{
		this.criteria = criteria;
	}
	
	public void setDepartmentID(int DepartmentID)
	{
		this.DepartmentID = DepartmentID;
	}
	
	public void setReportTemplateID(int ReportTemplateID)
	{
		this.ReportTemplateID = ReportTemplateID;
	}
	
	public void setReportTemplateName(String ReportTemplateName)
	{
		this.ReportTemplateName = ReportTemplateName;
	}
	
	public void setSectionName(String SectionName)
	{
		this.SectionName = SectionName;
	}
	
	public int getDepartmentID()
	{
		return DepartmentID;
	}
	
	public int getReportTemplateID()
	{
		return ReportTemplateID;
	}
	
	public String getReportTemplateName()
	{
		return ReportTemplateName;
	}
	
	public String getSectionName()
	{
		return SectionName;
	}

	public int getSectionID() {
		return SectionID;
	}

	public void setSectionID(int sectionID) {
		SectionID = sectionID;
	}

	public String getReportTitle() {
		return ReportTitle;
	}

	public void setReportTitle(String reportTitle) {
		ReportTitle = reportTitle;
	}

	public Date getReportDate() {
		return ReportDate;
	}

	public void setReportDate(Date reportDate) {
		ReportDate = reportDate;
	}

	public String getReportType() {
		return ReportType;
	}

	public void setReportType(String reportType) {
		ReportType = reportType;
	}

	public String getCriteria() {
		return criteria;
	}

	public void setCriteria(String criteria) {
		this.criteria = criteria;
	}
	
	
	
}
