package com.kh.soyo.deliveryAddress.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.soyo.deliveryAddress.model.service.DeliveryAddressService;
import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;
import com.kh.soyo.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/deliveryAddres")
public class DeliveryAddressController {

	@Autowired
	private DeliveryAddressService deliveryService;
	
	
	// 배송지 목록조회용
	@GetMapping("myDeliveryList")
	public String myDeliveryList(HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		String memberId = loginUser.getMemberId();
		
		ArrayList<DeliveryAddress> myDelivery = deliveryService.selectDelivery(memberId);
		
		System.out.println(myDelivery);
		
		model.addAttribute("myDelivery", myDelivery);
		
		return "member/myDeliveryPage";
	}
	
}
