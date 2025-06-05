package com.kh.soyo.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {

	@GetMapping("/faq")
	public String showLoginPage() {
		return "/faq";
	}
	
}