package edu.leo.common;

import org.seasar.framework.container.S2Container;
import org.seasar.framework.container.factory.SingletonS2ContainerFactory;
import edu.leo.service.LoginService;
import edu.leo.service.StudentService;

public class S2ContainerServiceCreater {

	private static S2ContainerServiceCreater creater = null;

	private static S2Container container = null;

	private S2ContainerServiceCreater() {
		container = SingletonS2ContainerFactory.getContainer();
	}

	public static synchronized S2ContainerServiceCreater getInstance() {
		if (creater == null) {
			creater = new S2ContainerServiceCreater();
		}
		return creater;
	}

	public LoginService getLoginService() {
		LoginService vLoginService = (LoginService) container.getComponent(LoginService.class);
		return vLoginService;
	}

	public StudentService getStudentService() {
		StudentService vStudentService = (StudentService) container.getComponent(StudentService.class);
		return vStudentService;
	}
}
