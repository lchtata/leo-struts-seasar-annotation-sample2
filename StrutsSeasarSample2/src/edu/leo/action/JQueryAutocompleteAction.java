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

@Namespace("/")
@ParentPackage("default")
public class JQueryAutocompleteAction extends CommonAction {

	private static final long serialVersionUID = 1871130988424675671L;

	private Logger logger = Logger.getLogger(this.getClass());

	private String inputVal;
	private Integer maxRows;

	public String getAjaxJSON() throws Exception {
		logger.debug("getAjaxJSON start");
		// 生成返回数据
		String[] vSource = { "ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang", "Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" };
		logger.debug("画面传来的参数[inputVal]" + inputVal + "    [maxRows]" + maxRows.toString());
		List<Map<String, String>> resultList = new ArrayList<Map<String, String>>();
		int vIndex = 1;
		for (String element : vSource) {
			Map<String, String> record = new LinkedHashMap<String, String>();
			record.put("rst_id", String.valueOf(vIndex));
			record.put("rst_name", element);
			vIndex++;
			resultList.add(record);
		}
		// 需要JSON的jar
		this.printOutputStream(net.arnx.jsonic.JSON.encode(resultList, true));
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

	public String getInputVal() {
		return inputVal;
	}

	public void setInputVal(String inputVal) {
		this.inputVal = inputVal;
	}

	public Integer getMaxRows() {
		return maxRows;
	}

	public void setMaxRows(Integer maxRows) {
		this.maxRows = maxRows;
	}
}
