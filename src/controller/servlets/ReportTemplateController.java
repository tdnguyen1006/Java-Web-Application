package controller.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import helper.utilities.HelperUtilities;
import service.utilities.ReportService;

/**
 * Servlet implementation class ReportTemplateController
 */
@WebServlet("/ReportTemplateController")
public class ReportTemplateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportTemplateController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);

		String url = "jdbc:mysql://localhost:3306/COMP3095";
		String username = "admin";
		String password = "admin";

		int department = Integer.parseInt(request.getParameter("department"));
		int maximum1 = Integer.parseInt(request.getParameter("maximum1"));
		int maximum2 = Integer.parseInt(request.getParameter("maximum2"));
		int maximum3 = Integer.parseInt(request.getParameter("maximum3"));
		int maximum4 = Integer.parseInt(request.getParameter("maximum4"));
		int maximum5 = Integer.parseInt(request.getParameter("maximum5"));
		int maximum6 = Integer.parseInt(request.getParameter("maximum6"));
		int maximum7 = Integer.parseInt(request.getParameter("maximum7"));
		int maximum8 = Integer.parseInt(request.getParameter("maximum8"));
		int maximum10 = Integer.parseInt(request.getParameter("maximum10"));
		int maximum11 = Integer.parseInt(request.getParameter("maximum11"));
		int maximum12 = Integer.parseInt(request.getParameter("maximum12"));

		String title = request.getParameter("reportTemplate");

		String section1 = request.getParameter("section1");
		String section2 = request.getParameter("section2");
		String section3 = request.getParameter("section3");

		String criteria1 = request.getParameter("criteria1");
		String criteria2 = request.getParameter("criteria2");
		String criteria3 = request.getParameter("criteria3");
		String criteria4 = request.getParameter("criteria4");
		String criteria5 = request.getParameter("criteria5");
		String criteria6 = request.getParameter("criteria6");
		String criteria7 = request.getParameter("criteria7");
		String criteria8 = request.getParameter("criteria8");
		String criteria10 = request.getParameter("criteria10");
		String criteria11 = request.getParameter("criteria11");
		String criteria12 = request.getParameter("criteria12");

		String date = request.getParameter("date");

		if (HelperUtilities.isEmptyOrNull(title) || HelperUtilities.isEmptyOrNull(date)
				|| !HelperUtilities.isChosen(department) || HelperUtilities.isEmptyOrNull(section1)
				|| HelperUtilities.isEmptyOrNull(section2) || HelperUtilities.isEmptyOrNull(section3)) {
			messages.put("general", "Section, Report Template, Date and Department Fields are mandatory");
		} else {
			boolean successfull = false;
			successfull = ReportService.insertReportTemplate(department, HelperUtilities.convertStringToDate(date), title);
			if(successfull)
			{
				int reportTemplateID = ReportService.getReportTemplateID(department, HelperUtilities.convertStringToDate(date), title);
				successfull = ReportService.insertReportTemplateSection(reportTemplateID, section1);
				if(successfull)
				{
					int sectionID = ReportService.getReportTemplateSectionID(reportTemplateID, section1);
					ReportService.insertReportTemplateCriteria(sectionID, criteria1, maximum1);
					ReportService.insertReportTemplateCriteria(sectionID, criteria2, maximum2);
					ReportService.insertReportTemplateCriteria(sectionID, criteria3, maximum3);
					ReportService.insertReportTemplateCriteria(sectionID, criteria4, maximum4);
					ReportService.insertReportTemplateCriteria(sectionID, criteria5, maximum5);
				}
				else
				{
					messages.put("error", "Unable to Insert Report Section");
				}
				
				successfull = ReportService.insertReportTemplateSection(reportTemplateID, section2);
				if(successfull)
				{
					int sectionID = ReportService.getReportTemplateSectionID(reportTemplateID, section2);
					ReportService.insertReportTemplateCriteria(sectionID, criteria6, maximum6);
					ReportService.insertReportTemplateCriteria(sectionID, criteria7, maximum7);
					ReportService.insertReportTemplateCriteria(sectionID, criteria8, maximum8);
				}
				else
				{
					messages.put("error", "Unable to Insert Report Section");
				}
				
				successfull = ReportService.insertReportTemplateSection(reportTemplateID, section3);
				if(successfull)
				{
					int sectionID = ReportService.getReportTemplateSectionID(reportTemplateID, section3);
					ReportService.insertReportTemplateCriteria(sectionID, criteria10, maximum10);
					ReportService.insertReportTemplateCriteria(sectionID, criteria11, maximum11);
					ReportService.insertReportTemplateCriteria(sectionID, criteria12, maximum12);
				}
				else
				{
					messages.put("error", "Unable to Insert Report Section");
				}
			}
			else
			{
				messages.put("error", "Unable to enter Report Template");
			}
		}

		request.getRequestDispatcher("manage/reportTemplate.jsp").forward(request, response);
	}

}
