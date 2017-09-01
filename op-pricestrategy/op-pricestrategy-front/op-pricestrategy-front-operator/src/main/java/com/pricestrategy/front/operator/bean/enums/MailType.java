package com.pricestrategy.front.operator.bean.enums;

import java.util.EnumSet;

public enum MailType {
	QMAIL("qmail"), EMAIL("email");

	private String value;

	private MailType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static final EnumSet<MailType> ALL_DOCKING_BUSINESS = EnumSet.of(QMAIL, EMAIL);

	public static MailType findByValue(int value) {
		switch (value) {
		case 0:
			return QMAIL;
		case 1:
			return EMAIL;
		default:
			return null;
		}
	}
}
