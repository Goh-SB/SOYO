package com.kh.soyo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

public interface MemberService {

	// 회원 목록 조회용 서비스
	ArrayList<Member> selectMemberList();
	
	// 회원 상세 조회용 서비스
	Member selectMember(String memberId);
	
	// 회원 정보 수정용 서비스
	int updateMember(Member m);
	
	// 회원 탈퇴용 서비스
	int deleteMember(String memberId);

	// 로그인 처리
	Member loginMember(Member m);
	
	// 비밀번호 변경
	int updatePwd(HashMap<String, String> hm);


	// 아이디 중복확인
	int checkId(String checkId);

	

	List<Product> orderProduct(String memberId);

	int insertMember(Member m);

	// 비밀번호 변경

	
}