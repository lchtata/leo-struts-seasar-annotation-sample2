package edu.leo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommonAction extends ActionSupport {

	private static final long serialVersionUID = 2539054173371975219L;

	protected HttpServletRequest getHttpServletRequest() {
		return ServletActionContext.getRequest();
	}

	protected HttpServletResponse getHttpServletResponse() {
		return ServletActionContext.getResponse();
	}

	protected HttpSession getHttpSession() {
		return ServletActionContext.getRequest().getSession();
	}
}