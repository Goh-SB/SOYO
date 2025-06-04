package com.kh.soyo.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.notice.model.service.NoticeService;
import com.kh.soyo.notice.model.vo.Notice;

@RestController
@CrossOrigin(origins="http://localhost:5173")
@RequestMapping("notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list")
	public HashMap<String, Object> noticeList(@RequestParam(value="cpage") int currentPage) {
		
		int listCount = noticeService.noticeListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,
											pageLimit, boardLimit);
				
		ArrayList<Notice> list = noticeService.noticeList(pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("pi", pi);
		hm.put("list", list);
		
		return hm;
		
	}
	
	@GetMapping("delete")
	public String noticeDelete(@RequestParam int noticeNo ) {
		
		int result =  noticeService.noticeDelete(noticeNo);
		
		return (result > 0) ? "삭제 성공" :"삭제실패" ;
	}
	
	@GetMapping("repair")
	public String noticeRepair(@RequestParam int noticeNo) {
		int result = noticeService.noticeRepair(noticeNo);
		
		return (result > 0) ? "복구 성공" : "복구 실패";
	}
	
	@GetMapping("detail/{noticeNo}")
	public Notice noticeDetail(@PathVariable int noticeNo) {
		
		
		Notice n = noticeService.noticeDetail(noticeNo);
		System.out.println(n);
		return n;
	}
	
}
