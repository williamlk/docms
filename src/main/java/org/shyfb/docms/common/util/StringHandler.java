package org.shyfb.docms.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @desp 日期时间字符串处理类
 * @author liulichao
 *
 */
public class StringHandler {
	
	/**
	 * @desp 获取月日
	 * @param dateStr
	 * @return
	 */
	public static String getMonthAndDay(String dateStr){
		SimpleDateFormat df=new SimpleDateFormat("MM-dd");
		SimpleDateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date=df2.parse(dateStr);
			return df.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String changeTime2Date(String dateTime){
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat df2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return df.format(df2.parse(dateTime));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getAddDays(String dateStr,int days){
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		try {
			date=df.parse(dateStr);
			Calendar c_end=Calendar.getInstance();
			c_end.setTime(date);
			c_end.set(Calendar.DAY_OF_MONTH, c_end.get(Calendar.DAY_OF_MONTH)+days);
			return df.format(c_end.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static int getDifferDay(String startdate,String enddate){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date start=format.parse(startdate);
			Date end=format.parse(enddate);
			Calendar c_start=Calendar.getInstance();
			Calendar c_end=Calendar.getInstance();
			c_start.setTime(start);
			c_end.setTime(end);
			
			return (int) ((c_end.getTimeInMillis()-c_start.getTimeInMillis())/(1000*3600*24));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static double getDifferMonth(String startdate,String enddate){
		
		return getDifferDay(startdate, enddate)/30.0;
	}
	
	public static String getAddDate(String dateStr,int month){
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
		System.out.println(dateStr);
		try {
			date=df.parse(dateStr);
			Calendar c_end=Calendar.getInstance();
			c_end.setTime(date);
			c_end.set(Calendar.MONTH, c_end.get(Calendar.MONTH)+month);
			return df.format(c_end.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String timeTostr(Date date){
		String strDate="";
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		strDate=format.format(date);
		return strDate;
	}
	
	public static String date2str(Date date){
		String strDate="";
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		strDate=format.format(date);
		return strDate;
	}
	
	public static String getSerial(Date date){
		long mse1=date.getTime();
		SimpleDateFormat fm=new SimpleDateFormat("yyyyMMddHHmmss");
		date.setTime(mse1);
		String serials=fm.format(date);
		return serials;
	}
	
	public static Date StringToDate(String dateStr){
		DateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=null;
		try {
			date = dd.parse(dateStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String changehtml(String str){
		String change="";
		if(str!=null && !str.equals("")){
			change=str.replace("&", "&amp;");
			change=change.replace(" ","&nbsp;");
			change=change.replace("<","&lt;");
			change=change.replace(">","&gt;");
			change=change.replace("\"","&quot;");
			change=change.replace("\r\n","<br>");
		}
		return change;
	}
	
}
