package com.kh.soyo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	@GetMapping("/faq")
	public String showLoginPage() {
		return "/faq";
	}
	
	@GetMapping("/brand")
	public String showBrandPage() {
		return "guide/brand";
	}
	
	@GetMapping("/celeb")
	public String showCelebPage() {
		return "guide/celeb";
	}
	
	@GetMapping("/guide")
	public String showGuidePage() {
		return "guide/guide";
	}
	
}