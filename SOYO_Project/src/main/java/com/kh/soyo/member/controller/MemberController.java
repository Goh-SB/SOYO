package com.kh.soyo.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.soyo.member.model.service.MemberService;
import com.kh.soyo.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "member/loginPage";
	}
	
	// 로그인 요청 처리용 메서드
	@PostMapping("/login")
	public String loginMember(Member m, Model model, HttpSession session) {
		
		// VO 객체를 서비스로 전달하면서 요청 후 결과 받기
		Member loginUser = memberService.loginMember(m);
		
		// System.out.println(loginUser);
		
		if(loginUser == null) { // 로그인 실패
			
			// 에러문구 담아서 에러페이지 보여지게끔
			model.addAttribute("errorMsg", "로그인에 실패했습니다. (디자인 바꿀 겁니다.. ㅋㅋ)");
			
			// 응답페이지 보여지게끔 문자열 리턴
			return "common/errorPage";
			
		} else { // 성공
			
			// 응답데이터로 방금 로그인 성공한 회원의 정보 담기
			// > 단, 로그인한 회원의 정보를 로그아웃 전까지
			//   전역에서 꺼내다 쓸 수 있도록 담아둬야 한다.
			// > 브라우저 창이 닫히면 담긴 값도 날아가는 session 객체에 담기
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			
			// 응답화면이 보여지게끔 처리 (리다이렉트)
			return "redirect:/";
			// > / 는 /soyo 뒤의 /를 나타냄.
		}
		
	} // loginMember 메서드 끝
	
	// 로그아웃 요청 처리용 메서드
	@GetMapping("/logout")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		session.setAttribute("alertMsg", "로그아웃에 성공하였습니다.");
		
		return "redirect:/";
		
	}
	
	// 주문 목록 조회 페이지
	@GetMapping("/myOrderPage")
	public String myOrderListPage() {
		return "member/myOrderPage";
	}
	
	// 내 정보 조회 페이지 이동메소드
	@GetMapping("/myInformation")
	public String myInformation() {
		
		return "member/myInformation";
	}
	
	// 내 정보 수정페이지 이동메소드
	@GetMapping("/memberUpdateForm")
	public String memberUpdateForm(){
		return "member/memberUpdateForm";
	}
	
	// 내 정보 변경시 실행할 메소드
	@PostMapping("update")
	public String updateMember(Member m, HttpSession session) {
		// System.out.println(m);
		
		// 정보 바꾸고 오기
		int result = memberService.updateMember(m);
		
		return "member/myInformation";
	}
	
}