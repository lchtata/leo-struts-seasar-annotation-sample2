package edu.leo.action;

import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;

@Namespace("/")
@ParentPackage("default")
@Results({
	@Result(name = "menu", value = "/JSP/Menu.jsp"),
	@Result(name = "calendar", value = "/JSP/Calendar.jsp"),
	@Result(name = "dynamicTable", value = "/JSP/DynamicTable.jsp"),
	@Result(name = "htmlSpecialchars", value = "/JSP/HtmlSpecialchars.jsp"),
	@Result(name = "struts2TagSample", value = "/JSP/Struts2TagSample.jsp"),
	@Result(name = "jQueryAutocomplete", value = "/JSP/JQueryAutocomplete.jsp"),
	@Result(name = "jQueryProgressbar", value = "/JSP/JQueryProgressbar.jsp"),
	@Result(name = "fileUpload", value = "/JSP/FileUpload.jsp"),
	@Result(name = "jQueryInfiniteScroll", value = "/JSP/JQueryInfiniteScroll.jsp"),
})
public class MenuAction extends CommonAction {

	private static final long serialVersionUID = -7288858124144719536L;

	public String execute() {
		return "menu";
	}
	
	public String calendar(){
		return "calendar";
	}

	public String dynamicTable(){
		return "dynamicTable";
	}

	public String htmlSpecialchars(){
		return "htmlSpecialchars";
	}
	
	public String struts2TagSample(){
		return "struts2TagSample";
	}
	
	public String jQueryAutocomplete(){
		return "jQueryAutocomplete";
	}
	
	public String jQueryProgressbar(){
		return "jQueryProgressbar";
	}

	public String fileUpload(){
		return "fileUpload";
	}

	public String jQueryInfiniteScroll(){
		return "jQueryInfiniteScroll";
	}
}
