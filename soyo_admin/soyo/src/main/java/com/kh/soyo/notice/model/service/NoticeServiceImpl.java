package com.kh.soyo.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.Dao.NoticeDao;
import com.kh.soyo.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;


	@Override
	public int noticeListCount() {
		return noticeDao.noticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> noticeList(PageInfo pi) {
		return noticeDao.noticeList(sqlSession, pi);
	}

	@Override
	@Transactional
	public int noticeDelete(int noticeNo) {
		return noticeDao.noticeDelete(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int noticeRepair(int noticeNo) {
		return noticeDao.noticeRepair(sqlSession, noticeNo);
	}

	@Override
	public Notice noticeDetail(int noticeNo) {
		return noticeDao.noticeDatail(sqlSession, noticeNo);
	}
	
}
