package com.pricestrategy.front.operator.bean;

import com.pricestrategy.front.operator.bean.enums.DockingBusiness;

/**
 * 
 *	联系人
 */
public class Contact {
	
	// 对接业务
	private DockingBusiness dockingBusiness;
	private String chineseName;
	private String englishName;
	private String email;
	private String qq;
	private String telephone;
	
	public DockingBusiness getDockingBusiness() {
		return dockingBusiness;
	}
	public void setDockingBusiness(DockingBusiness dockingBusiness) {
		this.dockingBusiness = dockingBusiness;
	}
	public String getChineseName() {
		return chineseName;
	}
	public void setChineseName(String chineseName) {
		this.chineseName = chineseName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
}
