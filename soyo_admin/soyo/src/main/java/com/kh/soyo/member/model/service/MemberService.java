package com.kh.soyo.member.model.service;

import java.util.ArrayList;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;

public interface MemberService {
	
	ArrayList<Member> MemberList (PageInfo pi);

	int memberListCount();

	int deleteMember(String memberId);

	int repairMember(String memberId);

	Member memberDetail(String memberId);

	int memberUpdateForm(Member m);

}
