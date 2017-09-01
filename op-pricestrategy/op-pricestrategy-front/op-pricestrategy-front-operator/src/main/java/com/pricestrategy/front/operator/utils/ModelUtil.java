package com.pricestrategy.front.operator.utils;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.collections.CollectionUtils;

import com.google.common.collect.Lists;
import com.pricestrategy.front.operator.bean.component.Hourline;
import com.pricestrategy.front.operator.bean.component.LongSpan;
import com.pricestrategy.front.operator.bean.component.Timeline;

public class ModelUtil {

	/** 工具类 */
	private ModelUtil() {}
	
	private static final Pattern OFFICE_NO_PATTERN = Pattern.compile("^[a-zA-Z]{3}[0-9]{3}$");
	
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	
	private static final Pattern CARRIER_PATTERN = Pattern.compile("^[a-zA-Z0-9]{2}$");
	
	public static boolean checkHour(int hour) {
		if(hour > 24 || hour < 0) {
			return false;
		}
		return true;
	}
	
	public static boolean checkMinute(int minute) {
		if(minute > 59 || minute < 0) {
			return false;
		}
		return true;
	}
	
	public static boolean checkCarrier(String carrier) {
		if(StringUtils.isBlank(carrier)) {
			return false;
		}
		return CARRIER_PATTERN.matcher(carrier).matches();
	}
	
	public static boolean checkOfficeNo(String officeNo) {
		if(StringUtils.isBlank(officeNo)) {
			return false;
		}
		return OFFICE_NO_PATTERN.matcher(officeNo).matches();
	}
	
	public static String formatDate(Date date) {
		if(date == null) {
			return null;
		}
		return new SimpleDateFormat(DATE_FORMAT).format(date);
	}
	
	public static String formatTimeline(Timeline timeline) {
		if(timeline == null) {
			return null;
		}
		return String.format("%s至%s", formatDate(timeline.getStart()), formatDate(timeline.getEnd()));
	}
	
	public static String formatHourline(Hourline hourline) {
		if(hourline == null) {
			return null;
		}
		return String.format("%1$02d:%2$02d-%3$02d:%4$02d", hourline.getStart() / 60, hourline.getStart() % 60,
				hourline.getEnd() / 60, hourline.getEnd() % 60);
	}
	
	public static List<LongSpan> convertLongList2Span(List<Long> numbers) {
		if(CollectionUtils.isEmpty(numbers)) {
			return Collections.emptyList();
		}
		Collections.sort(numbers);
		List<LongSpan> result = Lists.newArrayList();
		LongSpan span = null;
		for(long i = numbers.get(0); i <= numbers.get(numbers.size() - 1) + 1; i++) {
			if(numbers.contains(i)) {
				if(span == null) {
					span = new LongSpan(i);
				}
				span.setEnd(i);
				continue;
			} else {
				if(span != null) {
					result.add(span);
					span = null;
				}
			}
		}
		return result;
	}
	
	public static boolean isAllNull(Object... objs) {
		if(objs == null) {
			return true;
		}
		for(Object obj : objs) {
			if(obj != null) {
				return false;
			}
		}
		return true;
	}
	
	public static void main(String[] args) {
		System.out.println(checkCarrier("啊1"));
	}
}
