package edu.leo.action;

import java.io.File;

public class FileUploadModel extends CommonModel {

	private static final long serialVersionUID = -5341559030601021747L;

	private File[] updFile;
	private String[] updFileFileName;
	private String[] updFileContentType;

	public File[] getUpdFile() {
		return updFile;
	}

	public void setUpdFile(File[] updFile) {
		this.updFile = updFile;
	}

	public String[] getUpdFileFileName() {
		return updFileFileName;
	}

	public void setUpdFileFileName(String[] updFileFileName) {
		this.updFileFileName = updFileFileName;
	}

	public String[] getUpdFileContentType() {
		return updFileContentType;
	}

	public void setUpdFileContentType(String[] updFileContentType) {
		this.updFileContentType = updFileContentType;
	}
}
