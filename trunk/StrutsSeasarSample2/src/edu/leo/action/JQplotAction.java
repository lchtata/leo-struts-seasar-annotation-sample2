package edu.leo.action;

import java.util.LinkedHashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@ParentPackage("default")
@Results({ @Result(name = ActionSupport.SUCCESS, value = "/JSP/JQplot.jsp"), })
public class JQplotAction extends ActionSupport {
	
	private static final long serialVersionUID = -7751796933619965901L;
	private Map<String, Float> div2Info;
	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() throws Exception {
		logger.debug("execute start");
		Map<String, Float> vDiv2Info = new LinkedHashMap<String, Float>();
		vDiv2Info.put("Java", new Float(58.3F));
		vDiv2Info.put("JavaScript", new Float(76.93F));
		vDiv2Info.put("C/C++", new Float(23.333F));
		vDiv2Info.put("COBOL", new Float(10F));
		vDiv2Info.put(".net", new Float(36F));
		vDiv2Info.put("SAP", new Float(6.44F));
		this.setDiv2Info(vDiv2Info);
		logger.debug("execute end");
		return SUCCESS;
	}

	public Map<String, Float> getDiv2Info() {
		return div2Info;
	}

	public void setDiv2Info(Map<String, Float> div2Info) {
		this.div2Info = div2Info;
	}
}