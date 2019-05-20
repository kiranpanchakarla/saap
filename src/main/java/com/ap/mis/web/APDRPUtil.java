package com.ap.mis.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import java.util.Base64; //java 8
import javax.xml.bind.DatatypeConverter; // java 7

import com.ap.mis.util.RequestContext;


public class APDRPUtil {

    public static String getHttpPath(String dbURL){
        String path = null;
        if (dbURL != null && !dbURL.equalsIgnoreCase("") && !dbURL.startsWith("http")) {
            path = RequestContext.get().getContextPath();
            if (!path.endsWith("/")){
                path = path + "/";
            }
            path = path + dbURL;
        }else{
            path = dbURL;
        }
        return path;
    }
    
    public static String encodeStringParameters(String queryString){
        byte[] encodedBytes=queryString.getBytes();
     // byte[] encodedByteString = Base64.getEncoder().encode(encodedBytes); //java 8
     	String encodedString = DatatypeConverter.printBase64Binary(encodedBytes); // java 7
     // String encodedString = new String(encodedByteString); // java 8
        return encodedString;
    }
    
    public static String decodeStringParameters(String queryString){
        String decodedString = null;
        if(queryString!=null && !queryString.isEmpty()) {
	     // byte[] decodedBytes = Base64.getDecoder().decode(queryString); //java 8
	        byte[] decodedBytes = DatatypeConverter.parseBase64Binary(queryString); // java 7
	        decodedString = new String(decodedBytes);
        }
    return decodedString;
    }
   
    
    public static String getMonthName(Date date){
        SimpleDateFormat simpleDateformat = new SimpleDateFormat("MM");
        String month=simpleDateformat.format(date);
        Calendar calendar = Calendar.getInstance();
         calendar.set(Calendar.MONTH, Integer.parseInt(month)-1);
         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MMMM");
         simpleDateFormat.setCalendar(calendar);
         String monthName = simpleDateFormat.format(calendar.getTime());
         return monthName;
       
   }
    
    
}
	


