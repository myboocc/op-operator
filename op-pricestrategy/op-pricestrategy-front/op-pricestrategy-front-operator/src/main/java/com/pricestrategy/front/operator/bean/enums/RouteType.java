package com.pricestrategy.front.operator.bean.enums;

import java.util.EnumSet;

public enum RouteType {
	OW("单程"), RT("往返"), OJ("缺口"), MT("多程");
	
	private String value;
	
	public static final EnumSet<RouteType> ALL_ROUTE_TYPES = EnumSet.of(OW, RT, OJ, MT);

	private RouteType(String value) {
		this.value = value;
	}

	public String value() {
		return value;
	}
	
	public static RouteType of(String value) {
		for(RouteType routeType : ALL_ROUTE_TYPES) {
			if(routeType.value.equals(value)) {
				return routeType;
			}
		}
		return null;
	}
}
