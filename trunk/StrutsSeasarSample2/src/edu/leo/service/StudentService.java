package edu.leo.service;

import java.util.List;
import edu.leo.action.CommonModel;
import edu.leo.dao.StudentEntity;

public interface StudentService extends CommonService {

	public List<StudentEntity> searchStudent(CommonModel model) throws Exception;

	public StudentEntity searchStudentByPK(String pStudentID) throws Exception;

	public int addStudent(CommonModel model) throws Exception;

	public int deleteStudent(String pStudentID) throws Exception;

	public int updateStudent(CommonModel model) throws Exception;
}
