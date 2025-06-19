package com.kh.soyo.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.vo.Notice;

public interface NoticeService {
	// 공지사항 목록 조회용 서비스(페이징 처리 포함)
	ArrayList<Notice> noticeList(PageInfo pi);
	int noticeListCount();
	
	// 공지사항 검색용 서비스(페이징 처리 포함)
	ArrayList<Notice> searchNoticeList(PageInfo pi, HashMap<String, String> map);
	int searchNoticeListCount(HashMap<String, String> map);
	
	// 공지사항 필터링용 서비스(페이징 처리 포함)
	ArrayList<Notice> noticeFilter(List<String> noticeType, PageInfo pi);
	int noticeFilterCount(List<String> noticeType);
	
	// 공지사항 상세 조회용 서비스
	Notice noticeDetail(int nno);
		
	// 공지사항 수정용 서비스
	int updateNotice(Notice n);

	// 공지사항 삭제용 서비스
	int deleteNotice(int noticeNo);
}