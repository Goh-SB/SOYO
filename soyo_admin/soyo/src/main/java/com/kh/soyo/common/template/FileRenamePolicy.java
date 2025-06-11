package com.kh.soyo.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

public class FileRenamePolicy {

	public static String saveFile(MultipartFile upfile,
			  HttpSession session,
			  String path) {
		
		// 1. 원본파일명 변수에 담기
		String originName = upfile.getOriginalFilename();
		
		// 수정파일명 로직
		// 2. 현재 시간을 "년월일시분초" 형식으로 뽑아내기
		String currentTime = 
		new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤 수 뽑기 (10000 ~ 99999)
		int random = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로 부터 확장자명을 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 모두 이어붙이기
		String changeName = currentTime + random + ext;
		
		// 6. 업로드 하고자 하는 물리적인 경로 얻어내기
		String savePath = session.getServletContext().getRealPath(path);
		
		// 7. 경로와 수정파일명을 합친 후 파일 업로드
		try {
		upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
		e.printStackTrace();
		}
		
		// changeName 리턴
		return changeName;
		}

}
