package com.pricestrategy.front.operator.bean.enums;

/**
 * 反点 类型
 * 
 */
public enum RebateType {
	//取1/2值
	HALF_VALUE,
	//取最小值
	MIN_VALUE,
	//按各段实际奖励分别计入NUC值
	NUC_GROUP,
	//全程无奖励
	NO_AWARD;
}
