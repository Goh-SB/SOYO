package com.kh.soyo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.dao.MemberDao;
import com.kh.soyo.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Member> MemberList(PageInfo pi) {
		return memberDao.MemberList(sqlSession, pi);
	}

	@Override
	public int memberListCount() {
		return memberDao.memberListCount(sqlSession);
	}

	@Override
	public int deleteMember(String memberId) {
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int repairMember(String memberId) {
		return memberDao.repairMember(sqlSession, memberId);
	}

	@Override
	public Member memberDetail(String memberId) {
		return memberDao.memberDetail(sqlSession,  memberId);
	}

	@Override
	public int memberUpdateForm(Member m) {
		return memberDao.memberUpdateForm(sqlSession, m);
	}

	@Override
	public int searchMemberCount(HashMap<String, Object> map) {
		return memberDao.searchMemberCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> searchMember(PageInfo pi, HashMap<String, Object> map) {
		return memberDao.searchMember(sqlSession, pi, map);
	}

	@Override
	public int filterCount(String item) {

		return memberDao.filterCount(sqlSession, item);
	}

	@Override
	public ArrayList<Member> filter(PageInfo pi, String item) {

		return memberDao.filter(sqlSession, pi, item);
	}

	@Override
	public List<Map<String, Object>> chart1Data() {

		return memberDao.chart1Data(sqlSession);
	}

	@Override
	public int percentMen() {

		return memberDao.percentMen(sqlSession);
	}

	@Override
	public int percentWomen() {

		return memberDao.percentWomen(sqlSession);
	}

	@Override
	public int percentNoGender() {

		return memberDao.percentNoGender(sqlSession);
	}





}
