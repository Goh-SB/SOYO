package com.kh.soyo.auth.controller;

import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.soyo.auth.model.service.AuthService;
import com.kh.soyo.member.model.vo.Member;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

@CrossOrigin(origins="http://localhost:5173")
@RestController
@RequestMapping("auth")
public class AuthController {
	
	// 비밀키를 상수필드로 지정
	public static final String SECRET_KEY 
				= "Hello123KHAcademy456Dangsan789WelcomeToDClass";
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private AuthService authService;
	
	@PostMapping("login")
	public String loginAdmin(@RequestBody Member m) {
		
		// 아이디 일치 검사
		Member loginUser = authService.loginAdmin(m.getMemberId());
		
		if(
			(loginUser != null)
			&& (loginUser.getMemberId().equals("admin"))
			&& (bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd()))
				) {
			
			Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes(StandardCharsets.UTF_8));
			
			String jwt = Jwts.builder() // Jwts 타입의 객체 생성
						     .setSubject(loginUser.getMemberId()) // 회원을 구분할 수 있는 고유값 (아이디, 회원번호 등) 셋팅
						     .claim("name", loginUser.getMemberName()) // 회원의 이름
						     .claim("role", "admin") // 이 회원의 권한 (관리자인지 일반회원인지)
						     .setIssuedAt(new Date()) // JWT 의 발급시간
						     .setExpiration(new Date(System.currentTimeMillis() + 1 * 60 * 60 * 1000)) // JWT 의 만료기간 (1시간)
						     .signWith(key, SignatureAlgorithm.HS256) // 서명 시 필요한 키, 서명 방법 지정
						     .compact();
			
			System.out.println(jwt);

			return jwt;
			
		} else {
			
			// > 로그인 실패 처리
			
			return null; // 그냥 null 리턴
		}
		
	}
	
}



