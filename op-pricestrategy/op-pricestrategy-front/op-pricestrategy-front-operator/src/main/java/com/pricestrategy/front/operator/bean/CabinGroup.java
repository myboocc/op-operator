package com.pricestrategy.front.operator.bean;

import java.util.List;

import com.pricestrategy.front.operator.bean.component.Comission;
import com.pricestrategy.front.operator.bean.enums.FitCabinType;

/**
 * 舱位组
 * @author 
 *
 */
public class CabinGroup {
	
	//成人奖励
	private Comission adtComission;
	//儿童奖励
	private Comission chdComission;
	//婴儿奖励
	private Comission babyCommission;

	//适用舱位：
	private List<String> fitCabins;
	//适用舱位 类型
	private FitCabinType fitCabinType;
	
	public Comission getAdtComission() {
		return adtComission;
	}

	public void setAdtComission(Comission adtComission) {
		this.adtComission = adtComission;
	}

	public Comission getChdComission() {
		return chdComission;
	}

	public void setChdComission(Comission chdComission) {
		this.chdComission = chdComission;
	}

	public Comission getBabyCommission() {
		return babyCommission;
	}

	public void setBabyCommission(Comission babyCommission) {
		this.babyCommission = babyCommission;
	}


	public FitCabinType getFitCabinType() {
		return fitCabinType;
	}

	public void setFitCabinType(FitCabinType fitCabinType) {
		this.fitCabinType = fitCabinType;
	}

	public List<String> getFitCabins() {
		return fitCabins;
	}

	public void setFitCabins(List<String> fitCabins) {
		this.fitCabins = fitCabins;
	}

	
}
