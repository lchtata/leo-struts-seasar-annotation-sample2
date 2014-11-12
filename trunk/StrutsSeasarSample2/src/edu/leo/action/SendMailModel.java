package edu.leo.action;

import java.io.File;

public class SendMailModel extends CommonModel {

	private static final long serialVersionUID = -5341559030601021747L;

	private String mailSmtpHost;
	private String mailSmtpPort;
	private String mailHost;
	private String userId;
	private String userPwd;
	private String subject;
	private String mailContext;
	private String fromAddressName;
	private String fromAddress;
	private String toAddressName;
	private String toAddress;
	private File[] attachmentFile;
	private String[] attachmentFileFileName;
	private String[] attachmentFileContentType;

	public String getMailSmtpHost() {
		return mailSmtpHost;
	}

	public void setMailSmtpHost(String mailSmtpHost) {
		this.mailSmtpHost = mailSmtpHost;
	}

	public String getMailSmtpPort() {
		return mailSmtpPort;
	}

	public void setMailSmtpPort(String mailSmtpPort) {
		this.mailSmtpPort = mailSmtpPort;
	}

	public String getMailHost() {
		return mailHost;
	}

	public void setMailHost(String mailHost) {
		this.mailHost = mailHost;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMailContext() {
		return mailContext;
	}

	public void setMailContext(String mailContext) {
		this.mailContext = mailContext;
	}

	public String getFromAddressName() {
		return fromAddressName;
	}

	public void setFromAddressName(String fromAddressName) {
		this.fromAddressName = fromAddressName;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getToAddressName() {
		return toAddressName;
	}

	public void setToAddressName(String toAddressName) {
		this.toAddressName = toAddressName;
	}

	public String getToAddress() {
		return toAddress;
	}

	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}

	public File[] getAttachmentFile() {
		return attachmentFile;
	}

	public void setAttachmentFile(File[] attachmentFile) {
		this.attachmentFile = attachmentFile;
	}

	public String[] getAttachmentFileFileName() {
		return attachmentFileFileName;
	}

	public void setAttachmentFileFileName(String[] attachmentFileFileName) {
		this.attachmentFileFileName = attachmentFileFileName;
	}

	public String[] getAttachmentFileContentType() {
		return attachmentFileContentType;
	}

	public void setAttachmentFileContentType(String[] attachmentFileContentType) {
		this.attachmentFileContentType = attachmentFileContentType;
	}
}
