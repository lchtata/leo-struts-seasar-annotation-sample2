package edu.leo.action;

import java.io.File;
import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ModelDriven;

@Namespace("/")
@ParentPackage("default")
@Results({ @Result(name = "success", value = "/JSP/FileUpload.jsp"), })
public class FileUploadAction extends CommonAction implements ModelDriven<FileUploadModel> {

	private static final long serialVersionUID = -8269368111417344980L;

	FileUploadModel model = new FileUploadModel();

	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() {
		logger.debug("execute start");

		File[] vUpdFiles = model.getUpdFile();
		for (File vEachFile : vUpdFiles) {
			logger.debug("file : " + vEachFile);
		}
		String[] vFileNames = model.getUpdFileFileName();
		for (String vEachFName : vFileNames) {
			logger.debug("file name : " + vEachFName);
		}
		String[] vContentTypes = model.getUpdFileContentType();
		for (String vEachContentType : vContentTypes) {
			logger.debug("file type : " + vEachContentType);
		}

		this.addActionMessage("上传成功");

		logger.debug("execute end");
		return SUCCESS;
	}

	public FileUploadModel getModel() {
		return model;
	}
}
