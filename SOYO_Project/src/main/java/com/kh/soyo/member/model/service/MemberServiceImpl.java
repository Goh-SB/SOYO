package com.kh.soyo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.soyo.board.model.dao.MemberDao;
import com.kh.soyo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public ArrayList<Member> selectMemberList() {
		return null;
	}

	@Override
	public Member selectMember(String memberId) {
		return null;
	}

	@Transactional
	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	@Transactional
	@Override
	public int deleteMember(String memberId) {
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public Member loginMember(Member m) {
		
		return memberDao.loginMember(sqlSession, m);
		
	}

	@Transactional
	@Override
	public int updatePwd(HashMap<String, String> hm) {
		
		return memberDao.updatePwd(sqlSession, hm);
	}

}