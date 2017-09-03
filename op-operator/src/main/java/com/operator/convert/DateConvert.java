package com.operator.convert;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConvert implements Converter<String, Date>{

	@Override
    public Date convert(String stringDate) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
        	System.out.println(stringDate);
            return simpleDateFormat.parse(stringDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
