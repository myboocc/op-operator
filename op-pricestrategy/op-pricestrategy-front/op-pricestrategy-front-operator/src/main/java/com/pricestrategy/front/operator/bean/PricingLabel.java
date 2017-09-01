package com.pricestrategy.front.operator.bean;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "pricingLabel")
public class PricingLabel {
	
	@Id
	@Indexed(unique = true)
	private String id;
	
	//标签名称
	private String title;
	
	//关联政策
	private List<String> pricingKeys;
	
	//备注
	private String remark;
	
	//修改时间
	private Date updateTime;
	
	//操作员
	private String operatorKey;
	
	//操作员
	private String operatorName;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<String> getPricingKeys() {
		return pricingKeys;
	}

	public void setPricingKeys(List<String> pricingKeys) {
		this.pricingKeys = pricingKeys;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getOperatorKey() {
		return operatorKey;
	}

	public void setOperatorKey(String operatorKey) {
		this.operatorKey = operatorKey;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

}
