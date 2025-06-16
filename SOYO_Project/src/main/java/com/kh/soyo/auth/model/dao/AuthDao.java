package com.kh.soyo.auth.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.member.model.vo.Member;

@Repository
public class AuthDao {

	public Member loginAdmin(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("authMapper.loginAdmin", memberId);
	}

}
