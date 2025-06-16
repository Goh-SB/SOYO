package com.kh.soyo.notice.model.service;

import java.util.ArrayList;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.vo.Notice;

public interface NoticeService {
	// 공지사항 목록 조회용 서비스
	ArrayList<Notice> noticeList(PageInfo pi);
	
	// 페이징 처리용 서비스
	int noticeListCount();
	
	// 공지사항 상세 조회용 서비스
	Notice noticeDetail(int nno);
		
	// 공지사항 수정용 서비스
	int updateNotice(Notice n);

	// 공지사항 삭제용 서비스
	int deleteNotice(int noticeNo);
}