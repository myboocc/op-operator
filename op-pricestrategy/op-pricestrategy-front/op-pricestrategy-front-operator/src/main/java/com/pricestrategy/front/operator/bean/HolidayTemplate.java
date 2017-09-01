package com.pricestrategy.front.operator.bean;

import java.util.Date;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;


/**
 * 假日模板 管理
 * @author 
 *
 */
@Document(collection = "holidaytemplate")
public class HolidayTemplate {
	
	@Id
	@Indexed(unique = true)
	private String id;
	
	// 模板名称
	private String name;
	
	// 星期配置
	private List<WeekendConfig> weekends;
	
	// 日期配置
	private List<DateConfig> dates;
	
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

	public List<WeekendConfig> getWeekends() {
		return weekends;
	}

	public void setWeekends(List<WeekendConfig> weekends) {
		this.weekends = weekends;
	}

	public List<DateConfig> getDates() {
		return dates;
	}

	public void setDates(List<DateConfig> dates) {
		this.dates = dates;
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
