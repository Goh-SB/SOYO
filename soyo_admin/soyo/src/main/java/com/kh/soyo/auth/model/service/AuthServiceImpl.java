package com.kh.soyo.auth.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.auth.model.dao.AuthDao;
import com.kh.soyo.member.model.vo.Member;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AuthDao authDao;
	
	@Override
	public Member loginAdmin(String memberId) {
		
		return authDao.loginAdmin(sqlSession, memberId);
	}
	
	
}
