package edu.leo.action;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ModelDriven;

@Namespace("/")
@ParentPackage("default")
@Results({ @Result(name = "success", value = "/JSP/JQueryAjax.jsp") })
public class JQueryAjaxAction extends CommonAction implements ModelDriven<JQueryAjaxModel> {

	private static final long serialVersionUID = -8165805631166171674L;

	private JQueryAjaxModel model = new JQueryAjaxModel();

	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() throws Exception {
		logger.debug("execute start");
		logger.debug("execute end");
		return SUCCESS;
	}

	public String getAjaxJSON() throws Exception {
		logger.debug("getAjaxJSON start");
		// 打印提交数据
		logger.debug("下面是画面从AJAX提交来的数据");
		JQueryTableModel vSubmitData = model.getSubmitData();
		logger.debug("tableId:" + vSubmitData.getTableId());
		List<JQueryTRModel> vTrList = vSubmitData.getTrDataList();
		for (JQueryTRModel vTrElement : vTrList) {
			StringBuffer trMsg = new StringBuffer();
			trMsg.append("tr id:" + vTrElement.getId());
			trMsg.append("  |  student name:" + vTrElement.getName());
			trMsg.append("  |   student hobby:");
			String vHobbyDetail = "";
			List<JQueryHobbyModel> vHobbyList = vTrElement.getHobbyList();
			for (JQueryHobbyModel vHobbyElement : vHobbyList) {
				vHobbyDetail += vHobbyElement.getHobby();
				vHobbyDetail += ",";
			}
			trMsg.append(vHobbyDetail);
			logger.debug(trMsg.toString());
		}
		// 生成返回数据
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		List<Map<String, String>> hobbyList = new ArrayList<Map<String, String>>();
		Map<String, String> hobbyMap = new LinkedHashMap<String, String>();
		hobbyMap.put("hobby", "上树");
		hobbyList.add(hobbyMap);
		hobbyMap = new LinkedHashMap<String, String>();
		hobbyMap.put("hobby", "放风筝");
		hobbyList.add(hobbyMap);
		hobbyMap = new LinkedHashMap<String, String>();
		hobbyMap.put("hobby", "吃");
		hobbyList.add(hobbyMap);
		List<Map<String, Object>> trDataList = new ArrayList<Map<String, Object>>();
		Map<String, Object> trData = new LinkedHashMap<String, Object>();
		trData.put("id", "003");
		trData.put("name", "阿方");
		trData.put("hobbyList", hobbyList);
		trDataList.add(trData);
		Map<String, Object> dataMap = new LinkedHashMap<String, Object>();
		dataMap.put("tableId", "table002");
		dataMap.put("trDataList", trDataList);
		resultMap.put("returnCode", "1");
		resultMap.put("returnData", dataMap);
		// 需要JSON的jar
		this.printOutputStream(net.arnx.jsonic.JSON.encode(resultMap, true));
		logger.debug("getAjaxJSON end");
		return NONE;
	}

	protected void printOutputStream(String printString) throws UnsupportedEncodingException, IOException {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			response.setContentType("application/json;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.flushBuffer();
			out = new PrintWriter(new OutputStreamWriter(response.getOutputStream(), "UTF-8"));
			out.print(printString);
			out.println();
		} finally {
			if (out != null) {
				out.flush();
				out.close();
			}
		}
	}

	public JQueryAjaxModel getModel() {
		return model;
	}
}