package edu.leo.service;

import edu.leo.action.CommonModel;
import edu.leo.common.CommonConst;

public interface LoginService extends CommonService {

	public CommonConst.LoginCheck doLogin(CommonModel model) throws Exception;

}
