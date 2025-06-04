package com.kh.soyo.notice.model.service;

import java.util.ArrayList;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.vo.Notice;

public interface NoticeService {
	// 공지 목록
	ArrayList<Notice> noticeList(PageInfo pi);
	
	// 공지 상세
	Notice noticeDetail(int noticeNo);
		
	// 공지 수정
	int updateNotice(int noticeNo);

	// 공지 삭제
	int deleteNotice(int noticeNo);
}