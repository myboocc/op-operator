package com.pricestrategy.front.operator.bean.enums;

// 出票方式
public enum ChdSingleTktType {
	SINGLE_TICKET("单开"), NO_SINGLE_TICKET("不但开");

	private String value;

	private ChdSingleTktType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static ChdSingleTktType findByValue(int value) {
		switch (value) {
		case 0:
			return SINGLE_TICKET;
		case 1:
			return NO_SINGLE_TICKET;
		default:
			return null;
		}
	}
}
