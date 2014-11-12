package edu.leo.service.impl;

import org.apache.log4j.Logger;
import org.seasar.framework.container.annotation.tiger.Binding;
import edu.leo.action.CommonModel;
import edu.leo.action.LoginModel;
import edu.leo.common.CommonConst;
import edu.leo.dao.LoginDao;
import edu.leo.dao.LoginEntity;
import edu.leo.service.LoginService;

public class LoginServiceImpl implements LoginService {

	@Binding
	private LoginDao loginDao;

	private Logger logger = Logger.getLogger(this.getClass());

	public String doService(CommonModel model) throws Exception {
		return null;
	}

	public CommonConst.LoginCheck doLogin(CommonModel model) throws Exception {
		logger.debug("doLogin start");
		CommonConst.LoginCheck vResult = CommonConst.LoginCheck.SUCCESS;
		LoginModel vModel = (LoginModel) model;
		// LoginDao loginDao = S2ContainerDaoCreater.getInstance().getLoginDao();
		LoginEntity entity = loginDao.getDataByUserIdPwd(vModel.getUserName(), vModel.getPassword());
		if (entity == null) {
			vResult = CommonConst.LoginCheck.ERROR;
		} else {
			logger.debug("  Login user id : " + entity.getUserId());
			logger.debug("  Login user pwd : " + entity.getUserPwd());
		}
		logger.debug("doLogin end");
		return vResult;
	}
}
