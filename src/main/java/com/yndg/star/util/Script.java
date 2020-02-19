package com.yndg.star.util;

public class Script {

	public static String href(String msg, String url) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
		return sb.toString();
	}
	
	public static String back(String msg) {
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("alert("+msg+");");
		sb.append("hist;");
		sb.append("</script>");
		return sb.toString();
	}
}
