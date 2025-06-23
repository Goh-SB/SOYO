package com.kh.soyo.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

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
	// 회원이 주문한 상품 조회용 메소드
	public List<Product> orderProduct(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectList("memberMapper.orderProduct",memberId);

	}

	// 회원가입용 메소드
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectMember", memberId);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.newRandomPwd", m);
	}

	// 이메일 가져오기
	public String findEmail(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findEmail", m);
	}

	public List<Product> orderProductList(SqlSessionTemplate sqlSession, String impNo) {
		
		return sqlSession.selectList("memberMapper.orderProductList",impNo);
	}

}