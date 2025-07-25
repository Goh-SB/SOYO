package com.kh.soyo.common.template;

public class XssDefencePolicy {

	public static String defence(String originText) {
			
		String changeText = originText;
		
		changeText = changeText.replace("<", "&lt;");
		changeText = changeText.replace(">", "&gt;");
		changeText = changeText.replace("\"", "&quot;");
		changeText = changeText.replace("'", "&apos;");
		// ...
		// > 위와 같이 막고자 하는 html 예약어를 replace 한다.
		
		return changeText;
	}
	// > defence 메소드는 NoticeController, BoardController 등에서 
	//   다양하게 사용 가능 (공통코드 작업)
	
}
