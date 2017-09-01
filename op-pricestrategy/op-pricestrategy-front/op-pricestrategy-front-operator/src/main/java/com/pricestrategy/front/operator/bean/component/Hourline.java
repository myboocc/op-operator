package com.pricestrategy.front.operator.bean.component;

import com.pricestrategy.front.operator.utils.LogUtil;
import com.pricestrategy.front.operator.utils.ModelUtil;

public class Hourline {
	public static final int MAX_MINUTE_OF_DAY = 60 * 24 - 1;
	
	private int start;
	
	private int end;
	
	public Hourline() {}
	
	public Hourline(int start, int end) {
		this.start = start;
		this.end = end;
	}
	
	public void check() {
		if(!checkMinute(this.start) || !checkMinute(this.end)) {
			LogUtil.errorAndThrow("时间[{}]，开始或者结束超出范围", ModelUtil.formatHourline(this));
		}
		if(start > end) {
			LogUtil.errorAndThrow("时间[{}]，开始大于结束", ModelUtil.formatHourline(this));
		}
	}
	
	private  boolean checkMinute(int minute) {
		if(minute > MAX_MINUTE_OF_DAY || minute < 0) {
			return false;
		}
		return true;
	}
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + end;
		result = prime * result + start;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Hourline other = (Hourline) obj;
		if (end != other.end)
			return false;
		if (start != other.start)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return ModelUtil.formatHourline(this);
	}

}
