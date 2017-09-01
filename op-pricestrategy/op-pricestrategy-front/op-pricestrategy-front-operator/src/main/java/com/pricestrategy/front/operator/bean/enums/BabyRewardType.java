package com.pricestrategy.front.operator.bean.enums;

public enum BabyRewardType {
	NO_REWARD("可开无奖励");
	
	private String description;

	private BabyRewardType(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

}
