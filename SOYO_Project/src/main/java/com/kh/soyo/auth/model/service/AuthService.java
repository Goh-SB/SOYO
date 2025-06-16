package com.kh.soyo.auth.model.service;

import com.kh.soyo.member.model.vo.Member;

public interface AuthService {

	// 인증 (로그인) 용 서비스
	Member loginAdmin(String userId);
	
}