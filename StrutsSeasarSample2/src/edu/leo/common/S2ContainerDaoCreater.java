package edu.leo.common;

import org.seasar.framework.container.S2Container;
import org.seasar.framework.container.factory.SingletonS2ContainerFactory;
import edu.leo.dao.LoginDao;
import edu.leo.dao.StudentDao;

public class S2ContainerDaoCreater {

	private static S2ContainerDaoCreater creater = null;

	private static S2Container container = null;

	private S2ContainerDaoCreater() {
		container = SingletonS2ContainerFactory.getContainer();
	}

	public static synchronized S2ContainerDaoCreater getInstance() {
		if (creater == null) {
			creater = new S2ContainerDaoCreater();
		}
		return creater;
	}

	public LoginDao getLoginDao() {
		LoginDao vLoginDao = (LoginDao) container.getComponent(LoginDao.class);
		return vLoginDao;
	}

	public StudentDao getStudentDao() {
		StudentDao vStudentDao = (StudentDao) container.getComponent(StudentDao.class);
		return vStudentDao;
	}
}
