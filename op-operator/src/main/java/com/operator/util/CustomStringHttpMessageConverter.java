package com.operator.util;

import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;

public class CustomStringHttpMessageConverter extends StringHttpMessageConverter {

	@Override
	public boolean canRead(Class<?> clazz, MediaType mediaType) {
		System.out.println(mediaType.getType());
		if (mediaType == null || MediaType.ALL.equals(mediaType)) {
            return true;
        }
        for (MediaType supportedMediaType : getSupportedMediaTypes()) {
            if (supportedMediaType.includes(mediaType)) {
                return true;
            }
        }
        return false;
	}

	
	
}
