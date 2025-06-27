package com.kh.soyo.recent.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.recent.model.service.RecentService;
import com.kh.soyo.recent.model.vo.Recent;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/recent")
public class RecentController {
	
	@Autowired
	private RecentService recentService;
	
	// 최근본 상품 이동시 보여줄 것
	@GetMapping("/myRecent")
	public String myRecent(HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String memberId = loginUser.getMemberId();
		
		ArrayList<Recent> myRecent = recentService.selectRecent(memberId);
		
		
		model.addAttribute("myRecent", myRecent);
		
		return "member/myRecent";
	}
	
}
