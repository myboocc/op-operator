package com.pricestrategy.front.operator.bean.component;

import java.util.Date;

import com.pricestrategy.front.operator.utils.LogUtil;
import com.pricestrategy.front.operator.utils.ModelUtil;


public class Timeline {
	private Date start;
	
	private Date end;
	
	public Timeline() {}

	public Timeline(Date start, Date end) {
		this.start = start;
		this.end = end;
	}

	public void check() {
		if(start == null || end == null) {
			LogUtil.errorAndThrow("日期[{}]，开始或者结束为空", ModelUtil.formatTimeline(this));
		}
		if(start.after(end)) {
			LogUtil.errorAndThrow("日期[{}]，开始在结束之后", ModelUtil.formatTimeline(this));
		}
	}
	
	public boolean contains(Date date) {
		if(start.after(date) || end.before(date)) {
			return false;
		}
		return true;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((end == null) ? 0 : end.hashCode());
		result = prime * result + ((start == null) ? 0 : start.hashCode());
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
		Timeline other = (Timeline) obj;
		if (end == null) {
			if (other.end != null)
				return false;
		} else if (!end.equals(other.end))
			return false;
		if (start == null) {
			if (other.start != null)
				return false;
		} else if (!start.equals(other.start))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return String.format("Timeline [start=%1$tF, end=%2$tF]", start, end);
	}

}
