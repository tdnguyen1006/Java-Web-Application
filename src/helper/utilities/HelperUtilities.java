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
     DESCRIPTION: Helper methods, and validators 
******************************************************************************************************************/
package helper.utilities;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelperUtilities {

	
	public static boolean isValidPostalCode(String postalCode){
		String regexPostalCode = "[A-Za-z][0-9][A-Za-z] [0-9][A-Za-z][0-9]";
		
		if (postalCode.matches(regexPostalCode)) {
			return true;
		} 
		return false;
	}
	
	public static boolean isValidEmail(String email){
		String regexEmail = "([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$";
		
		if (email.matches(regexEmail)) {
			return true;
		} 
		return false;
	}
	
	public static boolean isValidPhone(String phone){
		String regexPhone = "\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}";
		
		if (phone.matches(regexPhone)) {
			return true;
		} 
		return false;
	}
	
	public static boolean isEmptyOrNull(String param){
		if(param == null || param.trim().equals("")){
			return true;
		}
		return false;
	}
	
	public static boolean isAlphabet(String data) {

        if (data.matches("\\d+(?:\\.\\d+)?")) {
            return false;
        }

        return true;
    }
	
	public static boolean isChosen(int i){
		if(i == 0){
			return false;
		}
		return true;
	}
	
	public static boolean isDuplicate(ArrayList<Integer> arr)
	{
		boolean isDuplicate = false;
		for(int i = 0; i < arr.size(); i++)
		{
			for(int j = i + 1; j < arr.size(); j++)
			{
				if((arr.get(i)).equals(arr.get(j)))
				{
					isDuplicate = true;
					break;
				}
			}
		}
		return isDuplicate;
	}
	
	public static String filter(String input) {
        if (!hasSpecialChars(input)) {
            return (input);
        }
        StringBuilder sb = new StringBuilder(input.length());
        char c;

        for (int i = 0; i < input.length(); i++) {
            c = input.charAt(i);
            switch (c) {
                case '<':
                    sb.append("&lt;");
                    break;
                case '>':
                    sb.append("&gt;");
                    break;
                case '"':
                    sb.append("&quot;");
                    break;
                case '\'':
                    sb.append("&apos;");
                    break;
                case '&':
                    sb.append("&amp;");
                    break;
                default:
                    sb.append(c);
            }
        }
        return sb.toString();

    }

    private static boolean hasSpecialChars(String input) {

        Pattern regexSpecialChars = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
        Matcher inputStr = regexSpecialChars.matcher(input);
        boolean hasSpecialChars = inputStr.find();

        if (!hasSpecialChars) {
            return false;
        }

        return true;
    }
    
    public static Date convertStringToDate(String date){
    	Date formatedDate = null;
    	 try {
    		 formatedDate = new SimpleDateFormat("dd/MM/yyyy").parse(date);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
    	 return formatedDate;
    }
    public static java.sql.Date convertToSqlDate(Date utilDate){
        return  new java.sql.Date(utilDate.getTime());
    }
    
    public static boolean cookieExists(HttpServletRequest request, String cookieName) { 
		Cookie[] cookies = request.getCookies(); 

		if(cookies != null){
			for (Cookie c : cookies) {			
				if (cookieName.equals(c.getName())) {
					return true;
				}
			}
		}
		
		return false;
	}
    public static void setCookie(HttpServletResponse response, String cookieName, String cookieValue){
    	Cookie c = new Cookie(cookieName, cookieValue);
	    c.setMaxAge(60*60*24*360);
	    response.addCookie(c);
    }
    
    public static String getCookieValue(HttpServletRequest request, String cookieName) {  
		Cookie[] cookies = request.getCookies(); 
        String cookie = "";
		if(cookies != null){
			for (Cookie c : cookies) {			
				if (cookieName.equals(c.getName())) {
					cookie = c.getValue();
				}
			}
		}
		
		return cookie;
	}
    
    public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String cookieName) { 
 		Cookie[] cookies = request.getCookies(); 
 		Cookie cookie = null;
 		if(cookies != null){
 			for (Cookie c : cookies) {			
 				if (cookieName.equals(c.getName())) {
 					cookie = c;
 					cookie.setMaxAge(0);
 					response.addCookie(cookie);
 				}
 			}
 		}
 	}
}
