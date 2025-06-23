package com.kh.soyo.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.member.model.service.MemberService;
import com.kh.soyo.member.model.vo.Member;

@RestController
@CrossOrigin(origins="http://192.168.40.32:5173")
@RequestMapping("member")
public class MemberController {

	@Autowired
	private MemberService memberService;	
	
	@GetMapping("list")
	public HashMap<String, Object> MemberList (@RequestParam(value="cpage") int currentPage) {
			
		int listCount = memberService.memberListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Member> list = memberService.MemberList(pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("list", list);
		hm.put("pi", pi);
	
		return hm;
		
	}
	
	
	@GetMapping("delete")
	public String deleteMember (String memberId) {
		
		int result = memberService.deleteMember(memberId);
		return (result > 0) ? "삭제 성공" : "삭제 실패" ;
	}
	
	@GetMapping("repair")
	public String repairMember(String memberId) {
		
		int result = memberService.repairMember(memberId);
		return (result > 0) ? "복구 성공" : "복구 실패";
		
	}
	
	
	@GetMapping("detail/{memberId}")
	public Member memberDetail(@PathVariable String memberId) {
		
		// System.out.println(memberId);
		Member m = memberService.memberDetail(memberId);
		
		return m;
	}

	@PostMapping("updateForm")
	public String memberUpdateForm(@RequestBody Member m) {
		
		int result = memberService.memberUpdateForm(m);
		
		return (result > 0) ? "수정 성공" : "수정 실패" ;
		
	}
	
	
	@GetMapping("searchMember")
	public HashMap<String, Object> searchMember(String searchMenu,
							String searchText,
							@RequestParam(value="cpage") int currentPage) {

		
		
		ArrayList<Member> list = new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		map.put("searchMenu", searchMenu);
		map.put("searchText", searchText);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		int listCount = memberService.searchMemberCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		list = memberService.searchMember(pi, map); 
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("list", list);
		hm.put("pi", pi);
		return hm;
	}
	
	@GetMapping("filter")
	public HashMap<String, Object> filter (@RequestParam(value="cpage") int currentPage,
													String item) {
		
		int listCount = memberService.filterCount(item);
		
		int pageLimit = 10;
		int boardLimit = 10;
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = memberService.filter(pi, item); 
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("list", list);
		hm.put("pi", pi);
		return hm;
		
	}
	
	@GetMapping("chart3")
	public int chart3Data() {
		
		int result = memberService.memberListCount();
	
		return result;
	}
	
	@GetMapping("chart1")
	public List<Map<String, Object>> chart1Data() {
		
		return memberService.chart1Data();
		
	}
	
}
