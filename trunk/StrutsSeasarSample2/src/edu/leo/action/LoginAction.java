package edu.leo.action;

import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ActionChainResult;
import com.opensymphony.xwork2.ModelDriven;
import edu.leo.common.CommonConst;
import edu.leo.common.S2ContainerServiceCreater;
import edu.leo.service.LoginService;

/**
 * 登录画面
 */
@Namespace("/")
@ParentPackage("default")
@Results({
	@Result(name = "login", value = "/JSP/Login.jsp"),
	@Result(name = "input", value = "/JSP/Login.jsp"),
	@Result(name = "success", value = "student", type = ActionChainResult.class, params = { "method", "init" }),
})
public class LoginAction extends CommonAction implements ModelDriven<LoginModel> {

	private static final long serialVersionUID = 1699636850099354209L;

	private LoginModel model = new LoginModel();

	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() {
		return LOGIN;
	}

	public String input() throws Exception {
		logger.debug("input start");
		LoginService loginService = S2ContainerServiceCreater.getInstance().getLoginService();
		CommonConst.LoginCheck vResult = loginService.doLogin(model);
		if (vResult == CommonConst.LoginCheck.ERROR) {
			this.addActionError("用户名或者密码不正确");
			return INPUT;
		}
		logger.debug("input end");
		// 调用StudentAction的init方法
		return SUCCESS;
	}

	public LoginModel getModel() {
		return model;
	}
}