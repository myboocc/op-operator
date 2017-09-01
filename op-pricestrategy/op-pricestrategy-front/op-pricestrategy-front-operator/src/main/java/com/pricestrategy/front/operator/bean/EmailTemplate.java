package com.pricestrategy.front.operator.bean;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * 出票邮件 管理
 * @author 
 *
 */
@Document(collection = "emailtemplate")
public class EmailTemplate {
	
	@Id
	@Indexed(unique = true)
	private String id;
	
	// 模板名称
	private String name;
	
	// 业务类型
	private String businessType;
	
	/* 创建时间*/
	private Date createTime;
	
	/* 修改时间*/
	private Date updateTime;

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

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
