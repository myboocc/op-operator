package com.pricestrategy.front.operator.bean.enums;

// 出票方式
public enum PrintTicketType {
	AUTO_TICKET("自动出票"), QMAIL("Q信箱"), MANUAL_TICKET("人工出票");

	private String value;

	private PrintTicketType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static PrintTicketType findByValue(int value) {
		switch (value) {
		case 0:
			return AUTO_TICKET;
		case 1:
			return QMAIL;
		case 2:
			return MANUAL_TICKET;
		default:
			return null;
		}
	}
}
