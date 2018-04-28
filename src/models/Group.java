package models;

public class Group {
	private int groupID;
	private int employeeID;
	private int departmentID;
	private String groupName;
	private String employeeFirstName;
	private String employeeLastName;

	public Group() {

	}

	public Group(int departmentID, int groupID, String groupName) {
		this.groupID = groupID;
		this.groupName = groupName;
		this.departmentID = departmentID;
	}

	public Group(int departmentID, int groupID, int employeeID, String groupName, String employeeFirstName, String employeeLastName) {
		this.groupID = groupID;
		this.employeeID = employeeID;
		this.groupName = groupName;
		this.departmentID = departmentID;
		this.employeeFirstName = employeeFirstName;
		this.employeeLastName = employeeLastName;
	}

	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}

	public void setGroupID(int groupID) {
		this.groupID = groupID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	public void setEmployeeFirstName(String employeeFirstName) {
		this.employeeFirstName = employeeFirstName;
	}
	
	public void setEmployeeLastName(String employeeLastName) {
		this.employeeLastName = employeeLastName;
	}

	public int getDepartmentID() {
		return departmentID;
	}

	public int getGroupID() {
		return groupID;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public String getGroupName() {
		return groupName;
	}
	
	public String getEmployeeFirstName() {
		return employeeFirstName;
	}
	
	public String getEmployeeLastName() {
		return employeeLastName;
	}
}
