package com.kh.soyo.common.template;


public class XssDefencePolicy {

	public static String defence(String originText) {
		
		String changeText = originText;
		
		changeText = changeText.replace("<", "&lt;");
		changeText = changeText.replace(">", "&gt;");
		changeText = changeText.replace("\"", "&quot;");
		changeText = changeText.replace("'", "&apos;");
		return changeText;
	}
}
