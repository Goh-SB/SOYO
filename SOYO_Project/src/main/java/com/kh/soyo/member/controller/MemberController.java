package com.kh.soyo.member.controller;

import java.util.Collections;
import java.util.HashMap;

import java.util.Map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.soyo.member.model.service.MemberService;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 인증번호를 담아둘 해시맵 생성 (전역변수)
	// key : 인증할 email 주소, value : 인증번호
	private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "member/loginPage";
	}
	
	// 회원가입 페이지 이동 메소드
	@GetMapping("/memberEnrollForm")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
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
	
	// 회원 탈퇴페이지 이동메소드
	@GetMapping("/memberDeleteForm")
	public String memberDeleteForm() {
		return "member/memberDeleteForm";
	}
	
	// 비밀번호 변경페이지 이동 메소드
	@GetMapping("/memberPwdUpdateForm")
	public String memberPwdUpdateForm() {
		return "member/memberPwdUpdateForm";
	}
	
	
	
	// 로그인 요청 처리용 메서드
	@PostMapping("/login")
	public String loginMember(Member m, Model model,
			String saveId, HttpSession session,
			HttpServletResponse response) {
		
		// 로그인 처리 전 쿠키 사용하여 아이디 저장
		if(saveId != null && saveId.equals("y")) {
			// > 아이디 저장 OK (키 + 밸류 세트로 아이디를 쿠키에 저장)
			
			Cookie cookie = new Cookie("saveId", m.getMemberId());
			
			// 1 일 동안 저장할 수 있게끔 만료 설정 (초단위)
			cookie.setMaxAge(1 * 24 * 60 * 60);
			
			// 쿠키 데이터가 이 웹사이트 전역에서 모두 정확하게 활용 가능하게끔
			cookie.setPath("/soyo/");
			
			// 응답정보로 브라우저에 쿠키 저장
			response.addCookie(cookie);
			
		} else { // 저장 X
		    // 기존 쿠키 완전 삭제
		    Cookie cookie = new Cookie("saveId", null);
		    cookie.setMaxAge(0);
		    cookie.setPath("/soyo/");
		    response.addCookie(cookie);
		    
		    // 추가로 빈 값 쿠키도 설정 (브라우저 호환성)
		    Cookie emptyCookie = new Cookie("saveId", "");
		    emptyCookie.setMaxAge(0);
		    emptyCookie.setPath("/soyo/");
		    response.addCookie(emptyCookie);
		}
		
		
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
	
	// 회원가입 아이디 중복확인용 메소드
	@ResponseBody
	@GetMapping("checkId")
	public String ajaxCheckId(String checkId) {
		
		if(checkId.equals("") || !checkId.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$")) {
		// 빈 문자열이거나 정규표현식에 맞지 않을때
			return "NNNNT";
		} else {
			
			int count = memberService.checkId(checkId);
		
			return (count > 0) ? "NNNNN" : "NNNNY";
		}
		
		
	}
	
	// 이메일 인증번호 발급용 메소드
	@ResponseBody
	@PostMapping("cert")
	public String getCertNo(String email) {
		
		// 6자리의 랜덤 1회성 인증번호 발급
		int random = (int)(Math.random() * 900000 + 100000);
		
		// 대조용으로 가지고 있기
		certNoList.put(email, String.valueOf(random));
		
		// 해당 이메일로 인증번호 전송하기
		SimpleMailMessage message = new SimpleMailMessage();
		
		// 메세지 정보 담기
		message.setSubject("[soyo] 이메일 인증 번호입니다");
		message.setText("본인이 아니시라면 무시하시면 됩니다. \n인증번호 : " + random);
		message.setTo(email);
		
		mailSender.send(message);
		
		return "인증번호 발급 완료";
	}
	
	// 내 정보 변경시 실행할 메소드
	@PostMapping("update")
	public ModelAndView updateMember(Member m, HttpSession session, ModelAndView mv) {
		// System.out.println(m);
		
		// 정보 바꾸고 오기
		int result = memberService.updateMember(m);
		
		if(result > 0) {
			
			Member updateMem = memberService.loginMember(m);
			
			session.setAttribute("loginUser", updateMem);
			
			session.setAttribute("alertMsg", "회원정보 변경 성공");
			
			mv.setViewName("redirect:/member/myInformation");
			
		} else {
			
			mv.addObject("alertMsg", "회원정보 변경 실패");
			
			mv.setViewName("member/loginPage");
		}
		
		return mv;
		
		
	}
	
	// 비밀번호 변경시 실행할 메소드
	@PostMapping("updatePwd")
	public String memberPwdUpdate(String originPwd, String updatePwd ,String checkPwd, HttpSession session) {
		
		// 세션에서 현재 접속중인 회원의 아이디 얻어오기
		String userId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		// 비밀번호 비교를 위해 세션에서 비밀번호 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 일단 현재 사용중인 비밀번호가 맞는지 확인
		// 암호화 작업을 안했기 때문에 일단은 단순 문자열 비교로 판단하기
		if(loginUser.getMemberPwd().equals(originPwd)) { // 같을경우
			
			// 해시맵으로 묶어서 전달값 넘겨주기
			HashMap<String, String> hm = new HashMap<>();
			hm.put("memberId", userId);
			hm.put("updatePwd", updatePwd);
			
			// 비밀번호 변경 진행
			int result = memberService.updatePwd(hm);
			
			if(result > 0) { // 성공
				
				// 갱신된 회원 정보 세션에 다시 넣어 덮어씌워주기
				Member m = new Member();
				m.setMemberId(userId);
				m.setMemberPwd(updatePwd);
				
				
				Member updateMem = memberService.loginMember(m);
				System.out.println(updateMem);
				session.setAttribute("loginUser", updateMem);
				
				session.setAttribute("alertMsg", "비밀번호 변경 성공");
				
			} else { // 실패
				 session.setAttribute("alertMsg", "비밀번호 변경 실패");
			}
			
			
		} else {
			
			session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect:/member/myInformation";
	}
	
	// 인젝션 공격 막아야함
	// 회원 탈퇴용 메소드
	@PostMapping("delete")
	public String deleteMember(String userPwd, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		//loginUser에 세션값 담기
		// System.out.println(loginUser);
		
		if(loginUser.getMemberPwd().equals(userPwd)) { // 성공시
			// 비밀번호가 세션의 비밀번호와 같은지 판별(비크립트 추가시 변경해야함)
			
			int result = memberService.deleteMember(loginUser.getMemberId());
			// 회원탈퇴 시키고 오기
			if(result > 0) { // 탈퇴 성공시
				
				session.setAttribute("alertMsg", "회원탈퇴 성공");
				
				session.removeAttribute("loginUser");
				
				return "redirect:/";
				
			} else { // 탈퇴 실패시
				
				session.setAttribute("alertMsg", "회원탈퇴 실패");
				
				return "common/errorPage";
			}
			
		} else { // 실패시
			session.setAttribute("alertMsg", "잘못된 비밀번호 입니다.");
			
			return "redirect:/member/myInformation";
		}
		
	}
	
	@GetMapping("/myOrderPage")
	public String myOrderListPage(Model model, HttpSession session) {

	    Member loginUser = (Member) session.getAttribute("loginUser");
	    
	    if (loginUser != null) {
	        List<Product> product = memberService.orderProduct(loginUser.getMemberId());
	        model.addAttribute("product", product);
	    }

	    return "member/myOrderPage";
	}
	
}