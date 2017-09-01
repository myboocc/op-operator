package com.pricestrategy.front.operator.bean;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

import com.pricestrategy.front.operator.bean.enums.BabyRewardType;
import com.pricestrategy.front.operator.bean.enums.ChdSingleTktType;
import com.pricestrategy.front.operator.bean.enums.ChildRewardType;
import com.pricestrategy.front.operator.bean.enums.FareType;
import com.pricestrategy.front.operator.bean.enums.GdsType;
import com.pricestrategy.front.operator.bean.enums.PassengerType;
import com.pricestrategy.front.operator.bean.enums.PrintTicketType;
import com.pricestrategy.front.operator.bean.enums.RebateType;
import com.pricestrategy.front.operator.bean.enums.RefundType;
import com.pricestrategy.front.operator.bean.enums.TicketType;

/**
 * 政策信息
 * @author 
 *
 */
@Document(collection = "pricing")
public class Pricing implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Indexed(unique = true)
	private String id; 
	
	// 航空公司
	private String airline;
	
	//同时适用航司
	private String fitAirline;
	
	//供应商
	private String providerId;
	// GDS
	private String gds;

	//政策标签
	private List<String> pricingLabelKey;
	
	//预定 PCC
	private String pcc;
	
	//运价类型
	private FareType fareType;

	//工作时间(默认 默认工作时间)
	private WorkTimes workTime;
	
	// accountCode
	private String accountCode;
	
	//票证类型
	private TicketType ticketType;
	
	// 人工审核
	private boolean autoTicket = false;
	
	// 出票方式
	private PrintTicketType printTicketType;
	
	//航程信息
	private Route route;
	
	//规则信息：
	//乘客类型
	private Set<PassengerType> passengerTypes;
	// 特殊身份 值
	private String specialValue;
	
	//儿童单开，true为单开，false为不单开  默认true
	private ChdSingleTktType chdSingleTkt;
	// 乘客类型：儿童未勾选
	private ChildRewardType childRewardType;
	// 乘客类型：婴儿未勾选
	private BabyRewardType babyRewardType;
	
	//往返返点--混舱
	private RebateType rebateMixCabin;
	
	//往返返点--跨季
	private RebateType rebateAcrossSeason;
	
	//往返返款--混舱
	private RefundType refundMixCabin;
	
	//往返返款--跨季
	private RefundType refundAcrossSeason;
	
	//政策信息
	//时间组
	private List<TimeGroup> timeGroups;
	
	//政策备注
	//公开备注
	private String publicRemark;
	//内部备注
	private String privateRemark;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getFitAirline() {
		return fitAirline;
	}
	public void setFitAirline(String fitAirline) {
		this.fitAirline = fitAirline;
	}
	public List<TimeGroup> getTimeGroups() {
		return timeGroups;
	}
	public void setTimeGroups(List<TimeGroup> timeGroups) {
		this.timeGroups = timeGroups;
	}
	public String getPublicRemark() {
		return publicRemark;
	}
	public void setPublicRemark(String publicRemark) {
		this.publicRemark = publicRemark;
	}
	public String getPrivateRemark() {
		return privateRemark;
	}
	public void setPrivateRemark(String privateRemark) {
		this.privateRemark = privateRemark;
	}
	public boolean isAutoTicket() {
		return autoTicket;
	}
	public void setAutoTicket(boolean autoTicket) {
		this.autoTicket = autoTicket;
	}
	public WorkTimes getWorkTime() {
		return workTime;
	}
	public void setWorkTime(WorkTimes workTime) {
		this.workTime = workTime;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	public Set<PassengerType> getPassengerTypes() {
		return passengerTypes;
	}
	public void setPassengerTypes(Set<PassengerType> passengerTypes) {
		this.passengerTypes = passengerTypes;
	}
	public RebateType getRebateMixCabin() {
		return rebateMixCabin;
	}
	public void setRebateMixCabin(RebateType rebateMixCabin) {
		this.rebateMixCabin = rebateMixCabin;
	}
	public RebateType getRebateAcrossSeason() {
		return rebateAcrossSeason;
	}
	public void setRebateAcrossSeason(RebateType rebateAcrossSeason) {
		this.rebateAcrossSeason = rebateAcrossSeason;
	}
	public RefundType getRefundMixCabin() {
		return refundMixCabin;
	}
	public void setRefundMixCabin(RefundType refundMixCabin) {
		this.refundMixCabin = refundMixCabin;
	}
	public RefundType getRefundAcrossSeason() {
		return refundAcrossSeason;
	}
	public void setRefundAcrossSeason(RefundType refundAcrossSeason) {
		this.refundAcrossSeason = refundAcrossSeason;
	}
	public ChildRewardType getChildRewardType() {
		return childRewardType;
	}
	public void setChildRewardType(ChildRewardType childRewardType) {
		this.childRewardType = childRewardType;
	}
	public BabyRewardType getInfantRewardType() {
		return babyRewardType;
	}
	public void setInfantRewardType(BabyRewardType babyRewardType) {
		this.babyRewardType = babyRewardType;
	}
	public String getProviderId() {
		return providerId;
	}
	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}
	public String getPcc() {
		return pcc;
	}
	public void setPcc(String pcc) {
		this.pcc = pcc;
	}
	public FareType getFareType() {
		return fareType;
	}
	public void setFareType(FareType fareType) {
		this.fareType = fareType;
	}
	public String getAccountCode() {
		return accountCode;
	}
	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}
	public TicketType getTicketType() {
		return ticketType;
	}
	public void setTicketType(TicketType ticketType) {
		this.ticketType = ticketType;
	}
	public PrintTicketType getPrintTicketType() {
		return printTicketType;
	}
	public void setPrintTicketType(PrintTicketType printTicketType) {
		this.printTicketType = printTicketType;
	}
	public String getSpecialValue() {
		return specialValue;
	}
	public void setSpecialValue(String specialValue) {
		this.specialValue = specialValue;
	}
	public ChdSingleTktType getChdSingleTkt() {
		return chdSingleTkt;
	}
	public void setChdSingleTkt(ChdSingleTktType chdSingleTkt) {
		this.chdSingleTkt = chdSingleTkt;
	}
	public BabyRewardType getBabyRewardType() {
		return babyRewardType;
	}
	public void setBabyRewardType(BabyRewardType babyRewardType) {
		this.babyRewardType = babyRewardType;
	}
	public List<String> getPricingLabelKey() {
		return pricingLabelKey;
	}
	public void setPricingLabelKey(List<String> pricingLabelKey) {
		this.pricingLabelKey = pricingLabelKey;
	}
	public String getGds() {
		return gds;
	}
	public void setGds(String gds) {
		this.gds = gds;
	}
	
	
	
	
}
