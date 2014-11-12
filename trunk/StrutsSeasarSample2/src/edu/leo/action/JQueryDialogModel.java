package edu.leo.action;

import java.util.List;
import java.util.Map;

public class JQueryDialogModel extends CommonModel {

	private static final long serialVersionUID = 2001103344936584162L;

	private String groupType;
	private Map<String, String> departmentMap;
	private List<String> departmentIdList;
	private List<Department> departmentList;

	public String getGroupType() {
		return groupType;
	}

	public void setGroupType(String groupType) {
		this.groupType = groupType;
	}

	public Map<String, String> getDepartmentMap() {
		return departmentMap;
	}

	public void setDepartmentMap(Map<String, String> departmentMap) {
		this.departmentMap = departmentMap;
	}

	public List<String> getDepartmentIdList() {
		return departmentIdList;
	}

	public void setDepartmentIdList(List<String> departmentIdList) {
		this.departmentIdList = departmentIdList;
	}

	public List<Department> getDepartmentList() {
		return departmentList;
	}

	public void setDepartmentList(List<Department> departmentList) {
		this.departmentList = departmentList;
	}

}
