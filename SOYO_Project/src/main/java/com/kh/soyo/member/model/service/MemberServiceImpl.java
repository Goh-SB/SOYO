package com.kh.soyo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.soyo.member.model.dao.MemberDao;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

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
		return memberDao.selectMember(sqlSession, memberId);
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

	@Override

	public int checkId(String checkId) {
		
		return memberDao.checkId(sqlSession, checkId);
	}
	public List<Product> orderProduct(String memberId) {
		
		return memberDao.orderProduct(sqlSession,memberId);

	}

	@Transactional
	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public String findId(Member m) {
		
		return memberDao.findId(sqlSession, m);
	}

	// 비밀번호 재발급을 위한 메소드
	@Transactional
	@Override
	public int changePwd(Member m) {
		
		return memberDao.changePwd(sqlSession ,m);
	}

	// 이메일 찾기용 메소드
	@Override
	public String findEmail(Member m) {
		
		return memberDao.findEmail(sqlSession, m);
	}

	@Override
	public List<Product> orderProductList(String impNo) {
		
		return memberDao.orderProductList(sqlSession,impNo);
	}

}