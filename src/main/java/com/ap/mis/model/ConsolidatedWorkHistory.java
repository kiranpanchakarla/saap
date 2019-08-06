package com.ap.mis.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConsolidatedWorkHistory {

	private String message;

	private Date date;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public ConsolidatedWorkHistory() {
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public ConsolidatedWorkHistory(String message, Date date) {
		this.message = message;
		this.date = date;
	}

	public Date onlyDate() {
		try {
			return sdf.parse(sdf.format(this.getDate()));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
