package com.kh.soyo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;

public interface MemberService {
	
	ArrayList<Member> MemberList (PageInfo pi);

	int memberListCount();

	int deleteMember(String memberId);

	int repairMember(String memberId);

	Member memberDetail(String memberId);

	int memberUpdateForm(Member m);

	int searchMemberCount(HashMap<String, Object> map);

	ArrayList<Member> searchMember(PageInfo pi, HashMap<String, Object> map);

	int filterCount(String item);

	ArrayList<Member> filter(PageInfo pi, String item);

}
