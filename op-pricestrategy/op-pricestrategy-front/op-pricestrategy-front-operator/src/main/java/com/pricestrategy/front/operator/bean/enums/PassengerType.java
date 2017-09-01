package com.pricestrategy.front.operator.bean.enums;

public enum PassengerType {
	ADT("成人"),CHD("儿童"),BABY("婴儿"),STUDENT("学生"), YOUTH("青年"), IMMIGRATION("移民"), LABOR("劳务"), SAILOR("海员"), SPECIAL("特殊身份");
	private String value;

	private PassengerType(String value) {
		this.value = value;
	}
	
	public String value() {
		return value;
	}
}
