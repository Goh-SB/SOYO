package com.kh.soyo.deliveryAddress.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.soyo.common.template.XssDefencePolicy;
import com.kh.soyo.deliveryAddress.model.service.DeliveryAddressService;
import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;
import com.kh.soyo.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/deliveryAddress")
public class DeliveryAddressController {

	@Autowired
	private DeliveryAddressService deliveryService;
	
	
	// 배송지 목록조회용
	@GetMapping("myDeliveryList")
	public String myDeliveryList(HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(loginUser != null) {
			
			String memberId = loginUser.getMemberId();
		
			ArrayList<DeliveryAddress> myDelivery = deliveryService.selectDelivery(memberId);
			
			model.addAttribute("myDelivery", myDelivery);
			
			return "member/myDeliveryPage";
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
			return "member/loginPage";
		}
		
		
	}
	
	// 배송지 등록 페이지 이동 메소드
	@GetMapping("newAddress")
	public String newAddress(HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(loginUser != null) {
		
			return "deliveryAddress/NewAddress";
			
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용 가능합니다.");
			
			return "member/loginPage";
		}
	}
	
	@PostMapping("newDeliveryAddress")
	public String newDeliveryAddress(@RequestParam("addressDetail")String addressDetail ,DeliveryAddress da ,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		da.setMemberId(loginUser.getMemberId()); 
		
		// XSS 공격 방지
		da.setAddressName(XssDefencePolicy.defence(da.getAddressName()));
		da.setReceiverName(XssDefencePolicy.defence(da.getReceiverName()));
		da.setReceiverPhone(XssDefencePolicy.defence(da.getReceiverPhone()));
		da.setAddressOther(XssDefencePolicy.defence(da.getAddressOther()));
		addressDetail = XssDefencePolicy.defence(addressDetail);
		
		// 주소와 상세주소를 합친 후 객체에 담기
		String fulladd = da.getAddressOther() + " + "+ addressDetail ;
		da.setAddressOther(fulladd);
		
		int result = deliveryService.newDeliveryAddress(da);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg" , "배송지 등록 성공");
			
			return "member/myDeliveryPage";
			
		} else {
			
			session.setAttribute("alertMsg" , "배송지 등록 실패");
			
			return "member/myDeliveryPage";
		}
		
		
	}
	
}
