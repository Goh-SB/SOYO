package com.kh.soyo.notice.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.service.NoticeService;
import com.kh.soyo.notice.model.vo.Notice;

@Controller
public class NoticeController {
	// 의존성 주입
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 목록 조회용 컨트롤러
	@GetMapping("list")
	public ArrayList<Notice> noticeList(PageInfo pi) {
		return noticeService.noticeList(pi);
	}
	
	// 공지사항 상세 조회용 컨트롤러
	@GetMapping("detail/{noticeNo}")
	public Notice noticeDetail(@PathVariable int noticeNo) {
		return noticeService.noticeDetail(noticeNo);
	}
	
	// 공지사항 수정용 컨트롤러
	@PostMapping("update")
	public String updateNotice(@RequestBody Notice n) {
		int result = noticeService.updateNotice(n);
		
		return (result > 0) ? "공지사항 수정에 성공했습니다." : "공지사항 수정에 실패했습니다.";
	}
	
	// 공지사항 삭제용 컨트롤러
	@PostMapping("delete")
	public String deleteNotice(@RequestBody Notice n) {
		int result = noticeService.deleteNotice(n.getNoticeNo());
		
		return (result > 0) ? "공지사항 삭제에 성공했습니다." : "공지사항 삭제에 실패했습니다.";
	}
}