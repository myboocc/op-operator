package com.pricestrategy.front.operator.bean;

import java.util.List;

import com.pricestrategy.front.operator.bean.enums.CurrencyType;
import com.pricestrategy.front.operator.bean.enums.GdsType;

//供应商PCC信息
public class PccInfo {
	// GDS 信息
	
	private String pcc;
	private GdsType gds;
	private CurrencyType currency;
	private String accountCode;
	
	// 新增出票PCC信息
	private List<PrintTicketPcc> printTicketPccs;

	public String getPcc() {
		return pcc;
	}

	public void setPcc(String pcc) {
		this.pcc = pcc;
	}

	public GdsType getGds() {
		return gds;
	}

	public void setGds(GdsType gds) {
		this.gds = gds;
	}

	public CurrencyType getCurrency() {
		return currency;
	}

	public void setCurrency(CurrencyType currency) {
		this.currency = currency;
	}

	public String getAccountCode() {
		return accountCode;
	}

	public void setAccountCode(String accountCode) {
		this.accountCode = accountCode;
	}

	public List<PrintTicketPcc> getPrintTicketPccs() {
		return printTicketPccs;
	}

	public void setPrintTicketPccs(List<PrintTicketPcc> printTicketPccs) {
		this.printTicketPccs = printTicketPccs;
	}

}
