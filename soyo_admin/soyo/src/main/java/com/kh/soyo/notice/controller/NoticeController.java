package com.kh.soyo.notice.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.common.template.XssDefencePolicy;
import com.kh.soyo.notice.model.service.NoticeService;
import com.kh.soyo.notice.model.vo.Notice;

import jakarta.servlet.http.HttpSession;

@RestController
@CrossOrigin(origins="http://192.168.40.32:5173")
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
		// System.out.println(n);
		return n;
	}
	
	
	@PostMapping("enrollForm")
	public String noticeEnrollForm(@RequestParam(value = "upfile", required = false) MultipartFile upfile,
								Notice n,
								HttpSession session) {
		
		String chageTitle = XssDefencePolicy.defence(n.getNoticeTitle());
		String chageContent = XssDefencePolicy.defence(n.getNoticeContent());
		
		n.setNoticeContent(chageContent);
		n.setNoticeTitle(chageTitle);
		
		
		if(upfile != null && !upfile.isEmpty()) {
			String originName = upfile.getOriginalFilename();
		
			String path = "/resources/notice_upfile/"; 
			
			String savePath = session.getServletContext().getRealPath(path);
			
			
			
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			n.setNoticeImage(originName);
			
		}
		
		
		int result = noticeService.noticeEnrollForm(n);
		
		return (result > 0) ? "작성성공" : "작성실패";
		
	}
	
	@GetMapping("filter")
	public HashMap<String, Object> filter (String item,
						@RequestParam (value="cpage") int currentPage) {
		
		// System.out.println(item);
		// System.out.println(currentPage);
		
		int listCount = noticeService.noticeFilterCount(item);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,
											pageLimit, boardLimit);
				
		ArrayList<Notice> list = noticeService.noticeFilter(item, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("pi", pi);
		hm.put("list", list);
		
		return hm;
		
	}
	
	@GetMapping("search")
	public HashMap<String, Object> search (String keyword,
						String noticeMenu,
						@RequestParam(value="cpage")int currentPage) {
		
		// System.out.println(keyword);
		// System.out.println(noticeMenu);
		// System.out.println(currentPage);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("noticeMenu", noticeMenu);
		
		int listCount = noticeService.noticeSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,
											pageLimit, boardLimit);
				
		ArrayList<Notice> list = noticeService.noticeSearchList(map,pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("pi", pi);
		hm.put("list", list);
		
		return hm;
		
	}	
	
	
}
