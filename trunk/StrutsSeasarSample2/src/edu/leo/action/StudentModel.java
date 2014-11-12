package edu.leo.action;

import java.util.List;
import edu.leo.common.CommonConst;
import edu.leo.dao.StudentEntity;

public class StudentModel extends CommonModel {

	private static final long serialVersionUID = -8632969300568864980L;

	private String studentId;
	private String studentName;
	private String studentAge;
	private String studentSex;

	private CommonConst.RunModel runModel;

	//»­ÃætableÄÚÈÝList
	List<StudentEntity> dispStudents;

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentAge() {
		return studentAge;
	}

	public void setStudentAge(String studentAge) {
		this.studentAge = studentAge;
	}

	public String getStudentSex() {
		return studentSex;
	}

	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}

	public List<StudentEntity> getDispStudents() {
		return dispStudents;
	}

	public void setDispStudents(List<StudentEntity> dispStudents) {
		this.dispStudents = dispStudents;
	}

	public CommonConst.RunModel getRunModel() {
		return runModel;
	}

	public void setRunModel(CommonConst.RunModel runModel) {
		this.runModel = runModel;
	}
}
