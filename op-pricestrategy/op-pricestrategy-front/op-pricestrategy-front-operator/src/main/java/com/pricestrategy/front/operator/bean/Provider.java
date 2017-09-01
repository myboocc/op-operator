package com.pricestrategy.front.operator.bean;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.pricestrategy.front.operator.bean.HolidayTemplate;
import com.pricestrategy.front.operator.bean.enums.Area;

@Document(collection = "provider")
public class Provider {
	
	@Id
	@Indexed(unique = true)
	private String id;
	
	// 供应商信息
	/* 供应商名称 */
	private String name;
	//供应商销售区域
	private Area sellArea;
	//出票率
	private String efficiency;
	//工作时区
	private String timeZone;

	// 联系人
	private List<Contact> contacts; 
	
	//供应商PCC信息
	private List<PccInfo> pccInfos;
	
	// 供应商工作时间
	//出票
	private ProviderWorkTime printTime;
	//退票
	private ProviderWorkTime refundTime;
	//改签
	private ProviderWorkTime resignTime;
	
	// 节假日模板
	private String holidayTemplateId;
	
	/* 创建时间*/
	private Date createTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Area getSellArea() {
		return sellArea;
	}

	public void setSellArea(Area sellArea) {
		this.sellArea = sellArea;
	}

	public String getEfficiency() {
		return efficiency;
	}

	public void setEfficiency(String efficiency) {
		this.efficiency = efficiency;
	}

	public String getTimeZone() {
		return timeZone;
	}

	public void setTimeZone(String timeZone) {
		this.timeZone = timeZone;
	}

	public List<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}

	public List<PccInfo> getPccInfos() {
		return pccInfos;
	}

	public void setPccInfos(List<PccInfo> pccInfos) {
		this.pccInfos = pccInfos;
	}

	public ProviderWorkTime getPrintTime() {
		return printTime;
	}

	public void setPrintTime(ProviderWorkTime printTime) {
		this.printTime = printTime;
	}

	public ProviderWorkTime getRefundTime() {
		return refundTime;
	}

	public void setRefundTime(ProviderWorkTime refundTime) {
		this.refundTime = refundTime;
	}

	public ProviderWorkTime getResignTime() {
		return resignTime;
	}

	public void setResignTime(ProviderWorkTime resignTime) {
		this.resignTime = resignTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getHolidayTemplateId() {
		return holidayTemplateId;
	}

	public void setHolidayTemplateId(String holidayTemplateId) {
		this.holidayTemplateId = holidayTemplateId;
	}
	
	
	

}
