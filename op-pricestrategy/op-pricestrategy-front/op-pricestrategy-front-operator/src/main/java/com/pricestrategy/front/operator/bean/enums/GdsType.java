package com.pricestrategy.front.operator.bean.enums;

import java.util.EnumSet;

public enum GdsType {
	AMADEUS("amadeus"), TRAVELSKY("travelsky"), GALILEO("galileo");

	private String value;

	private GdsType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static final EnumSet<GdsType> ALL_DOCKING_BUSINESS = EnumSet.of(AMADEUS, TRAVELSKY, GALILEO);

	public static GdsType findByValue(int value) {
		switch (value) {
		case 0:
			return AMADEUS;
		case 1:
			return TRAVELSKY;
		case 2:
			return GALILEO;
		default:
			return null;
		}
	}
}
