package com.api.reporting.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogWrapper {

	private static Logger logger = LoggerFactory.getLogger(LogWrapper.class);
	
	public static void DEBUG(String msg) {
		logger.debug(msg);
	}
	
	public static void INFO(String msg) {
		logger.info(msg);
	}
	
	public static void ERROR(String msg) {
		logger.error(msg);
	}
	
	public static void WARNNING(String msg) {
		logger.warn(msg);
		
	}
}
