package com.pricestrategy.front.operator.bean.enums;


public enum CurrencyType {
	HKD("港币"), CNY("人民币"), USD("美元");

	private String value;

	private CurrencyType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static CurrencyType findByValue(int value) {
		switch (value) {
		case 0:
			return HKD;
		case 1:
			return CNY;
		case 2:
			return USD;
		default:
			return null;
		}
	}
}
