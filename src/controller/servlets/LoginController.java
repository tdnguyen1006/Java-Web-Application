package controller.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helper.utilities.HelperUtilities;
import models.Employee;
import service.utilities.LoginService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		synchronized (session) {

			String userInfo = (String) session.getAttribute("userInfo");
			String error = "";
			String rd = "";

			if (userInfo == null) {
				userInfo = new String();
			}
			// retrieves user information from form
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String rememberMe = request.getParameter("rememberMe");

			Employee employee = new Employee(); // instantiates employee object
			 
			// sets employee username and password for authentication
			employee.setUsername(username);
			employee.setPassword(password);

			// validates user input
			if (!LoginService.isValidUserInput(employee)) {

				error = "Please enter username and password";
				request.setAttribute("loginError", error);
                 
				rd = "login.jsp";

			} else {

				// authenticates user login

				if (LoginService.isValidUser(employee)) {
					
					if(!HelperUtilities.isEmptyOrNull(rememberMe)){
						HelperUtilities.setCookie(response, "username", employee.getFirstName());
						HelperUtilities.setCookie(response, "role", employee.getRole());
					}
					
					if(HelperUtilities.cookieExists(request, "username")){
						session.setAttribute("userInfo", HelperUtilities.getCookieValue(request, "username"));
						session.setAttribute("role", HelperUtilities.getCookieValue(request, "role"));
					}else{
						session.setAttribute("userInfo", employee.getFirstName());
						session.setAttribute("role", employee.getRole()); 
					}
					rd = "index.jsp";

				} else {
					
					error = "Incorrect username or password";
					request.setAttribute("loginError", error);

					rd = "login.jsp";
				}
			}
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
		
	}

}
