package com.pricestrategy.front.operator.bean.enums;


public enum Area {
	CHINA("中国"), HONGKONG("香港"), MACAU("澳门"), TAIWAN("台湾"), SINGAPORE("新加坡");

	private String value;

	private Area(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static Area findByValue(int value) {
		switch (value) {
		case 0:
			return CHINA;
		case 1:
			return HONGKONG;
		case 2:
			return MACAU;
		case 3:
			return TAIWAN;
		case 4:
			return SINGAPORE;
		default:
			return null;
		}
	}
}
