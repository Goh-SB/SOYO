package com.kh.soyo.member.controller;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;

import java.util.Map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.soyo.common.template.XssDefencePolicy;
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
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// 인증번호를 담아둘 해시맵 생성 (전역변수)
	// key : 인증할 email 주소, value : 인증번호
	private Map<String, String> certNoList = Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private MemberService memberService;

    MemberController(BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
	
	@GetMapping("/login")
	public String showLoginPage() {
		return "member/loginPage";
	}
	
	// 회원가입 페이지 이동 메소드
	@GetMapping("/memberEnrollForm")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	// 아이디 찾기 페이지 이동 메소드
	@GetMapping("/findMemberId")
	public String fndMemberId() {
		return "member/findMemberId";
	}
	
	
	// 내 정보 조회 페이지 이동메소드
	@GetMapping("/myInformation")
	public String myInformation() {
		
		return "member/myInformation";
	}
	
	// 내 정보 수정페이지 이동메소드
	@GetMapping("/memberUpdateForm")
	public String memberUpdateForm(HttpSession session){
		
		if(session.getAttribute("loginUser") != null) {
			
			Member loginUser = (Member) session.getAttribute("loginUser");
			// 로그인한 유저 세션값 가져오기
			
			// 주소값 뽑기
		    String address = loginUser.getAddress();

		    // 주소값 분리할 변수 생성
		    String baseAddress = "";
		    String detailAddress = "";

		    // + 가 있으면 +를 기준으로 문자열 나누기
		    if (address != null && address.contains("+")) {
		    	
		        String[] parts = address.split("\\+");
		        baseAddress = parts.length > 0 ? parts[0] : "";
		        detailAddress = parts.length > 1 ? parts[1] : "";
		        
		    } else {
		    	
		    	// 없으면 그냥 하나로
		        baseAddress = address;
		    }

		    // 세션에 따로 담기
		    session.setAttribute("baseAddress", baseAddress);
		    session.setAttribute("detailAddress", detailAddress);
			
			
			return "member/memberUpdateForm";
		}
		return "member/myInformation";
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
	
	// 새 비밀번호 받기 페이지
	@GetMapping("/newMemberPwd")
	public String newMemberPwd() {
		return "member/newMemberPwd";
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
		Member loginUser = memberService.selectMember(m.getMemberId());
		
		// 로그인 성공 조건: 아이디가 존재하고 비밀번호가 일치하면
		if(loginUser != null && bCryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) { // 성공

			// 응답데이터로 방금 로그인 성공한 회원의 정보 담기
			// > 단, 로그인한 회원의 정보를 로그아웃 전까지
			//   전역에서 꺼내다 쓸 수 있도록 담아둬야 한다.
			// > 브라우저 창이 닫히면 담긴 값도 날아가는 session 객체에 담기
			session.setAttribute("loginUser", loginUser);

			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");

			// 응답화면이 보여지게끔 처리 (리다이렉트)
			return "redirect:/";
			// > / 는 /soyo 뒤의 /를 나타냄.

		} else { // 로그인 실패

			// 에러문구 담아서 에러페이지 보여지게끔
			model.addAttribute("errorMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");

			// 응답페이지 보여지게끔 문자열 리턴
			return "common/errorPage";
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
		
		checkId = (XssDefencePolicy.defence(checkId)); // 아이디
		
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
		
		// XSS 공격 막기
		email = (XssDefencePolicy.defence(email)); // 이메일
		
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
	
	// 이메일 인증 확인용 메소드
	@ResponseBody
	@PostMapping("validate")
	public String validate(String email, String emailCheck) {
		
		// XSS 공격 막기
		email = (XssDefencePolicy.defence(email)); // 이메일
		emailCheck = (XssDefencePolicy.defence(emailCheck)); // 인증번호 확인
		
		String result = "";
		// 결과메세지 비워두기
		
		if(certNoList.get(email).equals(emailCheck)) {
			// 인증번호가 맞을 경우
			
			result = "인증성공";
		} else {
			
			result = "인증실패";
		}
		
		// 인증하고나면 성공이든 실패든 인증 정보 지우기
		certNoList.remove(email);
		
		return result;
	}
	
	// 회원가입시 실행할 메소드
	@PostMapping("insert")
	public String insertMember(Member m, @RequestParam("addrDetail") String addrDetail, Model model, HttpSession session) {
		
		// System.out.println(m);
		// System.out.println(addrDetail);
		
		// XXS 공격 막기
		m.setMemberId(XssDefencePolicy.defence(m.getMemberId())); // 아이디
		m.setMemberPwd(XssDefencePolicy.defence(m.getMemberPwd())); // 비밀번호
		m.setMemberName(XssDefencePolicy.defence(m.getMemberName())); // 이름
		m.setEmail(XssDefencePolicy.defence(m.getEmail())); // 이메일
		m.setAddress(XssDefencePolicy.defence(m.getAddress())); // 주소
		addrDetail = (XssDefencePolicy.defence(addrDetail)); // 상세주소
		m.setPhone(XssDefencePolicy.defence(m.getPhone())); // 전화번호
	
		// 비밀번호 암호화 하기
		String encPwd = bCryptPasswordEncoder.encode(m.getMemberPwd());
		
		// 암호화 한 비밀번호 넣기
		m.setMemberPwd(encPwd);
		
		// 도로명 주소와 상세주소를 합쳐기
		String fulladd = m.getAddress() + " + "+ addrDetail ;
		// 합친거 객체에넣기
		m.setAddress(fulladd);
		// 회원 db에 넣기
		int result = memberService.insertMember(m);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "SOYO의 회원이 되신 것을 환영합니다.");
			
			return "redirect:/";
		} else {
			
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
			
			return "common/errorPage";
			
		}
	}
	
	
	// 내 정보 변경시 실행할 메소드
	@PostMapping("update")
	public ModelAndView updateMember(Member m, @RequestParam("addrDetail")String addrDetail , HttpSession session, ModelAndView mv) {
		// System.out.println(m);
		
		// XSS 공격 막기
		// m.setMemberId(XssDefencePolicy.defence(m.getMemberId())); // 아이디
		// m.setMemberPwd(XssDefencePolicy.defence(m.getMemberPwd())); // 비밀번호
		m.setMemberName(XssDefencePolicy.defence(m.getMemberName())); // 이름
		// m.setEmail(XssDefencePolicy.defence(m.getEmail())); // 이메일
		m.setAddress(XssDefencePolicy.defence(m.getAddress())); // 주소
		addrDetail = (XssDefencePolicy.defence(addrDetail)); // 상세주소
		
		// 도로명 주소와 상세주소를 합쳐기
		String fulladd = m.getAddress() + " + "+ addrDetail ;
		// 합친거 객체에넣기
		m.setAddress(fulladd);
		
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
		
		// XSS 공격 막기
		originPwd = (XssDefencePolicy.defence(originPwd)); // 기존 비밀번호
		updatePwd = (XssDefencePolicy.defence(updatePwd)); // 바꿀 비밀번호
		checkPwd = (XssDefencePolicy.defence(checkPwd)); // 바꿀비밀번호 확인용
		
		// 비밀번호 비교를 위해 세션에서 비밀번호 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 일단 현재 사용중인 비밀번호가 맞는지 확인
		if(bCryptPasswordEncoder.matches(checkPwd, loginUser.getMemberPwd())) { // 같을경우
			
			// 바꿀 비밀번호도 암호화
			String updateEncPwd = bCryptPasswordEncoder.encode(updatePwd);
			
			// 해시맵으로 묶어서 전달값 넘겨주기
			HashMap<String, String> hm = new HashMap<>();
			hm.put("memberId", userId);
			hm.put("updatePwd", updateEncPwd);
			
			// 비밀번호 변경 진행
			int result = memberService.updatePwd(hm);
			
			if(result > 0) { // 성공
				
				// 갱신된 회원 정보 세션에 다시 넣어 덮어씌워주기
				Member m = new Member();
				m.setMemberId(userId);
				m.setMemberPwd(updatePwd);
				
				
				Member updateMem = memberService.loginMember(m);
				// System.out.println(updateMem);
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
	
	
	// 회원 탈퇴용 메소드
	@PostMapping("delete")
	public String deleteMember(String userPwd, HttpSession session) {
		
		// XSS 공격 막기
		userPwd = (XssDefencePolicy.defence(userPwd));
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		//loginUser에 세션값 담기
		// System.out.println(loginUser);
		if(bCryptPasswordEncoder.matches(userPwd, loginUser.getMemberPwd()))
		{ // 성공시
			// 비밀번호가 세션의 비밀번호와 같은지 판별(비크립트 추가)
			
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
	
	// 아이디 찾기용 메소드
	@PostMapping("findId")
	public String findId(Member m, HttpSession session) {
		
		// System.out.println(m);
		// Date date = m.getBirthDate();
		
		// SimpleDateFormat sdf = new SimpleDateFormat("RR/MM/dd");
		
		// XSS 공격 막기
		m.setMemberName(XssDefencePolicy.defence(m.getMemberName()));
		m.setEmail(XssDefencePolicy.defence(m.getEmail()));
		m.setPhone(XssDefencePolicy.defence(m.getPhone()));
		
		String result = memberService.findId(m);
		
		if(result == null) {
			session.setAttribute("alertMsg", "조건에 맞는 아이디가 없습니다.");
			return "member/findMemberId";
		} else {
			session.setAttribute("alertMsg", "조건에 맞는 Id : " + result);
			return "member/findMemberId";
		}
		
		
	}
	
	
	
	// 비밀번호 재발급 기능
	@PostMapping("changePwd")
	public String changePwd(Member m, HttpSession session) {
		
		String originEmail = memberService.findEmail(m);
		
		// XSS 공격 막기
	    m.setMemberId(XssDefencePolicy.defence(m.getMemberId()));
	    m.setEmail(XssDefencePolicy.defence(m.getEmail()));
	    
		// 이메일이 같을경우에만 비밀번호가 바뀌도록 조건문
		if(originEmail.equals(m.getEmail())) {
			// 이메일이 같을 경우
			
			// 랜덤비밀번호 생성을 위한 선언
			final String ABC = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	        final String NUM = "0123456789";
	        final String UQ = "!@#$%^&*()_";
			
	        
	        
	        // 일단 랜덤한 비밀번호 발급을 위한 구문 작성
	        // 기존 랜덤보다 중복성이 적은 시큐랜덤
	        SecureRandom random = new SecureRandom();
			
	        // 문자열을 합치기 위한 String빌더
	        StringBuilder sb = new StringBuilder();
	        
	        // 영문 6개
	        // 반복을 돌려서 원하는 갯수만큼 뽑아오기
	        for (int i = 0; i < 6; i++) {
	            sb.append(ABC.charAt(random.nextInt(ABC.length())));
	        }
	
	        // 특수문자 1개
	        sb.append(UQ.charAt(random.nextInt(UQ.length())));
	        
	        // 숫자 2개
	        for (int i = 0; i < 2; i++) {
	            sb.append(NUM.charAt(random.nextInt(NUM.length())));
	        }
	        
	        // 암호화 시키기
	        String newEncPwd = bCryptPasswordEncoder.encode(sb);
	        
	        // member 객체에의 비밀번호에 저장
	        m.setMemberPwd(newEncPwd);
	        
	        // 변경된 비밀번호로 바꾸고 오기
			int result = memberService.changePwd(m);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "현재 알림창을 닫으면 변경된 비밀번호를 다시 확인할 수 없습니다. 로그인 후 마이페이지에서 비밀번호를 변경해주세요. 변경된 임시비밀번호 : " + sb);
				return "member/newMemberPwd";
			} else {
				session.setAttribute("alertMsg", "비밀번호 재발급 실패 다시 시도해주세요");
				return "member/newMemberPwd";
			}
		} else {
			session.setAttribute("alertMsg", "이메일이 등록된 이메일과 다릅니다.");
			return "member/newMemberPwd";
		}
		
	}
	
	
	@GetMapping("/myOrderPage")
	public String myOrderListPage(Model model, HttpSession session) {

	    Member loginUser = (Member) session.getAttribute("loginUser");
	    
	    if (loginUser != null) {
	        List<Product> product = memberService.orderProduct(loginUser.getMemberId());
	        System.out.println(product);
	        model.addAttribute("product", product);
	    }

	   
	    return "member/myOrderPage";
	}
	
}