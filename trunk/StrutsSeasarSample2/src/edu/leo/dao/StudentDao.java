package edu.leo.dao;

import java.util.List;
import org.seasar.dao.annotation.tiger.Arguments;
import org.seasar.dao.annotation.tiger.Query;
import org.seasar.dao.annotation.tiger.S2Dao;

@S2Dao(bean = StudentEntity.class)
public interface StudentDao {

	//	public static final Class BEAN = StudentEntity.class;

	@Arguments({ "studentId" })
	@Query("student_id = /*studentId*/")
	public StudentEntity getDataByPK(String studentId);

	@Arguments({ "studentId" })
	@Query("student_id = /*studentId*/")
	public int deleteByPK(String studentId);

	public List<StudentEntity> getAllData();

	public int insert(StudentEntity StudentEntity);

	public int update(StudentEntity StudentEntity);

	public int updateModifiedOnly(StudentEntity StudentEntity);

	public int delete(StudentEntity StudentEntity);
}
