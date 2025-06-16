package com.kh.soyo.notice.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.service.NoticeService;
import com.kh.soyo.notice.model.vo.Notice;

@Controller
@RequestMapping("notice")
public class NoticeController {
	// 의존성 주입
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 목록 조회용 컨트롤러
	@GetMapping("noticeList")
	public String noticeList(Model model, PageInfo pi) {
		// 공지사항 목록 조회 페이지에서 필요로 하는 응답 데이터 구하기
		ArrayList<Notice> list = noticeService.noticeList(pi);
				
		// model(request)에 응답 데이터 담기
		model.addAttribute("list", list);
				
		// 공지사항 목록 조회 화면 포워딩
		return "notice/noticeList";
	}
	
	// 공지사항 상세 조회용 컨트롤러
	@GetMapping("noticeDetail/{noticeNo}")
	public Notice noticeDetail(@PathVariable int noticeNo) {
		return noticeService.noticeDetail(noticeNo);
	}
	
	// 공지사항 수정용 컨트롤러
	@PostMapping("noticeUpdate")
	public String updateNotice(@RequestBody Notice n) {
		int result = noticeService.updateNotice(n);
		
		return (result > 0) ? "공지사항 수정에 성공했습니다." : "공지사항 수정에 실패했습니다.";
	}
	
	// 공지사항 삭제용 컨트롤러
	@PostMapping("noticeDelete")
	public String deleteNotice(@RequestBody Notice n) {
		int result = noticeService.deleteNotice(n.getNoticeNo());
		
		return (result > 0) ? "공지사항 삭제에 성공했습니다." : "공지사항 삭제에 실패했습니다.";
	}
}