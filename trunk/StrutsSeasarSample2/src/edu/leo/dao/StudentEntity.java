package edu.leo.dao;

import java.io.Serializable;
import org.seasar.dao.annotation.tiger.Bean;
import org.seasar.dao.annotation.tiger.Column;

@Bean(table = "t_student")
public class StudentEntity implements Serializable {

	//	public static final String TABLE = "t_student";

	private static final long serialVersionUID = 7074946401633356379L;

	@Column("student_id")
	//@Id(value = IdType.SEQUENCE, sequenceName = "myseq")
	private Integer studentId;

	@Column("student_name")
	private String studentName;

	@Column("student_age")
	private Integer studentAge;

	@Column("student_sex")
	private String studentSex;

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Integer getStudentAge() {
		return studentAge;
	}

	public void setStudentAge(Integer studentAge) {
		this.studentAge = studentAge;
	}

	public String getStudentSex() {
		return studentSex;
	}

	public void setStudentSex(String studentSex) {
		this.studentSex = studentSex;
	}
}
