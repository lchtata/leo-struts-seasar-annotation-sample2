package edu.leo.action;

import java.io.Serializable;

public class Department implements Serializable {

	private static final long serialVersionUID = -2626515126603551310L;

	private String departmentId;
	private String departmentName;

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
}
