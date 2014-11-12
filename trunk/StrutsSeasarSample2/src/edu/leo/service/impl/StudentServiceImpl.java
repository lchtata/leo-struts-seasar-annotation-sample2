package edu.leo.service.impl;

import java.util.List;
import org.apache.log4j.Logger;
import org.seasar.framework.container.annotation.tiger.Binding;
import edu.leo.action.CommonModel;
import edu.leo.action.StudentModel;
import edu.leo.dao.StudentDao;
import edu.leo.dao.StudentEntity;
import edu.leo.service.StudentService;

public class StudentServiceImpl implements StudentService {

	private Logger logger = Logger.getLogger(this.getClass());
	
	@Binding
	private StudentDao studentDao;

	public String doService(CommonModel model) throws Exception {
		return null;
	}

	public List<StudentEntity> searchStudent(CommonModel model) throws Exception {
		logger.debug("searchStudent start");
		List<StudentEntity> vEntitys = studentDao.getAllData();
		logger.debug("searchStudent end");
		return vEntitys;
	}

	public StudentEntity searchStudentByPK(String pStudentID) throws Exception {
		logger.debug("searchStudentByPK start");
		StudentEntity vEntity = studentDao.getDataByPK(pStudentID);
		logger.debug("searchStudentByPK end");
		return vEntity;
	}

	public int addStudent(CommonModel model) throws Exception {
		logger.debug("addStudent start");
		StudentModel vModel = (StudentModel) model;
		StudentEntity vInsertEntity = new StudentEntity();
		vInsertEntity.setStudentId(null);
		vInsertEntity.setStudentName(vModel.getStudentName());
		vInsertEntity.setStudentAge(new Integer(vModel.getStudentAge()));
		vInsertEntity.setStudentSex(vModel.getStudentSex());
		//  ¬ŒÒ≤‚ ‘”√
		//		String vBug = null;
		//		vBug.split(",");
		int vResult = studentDao.insert(vInsertEntity);
		logger.debug("addStudent end");
		return vResult;
	}

	public int deleteStudent(String pStudentID) throws Exception {
		logger.debug("deleteStudent start");
		int vResult = studentDao.deleteByPK(pStudentID);
		logger.debug("deleteStudent end");
		return vResult;
	}

	public int updateStudent(CommonModel model) throws Exception {
		logger.debug("updateStudent start");
		StudentModel vModel = (StudentModel) model;
		StudentEntity vUpdateEntity = new StudentEntity();
		vUpdateEntity.setStudentId(new Integer(vModel.getStudentId()));
		vUpdateEntity.setStudentName(vModel.getStudentName());
		vUpdateEntity.setStudentAge(new Integer(vModel.getStudentAge()));
		vUpdateEntity.setStudentSex(vModel.getStudentSex());
		int vResult = studentDao.update(vUpdateEntity);
		logger.debug("updateStudent end");
		return vResult;
	}
}
