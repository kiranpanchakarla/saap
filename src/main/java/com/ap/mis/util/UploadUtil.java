package com.ap.mis.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class UploadUtil {

	@Value(value = "${file.upload.path}")
	private String uploadPath;

	public String getUploadPath() {
		if (!uploadPath.endsWith("/")) {
			return uploadPath + "/";
		}
		return uploadPath;
	}
}
