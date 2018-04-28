package models;

import java.util.Date;

public class Attendance {

	private int attendanceID;
	private Date attendanceDate;
	private int attendanceStatus;

	public Attendance() {

	}

	public Attendance(Date attendanceDate, int attendanceStatus) {
		this.attendanceDate = attendanceDate;
		this.attendanceStatus = attendanceStatus;
	}
	
	public Attendance(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public Attendance(int attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

	public Attendance(int attendanceID, Date attendanceDate, int attendanceStatus) {
		this.attendanceID = attendanceID;
		this.attendanceDate = attendanceDate;
		this.attendanceStatus = attendanceStatus;
	}

	public int getAttendanceID() {
		return attendanceID;
	}

	public void setAttendanceID(int attendanceID) {
		this.attendanceID = attendanceID;
	}

	public Date getAttendanceDate() {
		return attendanceDate;
	}

	public void setAttendanceDate(Date attendanceDate) {
		this.attendanceDate = attendanceDate;
	}

	public int getAttendanceStatus() {
		return attendanceStatus;
	}

	public void setAttendanceStatus(int attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

}
