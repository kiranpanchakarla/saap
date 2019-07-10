package com.ap.mis.util;

import javax.annotation.PostConstruct;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class FileUploadConstraintsUtil {

	private final static Logger log = Logger.getLogger(FileUploadConstraintsUtil.class);
	private final static long KB_FACTOR = 1024;
	private final static long MB_FACTOR = 1024 * KB_FACTOR;
	private final static long GB_FACTOR = 1024 * MB_FACTOR;
	private final static long TB_FACTOR = 1024 * GB_FACTOR;

	@Value("${file.upload.maxFileSize}")
	private String fileUploadSize;

	@Value("${file.upload.allowedFileCount}")
	private Integer maxFileUploadCount;

	private Long maxFileUploadSize;

	@Value("${file.upload.extensions}")
	private String allowedExtensions;

	@PostConstruct
	public void convertFilesMaxSizeFromHumanReadableToBytes() {

		// replace any space between number and Size indicator for example 50 MB to 50MB
		// if any
		fileUploadSize = fileUploadSize.replaceAll("\\s", "");

		int spaceNdx = fileUploadSize.length() - 2;

		double ret = Double.parseDouble(fileUploadSize.substring(0, spaceNdx));

		switch (fileUploadSize.substring(spaceNdx)) {
		case "TB":
			maxFileUploadSize = new Double(ret * TB_FACTOR).longValue();
			break;
		case "GB":
			maxFileUploadSize = new Double(ret * GB_FACTOR).longValue();
			break;
		case "MB":
			maxFileUploadSize = new Double(ret * MB_FACTOR).longValue();
			break;
		case "KB":
			maxFileUploadSize = new Double(ret * KB_FACTOR).longValue();
			break;
		default:
			maxFileUploadSize = 0L;
			break;
		}

		log.info("Allowed max file upload size " + fileUploadSize + " In bytes " + maxFileUploadSize);
		log.info("Allowed max files upload count " + maxFileUploadCount);
		log.info("Allowed file extensions " + allowedExtensions);

	}

	public Integer getMaxFileUploadCount() {
		return maxFileUploadCount;
	}
	
	public Long getMaxFileUploadSize() {
		return maxFileUploadSize;
	}
	
	public String getAllowedExtensions() {
		return allowedExtensions;
	}

}
