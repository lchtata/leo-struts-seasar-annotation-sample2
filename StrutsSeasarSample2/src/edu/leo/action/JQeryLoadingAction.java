package edu.leo.action;

import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@ParentPackage("default")
@Results({ @Result(name = ActionSupport.SUCCESS, value = "/JSP/JQeryLoading.jsp"), })
public class JQeryLoadingAction extends ActionSupport {

	private static final long serialVersionUID = 4277391822187422952L;
	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() throws Exception {
		logger.debug("execute start");
		logger.debug("execute end");
		return SUCCESS;
	}

	public String goTo() throws Exception {
		logger.debug("goTo start");
		logger.debug("goTo end");
		return SUCCESS;
	}
}