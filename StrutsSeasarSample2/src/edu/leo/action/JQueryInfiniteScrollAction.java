package edu.leo.action;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;

@Namespace("/")
@ParentPackage("default")
@Results({
	@Result(name = "login", value = "/JSP/Login.jsp"),
})
public class JQueryInfiniteScrollAction extends CommonAction {

	private static final long serialVersionUID = -7952358336979689188L;

	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() throws Exception {
		logger.debug("execute start");
		//this.printOutputHTMLStream();
		logger.debug("execute end");
		return LOGIN;
	}

	protected void printOutputHTMLStream() throws UnsupportedEncodingException, IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.flushBuffer();
			out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));
			StringBuffer vHtml = new StringBuffer();
			for (int i = 1; i <= 10; i++) {
				vHtml.append("<p><span>");
				vHtml.append(i);
				vHtml.append("</span> This is the dynamic content served freshly from server</p>");
			}
			out.print(vHtml.toString());
			out.println();
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}
}
