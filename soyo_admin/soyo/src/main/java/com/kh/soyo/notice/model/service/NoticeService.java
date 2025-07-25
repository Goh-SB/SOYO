package com.kh.soyo.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.vo.Notice;

public interface NoticeService {


	int noticeListCount();

	ArrayList<Notice> noticeList(PageInfo pi);

	int noticeDelete(int noticeNo);

	int noticeRepair(int noticeNo);

	Notice noticeDetail(int noticeNo);

	int noticeEnrollForm(Notice n);

	int noticeSearchCount(HashMap<String, Object> map);

	ArrayList<Notice> noticeSearchList(HashMap<String, Object> map, PageInfo pi);

	int noticeFilterCount(String item);

	ArrayList<Notice> noticeFilter(String item, PageInfo pi);

	
}
