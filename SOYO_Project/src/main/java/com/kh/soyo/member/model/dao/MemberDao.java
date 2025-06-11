package com.kh.soyo.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}

	// 회원 정보 수정용 메소드
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	// 회원 삭제용 메소드
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> hm) {
		
		return sqlSession.update("memberMapper.updatePwd", hm);
	}

	// 아이디 중복 체크용 메소드
	public int checkId(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.checkId" ,checkId);
	}

}