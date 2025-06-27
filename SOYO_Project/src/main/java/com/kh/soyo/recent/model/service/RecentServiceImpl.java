package com.kh.soyo.recent.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.recent.model.dao.RecentDao;
import com.kh.soyo.recent.model.vo.Recent;

@Service
public class RecentServiceImpl implements RecentService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RecentDao recentDao;

	// 최근 본 상품 등록
	@Override
	public void updateRecent(Recent r) {
		
		recentDao.updateRecent(sqlSession ,r);
	}

	@Override
	public ArrayList<Recent> selectRecent(String memberId) {
		
		return recentDao.selectRecent(sqlSession, memberId);
	}



}
