package com.pricestrategy.front.operator.bean.enums;

import java.util.EnumSet;

public enum DockingBusiness {
	AIRLINE_BACK_UPDATE("航司后返更新"), PRICE_UPDATE("价单更新"), FINANCE_ISSUE("财务问题"), TECH_SUPPORT("技术支持"), OTHER("其他事项");

	private String value;

	private DockingBusiness(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static final EnumSet<DockingBusiness> ALL_DOCKING_BUSINESS = EnumSet.of(AIRLINE_BACK_UPDATE, PRICE_UPDATE, FINANCE_ISSUE, TECH_SUPPORT, OTHER);

	public static DockingBusiness findByValue(int value) {
		switch (value) {
		case 0:
			return AIRLINE_BACK_UPDATE;
		case 1:
			return PRICE_UPDATE;
		case 2:
			return FINANCE_ISSUE;
		case 3:
			return TECH_SUPPORT;
		case 4:
			return OTHER;
		default:
			return null;
		}
	}
}
