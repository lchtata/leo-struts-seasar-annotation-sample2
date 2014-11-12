package edu.leo.action;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;

@Namespace("/")
@ParentPackage("default")
public class JQueryProgressbarAction extends CommonAction {

	private static final long serialVersionUID = 3923862476135986729L;

	private Logger logger = Logger.getLogger(this.getClass());

	private final static String ALL_DATA_CNT = "ALL_DATA_CNT";
	private final static String PROCESSING_DATA_CNT = "PROCESSING_DATA_CNT";

	public String getAjaxJSON() throws Exception {
		logger.debug("getAjaxJSON start");
		// 操作Session里面的百分率
		Object vProcessingDataCnt = ServletActionContext.getRequest().getSession().getAttribute(PROCESSING_DATA_CNT);
		int vAllDataCnt = 0;
		int vProDataCnt = 0;
		if (vProcessingDataCnt == null) {
			ServletActionContext.getRequest().getSession().setAttribute(ALL_DATA_CNT, new Integer(100));
			ServletActionContext.getRequest().getSession().setAttribute(PROCESSING_DATA_CNT, new Integer(0));
		} else {
			vAllDataCnt = ((Integer) ServletActionContext.getRequest().getSession().getAttribute(ALL_DATA_CNT)).intValue();
			vProDataCnt = ((Integer) vProcessingDataCnt).intValue() + 5;
			if (vProDataCnt > vAllDataCnt) {
				vProDataCnt = 0;
			}
			ServletActionContext.getRequest().getSession().setAttribute(PROCESSING_DATA_CNT, new Integer(vProDataCnt));
		}

		// 生成返回数据
		Map<String, String> vResultMap = new LinkedHashMap<String, String>();
		vResultMap.put(ALL_DATA_CNT, String.valueOf(vAllDataCnt));
		vResultMap.put(PROCESSING_DATA_CNT, String.valueOf(vProDataCnt));

		// 需要JSON的jar
		this.printOutputStream(net.arnx.jsonic.JSON.encode(vResultMap, true));

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
}
