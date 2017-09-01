package com.pricestrategy.front.operator.bean;

import com.pricestrategy.front.operator.bean.enums.CurrencyType;
import com.pricestrategy.front.operator.bean.enums.GdsType;
import com.pricestrategy.front.operator.bean.enums.MailType;

public class PrintTicketPcc {
	
	private String pcc;
	private GdsType gds;
	private CurrencyType currency;
	
	private MailType mailType;      //电子邮件类型  为 qmail的时候， 取qMailAddress,  为email的时候 取 emailAddress 和 emailTemplate
//	private String qMailAddress;
//	private String emailAddress;
	private String mailAddress;   // 记录输入的邮件地址
//	private EmailTemplate emailTemplate;
	
	public String getPcc() {
		return pcc;
	}
	public void setPcc(String pcc) {
		this.pcc = pcc;
	}
	public GdsType getGds() {
		return gds;
	}
	public void setGds(GdsType gds) {
		this.gds = gds;
	}
	public CurrencyType getCurrency() {
		return currency;
	}
	public void setCurrency(CurrencyType currency) {
		this.currency = currency;
	}
	public MailType getMailType() {
		return mailType;
	}
	public void setMailType(MailType mailType) {
		this.mailType = mailType;
	}
//	public String getqMailAddress() {
//		return qMailAddress;
//	}
//	public void setqMailAddress(String qMailAddress) {
//		this.qMailAddress = qMailAddress;
//	}
//	public String getEmailAddress() {
//		return emailAddress;
//	}
//	public void setEmailAddress(String emailAddress) {
//		this.emailAddress = emailAddress;
//	}
//	public EmailTemplate getEmailTemplate() {
//		return emailTemplate;
//	}
//	public void setEmailTemplate(EmailTemplate emailTemplate) {
//		this.emailTemplate = emailTemplate;
//	}
	public String getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
	

}
