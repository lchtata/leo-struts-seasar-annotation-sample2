package edu.leo.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.util.ByteArrayDataSource;

public class MailSender {

	protected String charset = "ms932";

	protected boolean debug = true;

	protected String contentType = "text/plain";

	protected String contentTransferEncoding = "7bit";

	private MimeMessage msg = null;

	private Multipart mp = null;

	@SuppressWarnings("unused")
	private MailSender() throws Exception {
		throw new Exception("please use JavaMailTest(Map<String, String> pMap)");
	}

	public MailSender(Map<String, String> pMap, boolean isHaveAttachmentFile) throws UnsupportedEncodingException, MessagingException {
		this.init(pMap, isHaveAttachmentFile);
	}

	private void init(Map<String, String> pMap, boolean isHaveAttachmentFile) throws MessagingException, UnsupportedEncodingException {
		// mail server setting
		String smtpHost = (String) pMap.get("mail.smtp.host");
		String smtpPort = (String) pMap.get("mail.smtp.port");
//		String mailHost = (String) pMap.get("mail.host");
//		String mailFrom = (String) pMap.get("mail.from");
		String mailUserId = (String) pMap.get("user.id");
		String mailUserPwd = (String) pMap.get("user.pwd");
		Properties props = new Properties();
		// smtp server
		props.setProperty("mail.smtp.host", smtpHost);
		// port setting
		if (smtpPort != null && !smtpPort.equals("")) {
			props.setProperty("mail.smtp.port", smtpPort);
		}
		props.setProperty("mail.smtp.auth", "true");
		// recive server
//		props.setProperty("mail.host", mailHost);
//		props.setProperty("mail.from", mailFrom);
		// debug mode
		props.setProperty("mail.debug", Boolean.toString(debug));
		Session session = Session.getInstance(props, new HttpAuthenticator(mailUserId, mailUserPwd));
		msg = new MimeMessage(session);
		if (isHaveAttachmentFile) {
			// have attachment file ---> multipart/mixed type
			// multipart/mixed
			mp = new MimeMultipart();
		} else {
			// no attachment file ---> multipart/alternative type
			// multipart/alternative
			mp = new MimeMultipart("alternative");
		}
		// cc set
		//msg.setRecipients(Message.RecipientType.CC, ccAddrArray);
		// bcc set
		//msg.setRecipients(Message.RecipientType.BCC, bccAddrArray);
	}

	public void setFromAddress(String fromAddress, String fromPersonal) throws AddressException, UnsupportedEncodingException, MessagingException {
		InternetAddress fromAddr = null;
		if (fromPersonal == null || fromPersonal.equals("")) {
			fromAddr = new InternetAddress(fromAddress);
		} else {
			fromAddr = new InternetAddress(fromAddress, fromPersonal, charset);
		}
		msg.setFrom(fromAddr);
	}

	public void setToAddress(String[] toAddress, String toPersonal[]) throws AddressException, UnsupportedEncodingException, MessagingException {
		InternetAddress[] toAddrArray = new InternetAddress[toAddress.length];
		for (int i = 0; i < toAddress.length; i++) {
			String strToAddr = toAddress[i];
			String strToPersonal = null;
			if (toPersonal != null && toPersonal.length > 0) {
				strToPersonal = toPersonal[i];
			}
			if (strToPersonal == null || strToPersonal.equals("")) {
				toAddrArray[i] = new InternetAddress(strToAddr);
			} else {
				toAddrArray[i] = new InternetAddress(strToAddr, strToPersonal, charset);
			}
		}
		msg.setRecipients(Message.RecipientType.TO, toAddrArray);
	}

	public void setCcAddress(String[] ccAddress, String ccPersonal[]) throws AddressException, UnsupportedEncodingException, MessagingException {
		InternetAddress[] ccAddrArray = new InternetAddress[ccAddress.length];
		for (int i = 0; i < ccAddress.length; i++) {
			String strCcAddr = ccAddress[i];
			ccAddrArray[i] = new InternetAddress(strCcAddr);
			// ccAddrArray[i] = new InternetAddress(strCcAddr, strCcPersonal, charset);
		}
		msg.setRecipients(Message.RecipientType.CC, ccAddrArray);
	}

	public void setBccAddress(String[] bccAddress, String bccPersonal[]) throws AddressException, UnsupportedEncodingException, MessagingException {
		InternetAddress[] bccAddrArray = new InternetAddress[bccAddress.length];
		for (int i = 0; i < bccAddress.length; i++) {
			String strBccAddr = bccAddress[i];
			bccAddrArray[i] = new InternetAddress(strBccAddr);
			//bccAddrArray[i] = new InternetAddress(strBccAddr, strBccPersonal, charset);
		}
		msg.setRecipients(Message.RecipientType.BCC, bccAddrArray);
	}

	public void setSubject(String subject) throws MessagingException {
		msg.setSubject(subject, charset);
	}

	public void setText(String text) throws MessagingException {
		MimeBodyPart mbp = new MimeBodyPart();
		String mimeType = contentType + "; charset=" + charset;
		mbp.setContent(text, mimeType);
		mp.addBodyPart(mbp);
	}

	public void setAttachmentFile(String path, String fileName) throws MessagingException, IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		MimeBodyPart mbp = new MimeBodyPart();
		ByteArrayDataSource bads = new ByteArrayDataSource(fis, "application/octet-stream");
		mbp.setDataHandler(new DataHandler(bads));
		mbp.setFileName(MimeUtility.encodeText(fileName, charset, "B"));
		mp.addBodyPart(mbp);
	}

	public void setAttachmentFile(DataSource attchFileDataSrc, String fileName) throws MessagingException, UnsupportedEncodingException {
		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setDataHandler(new DataHandler(attchFileDataSrc));
		mbp.setFileName(MimeUtility.encodeText(fileName, charset, null));
		mp.addBodyPart(mbp);
	}

	public void send() throws MessagingException {
		msg.setHeader("Content-Type", contentType);
		msg.setHeader("Content-Transfer-Encoding", contentTransferEncoding);
		if (mp.getCount() != 0) {
			msg.setContent(mp);
		}
		msg.setSentDate(new Date());
		Transport.send(msg);
	}

	public class HttpAuthenticator extends Authenticator {
		private String username;
		private String password;

		public HttpAuthenticator(String username, String password) {
			this.username = username;
			this.password = password;
		}

		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password);
		}
	}
}
