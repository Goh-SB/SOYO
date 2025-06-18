package com.kh.soyo.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.dao.NoticeDao;
import com.kh.soyo.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	// 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public ArrayList<Notice> noticeList(PageInfo pi) {
		return noticeDao.noticeList(sqlSession, pi);
	}
	
	@Override
	public int noticeListCount() {
		return noticeDao.noticeListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Notice> searchNoticeList(PageInfo pi, HashMap<String, String> map) {
		return noticeDao.searchNoticeList(sqlSession, pi, map);
	}

	@Override
	public int searchNoticeListCount(HashMap<String, String> map) {
		return noticeDao.searchNoticeListCount(sqlSession, map);
	}
	
	@Override
	public Notice noticeDetail(int nno) {
		return noticeDao.noticeDatail(sqlSession, nno);
	}
	
	@Override
	@Transactional
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}

	@Override
	@Transactional
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}
}