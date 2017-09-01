package com.pricestrategy.front.operator.bean.component;

import com.pricestrategy.front.operator.utils.LogUtil;

/**
 * 奖励
 * 
 */
public class Comission{
	
	/** 代理费率 */
	private double agencyRatio;
	
	/** 奖励费率 */
	private double awardRatio;
	
	/** 单程奖励金额 */
	private double owAwardMoney;
	
	/** 往返奖励金额 */
	private double rtAwardMoney;
	
	/** 开票费 */
	private double tktFee;
	
	
	
	public Comission() {}

	public Comission(double tktFee, double agencyRatio, double awardRatio, double owAwardMoney, double rtAwardMoney,
			double expectedAfterAgentFee, double expectedAfterRewardRatio, double expectedAfterOwRewardMoney,
			double expectedAfterRtRewardMoney) {
		super();
		this.tktFee = tktFee;
		this.agencyRatio = agencyRatio;
		this.awardRatio = awardRatio;
		this.owAwardMoney = owAwardMoney;
		this.rtAwardMoney = rtAwardMoney;
	}

	public void check() {
		checkRate(agencyRatio, awardRatio);
		checkMoney(tktFee, owAwardMoney, rtAwardMoney);
	}
	
	private void checkRate(double... rates) {
		for(double rate : rates) {
			if(rate > 100 || rate < 0) {
				LogUtil.errorAndThrow("百分比数[{}]需要大于等于0，小于等于100", rate);
			}
		}
	}
	
	private void checkMoney(double... moneys) {
		for(double money : moneys) {
			if(money > 10000 || money < 0) {
				LogUtil.errorAndThrow("金额[{}]需要大于等于0，小于等于10000", money);
			}
		}
	}
	
	public double getTktFee() {
		return tktFee;
	}

	public void setTktFee(double tktFee) {
		this.tktFee = tktFee;
	}

	public double getAgencyRatio() {
		return agencyRatio;
	}

	public void setAgencyRatio(double agencyRatio) {
		this.agencyRatio = agencyRatio;
	}

	public double getAwardRatio() {
		return awardRatio;
	}

	public void setAwardRatio(double awardRatio) {
		this.awardRatio = awardRatio;
	}

	public double getOwAwardMoney() {
		return owAwardMoney;
	}

	public void setOwAwardMoney(double owAwardMoney) {
		this.owAwardMoney = owAwardMoney;
	}

	public double getRtAwardMoney() {
		return rtAwardMoney;
	}

	public void setRtAwardMoney(double rtAwardMoney) {
		this.rtAwardMoney = rtAwardMoney;
	}


	@Override
	public String toString() {
		return String
				.format("Comission [tktFee=%s, agencyRatio=%s, awardRatio=%s, owAwardMoney=%s, rtAwardMoney=%s, expectedAfterAgentFee=%s, expectedAfterRewardRatio=%s, expectedAfterOwRewardMoney=%s, expectedAfterRtRewardMoney=%s]",
						tktFee, agencyRatio, awardRatio, owAwardMoney, rtAwardMoney);
	}

}
