package com.pricestrategy.front.operator.bean.enums;

import java.util.EnumSet;

public enum Day {
	MON("周一"), TUE("周二"), WED("周三"), THU("周四"), FRI("周五"), SAT("周六"), SUN("周日"), HOLIDAY("法定节假日");

	private String value;

	private Day(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static final EnumSet<Day> ALLDAYS = EnumSet.of(MON, TUE, WED, THU, FRI, SAT, SUN, HOLIDAY);
	public static final EnumSet<Day> ALL_WEEK_DAYS = EnumSet.of(MON, TUE, WED, THU, FRI, SAT, SUN);

	public static Day findByValue(int value) {
		switch (value) {
		case 0:
			return MON;
		case 1:
			return TUE;
		case 2:
			return WED;
		case 3:
			return THU;
		case 4:
			return FRI;
		case 5:
			return SAT;
		case 6:
			return SUN;
		case 7:
			return HOLIDAY;
		default:
			return null;
		}
	}
}
