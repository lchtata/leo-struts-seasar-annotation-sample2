package edu.leo.action;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import org.apache.log4j.Logger;
import org.apache.struts2.config.Namespace;
import org.apache.struts2.config.ParentPackage;
import org.apache.struts2.config.Result;
import org.apache.struts2.config.Results;
import com.opensymphony.xwork2.ModelDriven;
import edu.leo.common.MailSender;

@Namespace("/")
@ParentPackage("default")
@Results({ @Result(name = "success", value = "/JSP/JavaMail.jsp"), })
public class SendMailAction extends CommonAction implements ModelDriven<SendMailModel> {

	private static final long serialVersionUID = -2860556040815632800L;

	SendMailModel model = new SendMailModel();

	private Logger logger = Logger.getLogger(this.getClass());

	public String execute() {

		// ҳ���ʼ��
		model.setMailSmtpHost("smtp.gmail.com");
		model.setMailSmtpPort("465");
		model.setMailHost("pop.gmail.com");
		model.setUserId("lchtata@gmail.com");

		model.setFromAddress("lchtata@gmail.com");
		model.setFromAddressName("����");

		return SUCCESS;
	}

	public String send() {

		logger.debug("mail send start...................................");
		// server setting
		Map<String, String> mailsetting = new LinkedHashMap<String, String>();
		mailsetting.put("mail.smtp.host", model.getMailSmtpHost());
		mailsetting.put("mail.smtp.port", model.getMailSmtpPort());
		mailsetting.put("mail.host", model.getMailHost());
		mailsetting.put("mail.from", model.getFromAddress());
		mailsetting.put("user.id", model.getUserId());
		mailsetting.put("user.pwd", model.getUserPwd());
		// is have attachment file flag
		boolean isHaveAttachmentFile = true;
		if (model.getAttachmentFile() == null || model.getAttachmentFile().length == 0) {
			isHaveAttachmentFile = false;
		}
		try {
			// Collections.unmodifiableMap(map)
			// ����һ��map��view�����Ҵ�view�ǲ����޸ĵ�
			// ������[vParamMap]���������Ժ�,���������ǲ��ɸ��ĵ�
			// ͬ����List��Set���Ќ���ķ���
			// Collections.unmodifiableList(list);
			// Collections.unmodifiableSet(set)
			Map<String, String> vParamMap = Collections.unmodifiableMap(mailsetting);

			MailSender vMail = new MailSender(vParamMap, isHaveAttachmentFile);
			vMail.setSubject(model.getSubject());
			vMail.setText(model.getMailContext());
			String vFromAddress = model.getFromAddress();
			String vFromAddressName = model.getFromAddressName();
			vMail.setFromAddress(vFromAddress, vFromAddressName);
			String[] vToAddress = { model.getToAddress() };
			String[] vToAddressName = { model.getToAddressName() };
			vMail.setToAddress(vToAddress, vToAddressName);
			if (isHaveAttachmentFile) {
				// ��Ϊ����,ֻ����һ������
				vMail.setAttachmentFile(model.getAttachmentFile()[0].getPath(), model.getAttachmentFileFileName()[0]);
			}
			vMail.send();
			this.addActionMessage("���ͳɹ�");
			logger.debug("mail send scuess :) ...................................");
		} catch (Exception e) {
			e.printStackTrace();
			this.addActionError("����ʧ��" + e.getMessage());
			logger.error("mail send failed :( ...................................");
		}

		return SUCCESS;
	}

	public SendMailModel getModel() {
		return model;
	}
}
