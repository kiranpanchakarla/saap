package com.ap.mis.util;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class FileUploadConstraintsUtil {

	private final static Logger log = Logger.getLogger(FileUploadConstraintsUtil.class);
	private final static long KB_FACTOR = 1024;
	private final static long MB_FACTOR = 1024 * KB_FACTOR;
	private final static long GB_FACTOR = 1024 * MB_FACTOR;

	@Value("${file.upload.maxFileSize}")
	String fileUploadSize;

	

	@Bean
	public Long fileUploadMaxSize() {

		log.info("actual file sie in properties file " + fileUploadSize);
		fileUploadSize = fileUploadSize.replaceAll("\\s", "");

		int spaceNdx = fileUploadSize.length() - 2;
		double ret = Double.parseDouble(fileUploadSize.substring(0, spaceNdx));

		switch (fileUploadSize.substring(spaceNdx)) {
		case "GB":
			return new Double(ret * GB_FACTOR).longValue();
		case "MB":
			return new Double(ret * MB_FACTOR).longValue();
		case "KB":
			return new Double(ret * KB_FACTOR).longValue();
		}
		return 0L;
	}



}
