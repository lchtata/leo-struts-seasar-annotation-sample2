package edu.leo.action;

import java.util.LinkedHashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ModelDriven;

@Namespace("/")
@ParentPackage("default")
@Results({
	@Result(name = "success", value = "/JSP/JQueryDialog.jsp"),
	@Result(name = "popup", value = "/JSP/JQueryDialogPopup.jsp"),
	@Result(name = "input", value = "/JSP/JQueryDialog.jsp")
})
public class JQueryDialogAction extends CommonAction implements ModelDriven<JQueryDialogModel> {

	private static final long serialVersionUID = 7673450277402524995L;

	JQueryDialogModel model = new JQueryDialogModel();

	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() throws Exception {
		logger.debug("execute start");
		logger.debug("execute end");
		return SUCCESS;
	}

	public String openPopup() throws Exception {
		logger.debug("openPopup start");
		String vGroupType = model.getGroupType();
		if (StringUtils.isEmpty(vGroupType)) {
		} else {
			Map<String, String> departmentMap = new LinkedHashMap<String, String>();
			for (int i = 0; i < 10; i++) {
				departmentMap.put(vGroupType + i, "集团" + vGroupType.toUpperCase() + "-营业部" + i);
			}
			model.setDepartmentMap(departmentMap);
		}
		logger.debug("openPopup end");
		return "popup";
	}

	public String input() throws Exception {
		logger.debug("MyJQueryDialogAction#input() is run");
		logger.debug("提交的部門是[List<String>形态]");
		logger.debug(model.getDepartmentIdList());
		logger.debug("提交的部門是[List<Departmennt>形态]");
		for (Department element : model.getDepartmentList()) {
			String vMsg = "id:" + element.getDepartmentId();
			vMsg += "   name:" + element.getDepartmentName();
			logger.debug(vMsg);
		}
		return "input";
	}

	public JQueryDialogModel getModel() {
		return model;
	}
}