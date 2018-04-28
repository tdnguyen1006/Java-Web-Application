/***************************************************************************************************************
     PROJECT: COMP3095 WEB APPLICATION DEVELOPMENT 
     ASSIGNMENT: 1 
     GROUP NAME: INFINNOV
     DATE: 10/22/2017
     AUTHORS: ZHENG LIU 
     ID: 100970328
     DESCRIPTION: Constructs department, gets and sets its attributes
******************************************************************************************************************/
package models;

public class Department {
	//Declare class variables
	private int departmentId;
	private String name;
	private String location;
	
	//Constructors
	public Department() {
		
	}
	public Department(int departmentId, String name, String location) {
		this.departmentId = departmentId;
		this.name = name;
		this.location = location;
	}
	
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	//Getters and Mutators
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}
