package com.pricestrategy.front.operator.bean.enums;

public enum ChildRewardType {
	AS_ADULT("与成人同奖励"), BY_ASSIGN("指定奖励");
	
	private String description;
	
	private ChildRewardType(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
}
