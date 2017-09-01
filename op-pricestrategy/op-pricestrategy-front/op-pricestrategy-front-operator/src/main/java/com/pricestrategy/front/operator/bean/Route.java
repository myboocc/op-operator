package com.pricestrategy.front.operator.bean;

import java.util.List;
import java.util.Set;

import com.pricestrategy.front.operator.bean.component.Condition;
import com.pricestrategy.front.operator.bean.enums.CommonSelect;
import com.pricestrategy.front.operator.bean.enums.FlyType;
import com.pricestrategy.front.operator.bean.enums.RouteType;
import com.pricestrategy.front.operator.bean.enums.ShareCode;
import com.pricestrategy.front.operator.utils.LogUtil;

public class Route {
	
	//航程类型
	private Set<RouteType> routeTypes;

	/** 是否直飞 */
	private Set<FlyType> flyTypes;
	
	// 代码共享
	private ShareCode shareCode;

	/** 出发机场 包含 */
	private List<String> departAirportsInclude;
	
	/** 出发机场 排除 */
	private List<String> departAirportsExclude;

	/** 到达机场 包含*/
	private List<String> arriveAirportsInclude;
	
	/** 到达机场 排除*/
	private List<String> arriveAirportsExclude;
	
	//fareBais
	private Condition<String> fareBasis;

	/** 去程航班号 */
	private Condition<String> departFlightnos;

	/** 回程航班号 */
	private Condition<String> returnFlightnos;
	
	//中转点 
	private Condition<String> transfer;
	

	public Route() {}
	


	public void check() {
		if(!routeTypes.contains(RouteType.OW) && !routeTypes.contains(RouteType.RT)) {
			LogUtil.errorAndThrow("航程类型，单程和往返至少勾选一项");
		}
	}

	public Set<RouteType> getRouteTypes() {
		return routeTypes;
	}

	public void setRouteTypes(Set<RouteType> routeTypes) {
		this.routeTypes = routeTypes;
	}

	public Condition<String> getDepartFlightnos() {
		return departFlightnos;
	}

	public void setDepartFlightnos(Condition<String> departFlightnos) {
		this.departFlightnos = departFlightnos;
	}

	public Condition<String> getReturnFlightnos() {
		return returnFlightnos;
	}

	public void setReturnFlightnos(Condition<String> returnFlightnos) {
		this.returnFlightnos = returnFlightnos;
	}

	public Set<FlyType> getFlyTypes() {
		return flyTypes;
	}

	public void setFlyTypes(Set<FlyType> flyTypes) {
		this.flyTypes = flyTypes;
	}

	public Condition<String> getFareBasis() {
		return fareBasis;
	}

	public void setFareBasis(Condition<String> fareBasis) {
		this.fareBasis = fareBasis;
	}

	public ShareCode getShareCode() {
		return shareCode;
	}

	public void setShareCode(ShareCode shareCode) {
		this.shareCode = shareCode;
	}

	public Condition<String> getTransfer() {
		return transfer;
	}

	public void setTransfer(Condition<String> transfer) {
		this.transfer = transfer;
	}



	public List<String> getDepartAirportsInclude() {
		return departAirportsInclude;
	}



	public void setDepartAirportsInclude(List<String> departAirportsInclude) {
		this.departAirportsInclude = departAirportsInclude;
	}



	public List<String> getDepartAirportsExclude() {
		return departAirportsExclude;
	}



	public void setDepartAirportsExclude(List<String> departAirportsExclude) {
		this.departAirportsExclude = departAirportsExclude;
	}



	public List<String> getArriveAirportsInclude() {
		return arriveAirportsInclude;
	}



	public void setArriveAirportsInclude(List<String> arriveAirportsInclude) {
		this.arriveAirportsInclude = arriveAirportsInclude;
	}



	public List<String> getArriveAirportsExclude() {
		return arriveAirportsExclude;
	}



	public Route(Set<RouteType> routeTypes, Set<FlyType> flyTypes, ShareCode shareCode,
			List<String> departAirportsInclude, List<String> departAirportsExclude, List<String> arriveAirportsInclude,
			List<String> arriveAirportsExclude, Condition<String> fareBasis, Condition<String> departFlightnos,
			Condition<String> returnFlightnos, Condition<String> transfer) {
		super();
		this.routeTypes = routeTypes;
		this.flyTypes = flyTypes;
		this.shareCode = shareCode;
		this.departAirportsInclude = departAirportsInclude;
		this.departAirportsExclude = departAirportsExclude;
		this.arriveAirportsInclude = arriveAirportsInclude;
		this.arriveAirportsExclude = arriveAirportsExclude;
		this.fareBasis = fareBasis;
		this.departFlightnos = departFlightnos;
		this.returnFlightnos = returnFlightnos;
		this.transfer = transfer;
	}



	public void setArriveAirportsExclude(List<String> arriveAirportsExclude) {
		this.arriveAirportsExclude = arriveAirportsExclude;
	}



	@Override
	public String toString() {
		return "Route [routeTypes=" + routeTypes + ", flyTypes=" + flyTypes + ", shareCode=" + shareCode
				+ ", departAirportsInclude=" + departAirportsInclude + ", departAirportsExclude="
				+ departAirportsExclude + ", arriveAirportsInclude=" + arriveAirportsInclude
				+ ", arriveAirportsExclude=" + arriveAirportsExclude + ", fareBasis=" + fareBasis + ", departFlightnos="
				+ departFlightnos + ", returnFlightnos=" + returnFlightnos + ", transfer=" + transfer + "]";
	}


}
