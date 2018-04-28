/*********************************************************************************
* Project: COMP3095 Java Web Application Development
* Assignment: Assignment #1
* Author(s): Hamad Ahmad
* Student Number: 101006399
* Date: 10/21/2017
* Description: This is the class that contains the details of employees.
*********************************************************************************/

package models;

import java.util.Date;

public class Employee {

	// class variable declarations
	private int employeeNumber;
	private String firstName;
	private String lastName;
	private String email;
	private Date dateHired;
	private String username;
	private String password;
	private String role;

	// default constructor
	public Employee() {

	}
	public Employee(int employeeNumber, String firstName, String lastName, String email, Date dateHired) {
		this.employeeNumber = employeeNumber;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.dateHired = dateHired;
	}
	public Employee(int employeeNumber, String firstName, String lastName) {
		this.employeeNumber = employeeNumber;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	public int getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDateHired() {
		return dateHired;
	}
	public void setYearHired(Date dateHired) {
		this.dateHired = dateHired;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	// method for checking if variables hold empty strings or are null
	public boolean CheckIfEmpty(String param1, String param2, String param3, String param4, String param5,
			String param6) {
		if (param1.isEmpty() || param1.trim().equals("")) {
			return true;
		} else if (param2.isEmpty() || param2.trim().equals("")) {
			return true;
		} else if (param3.isEmpty() || param3.trim().equals("")) {
			return true;
		} else if (param4.isEmpty() || param4.trim().equals("")) {
			return true;
		} else if (param5.isEmpty() || param5.trim().equals("")) {
			return true;
		} else if (param6.isEmpty() || param6.trim().equals("")) {
			return true;
		}

		return false;
	}

	// method for validating employee numbers
	public boolean ValidateEmployeeNumber(String employeeNumber) {
		if (!employeeNumber.matches("[0-9]+")) {
			return false;
		}
		return true;
	}
}
