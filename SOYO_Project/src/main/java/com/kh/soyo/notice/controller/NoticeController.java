package com.kh.soyo.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.notice.model.service.NoticeService;
import com.kh.soyo.notice.model.vo.Notice;
import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("notice")
public class NoticeController {
	// 의존성 주입
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 목록 조회용 컨트롤러
	@GetMapping("noticeList")
	public ModelAndView noticeList(@RequestParam(value="nPage", defaultValue="1") int currentPage,
								ModelAndView mv, HttpServletRequest request) {
		// 공지사항 목록 조회 페이지에서 필요로 하는 응답 데이터 구하기
		int listCount = noticeService.noticeListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// pi를 전달하면서 Service로 요청 후 결과 받기
		ArrayList<Notice> list = noticeService.noticeList(pi);
		
		// list와 pi를 응답 데이터로 보내고 화면 포워딩
		mv.addObject("list", list)	// tbody 영역에 출력
			.addObject("pi", pi)	// paging-area에 출력
			.setViewName("notice/noticeList");

		return mv;
	}
	
	// 공지사항 검색용 컨트롤러
	@GetMapping("searchNoticeList")
	public ModelAndView searchNoticeList(@RequestParam(value="nPage", defaultValue="1") int currentPage,
										ModelAndView mv, String condition, String keyword) {
		// 검색 조건과 검색어를 DAO로 넘기기 위해 하나의 HashMap으로 가공
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
			
		int searchCount = noticeService.searchNoticeListCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage,
											pageLimit, boardLimit);
			
		// pi를 전달하면서 Service로 요청 후 결과 받기
		ArrayList<Notice> list = noticeService.searchNoticeList(pi, map);
			
		// list와 pi를 응답 데이터로 보내고 화면 포워딩(기존의 게시글 목록 페이지 재활용)
		mv.addObject("list", list)				// tbody 영역에 출력
			.addObject("pi", pi)				// paging-area에 출력
		    .addObject("condition", condition)	// 검색 조건 유지
		    .addObject("keyword", keyword)		// 검색어 유지
			.setViewName("notice/noticeList");
		
		return mv;
	}
	
	// 공지사항 필터링용 컨트롤러
	@GetMapping("noticeFilter")
	@ResponseBody
	public HashMap<String, Object> noticeFilter(@RequestParam(value="nPage", defaultValue="1") int currentPage,
												String noticeType) {
		// 페이징 설정
		int listCount = noticeService.noticeFilterCount(noticeType);
	    int pageLimit = 10;
	    int boardLimit = 10;
	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	    
	    // 공지 타입과 pi를 DAO로 넘기기 위해 하나의 ArrayList로 가공
	    ArrayList<Notice> list = noticeService.noticeFilter(noticeType, pi);
	    
	    HashMap<String, Object> map = new HashMap<>();
	    map.put("list", list);
	    map.put("pi", pi);
	    
	    // System.out.println(model);
	    return map;
	}
	
	// 공지사항 상세 조회용 컨트롤러
	@GetMapping("noticeDetail/{nno}")
	public String noticeDetail(@PathVariable int nno, Model model) {
		Notice notice =  noticeService.noticeDetail(nno);
		model.addAttribute("n", notice);
		
		return "notice/noticeDetail";
	}
}
	