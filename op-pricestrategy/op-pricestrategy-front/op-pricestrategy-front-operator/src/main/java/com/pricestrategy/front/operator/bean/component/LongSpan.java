package com.pricestrategy.front.operator.bean.component;

public class LongSpan extends NumberSpan<Long> {

	public LongSpan() {
		super();
	}
	
	public LongSpan(long start) {
		super(start, start);
	}

	public LongSpan(long start, long end) {
		super(start, end);
	}

}
