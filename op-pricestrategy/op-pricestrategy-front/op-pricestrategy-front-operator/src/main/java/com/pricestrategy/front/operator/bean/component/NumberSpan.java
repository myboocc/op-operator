package com.pricestrategy.front.operator.bean.component;

public class NumberSpan<T extends Number>{
	
	protected T start;
	
	protected T end;
	
	public NumberSpan() {}

	public NumberSpan(T start, T end) {
		this.start = start;
		this.end = end;
	}

	public T getStart() {
		return start;
	}

	public void setStart(T start) {
		this.start = start;
	}

	public T getEnd() {
		return end;
	}

	public void setEnd(T end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		if(start.equals(end)) {
			return start.toString();
		}
		return String.format("%s-%s", start, end);
	}

}
