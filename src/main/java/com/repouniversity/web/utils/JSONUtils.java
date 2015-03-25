package com.repouniversity.web.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONUtils {

	private static final ObjectMapper mapper = new ObjectMapper();

	private JSONUtils() {
	} // private constructor for utilitary class

	/**
	 * @param entity
	 * @return json string output
	 * @throws JsonProcessingException
	 */
	public static <E> String writeAsJSONString(E entity)
			throws JsonProcessingException {
		return mapper.writeValueAsString(entity);
	}
}
