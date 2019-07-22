package com.ap.mis.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public enum EnumMap {

	/* UI_Columns  DB_pojo_Columns*/
	ADMIN("ROLE_ADMIN","'Work_Created','Admin_Sanction','Line_Department','Land_Details','COMPLETED'"),
	SAAP("ROLE_SAAP","'Work_Created','Admin_Sanction','Line_Department','Land_Details','COMPLETED'"),
	DEPARTMENT("ROLE_DEPARTMENT","'Land_Details','SAAP_APRVD','TECHNICL_SANKSN_CMPLTD'"),
	CONSULTANT("ROLE_CONSULTANT","'Land_Details','PEND_SAAP_APRVL','SAAP_APRVD','WORK_ESTMASN_CMPLTD'");
	
	private String status;
	private String value;
	
	private EnumMap(String status, String value) {
		this.status = status;
		this.value = value;
	}

    public static final Map<String, EnumMap> UI_COLUMN;
    static {
        Map<String, EnumMap> tmpMap = new HashMap<String, EnumMap>();
        for(EnumMap requestStatusEnum : EnumMap.values()) {
            tmpMap.put(requestStatusEnum.status, requestStatusEnum);
        }
        UI_COLUMN = Collections.unmodifiableMap(tmpMap);
    }
	
    public static final Map<EnumMap, String> DB_COLUMN;
    static {
        Map<EnumMap, String> tmpMap = new HashMap<EnumMap, String>();
        for(EnumMap requestStatusEnum : EnumMap.values()) {
            tmpMap.put(requestStatusEnum, requestStatusEnum.value);
        }
        DB_COLUMN = Collections.unmodifiableMap(tmpMap);
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
