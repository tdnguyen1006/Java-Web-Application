package models;

public class JobPosition {
	private int id;
	private String position;
	private String description;

	public JobPosition() {

	}

	public JobPosition(String position) {
		this.position = position;
	}

	public JobPosition(int id, String position, String description) {
		this.id = id;
		this.position = position;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
