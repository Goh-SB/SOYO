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
		
			// 모든 배송지 조회
			ArrayList<DeliveryAddress> myDelivery = deliveryService.selectDelivery(memberId);
			
			// 기본 배송지 조회
			ArrayList<DeliveryAddress> defaultDelivery = deliveryService.selectDeliveryDefault(memberId);
			
			// 나머지 배송지
			ArrayList<DeliveryAddress> notDefaultDelivery = deliveryService.selectDeliveryNotDefault(memberId);
			
			model.addAttribute("myDelivery", myDelivery);
			model.addAttribute("myDefaultDelivery", defaultDelivery);
			model.addAttribute("notDefaultDelivery",notDefaultDelivery);
			
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
	
	// 배송지 등록
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
			
			return "redirect:myDeliveryList";
			
		} else {
			
			session.setAttribute("alertMsg" , "배송지 등록 실패");
			
			return "member/myDeliveryPage";
		}
		
		
	}
	
	// 라디오버튼이 클릭되면 실행할 메소드
	@PostMapping("setDefault")
	public String setDefault(DeliveryAddress d ,@RequestParam("addressNo") int addressNo, HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String memberId = loginUser.getMemberId();
		
		d.setAddressNo(addressNo);
		d.setMemberId(memberId);
		
		if(loginUser != null) {
			
			// 기본 배송지 설정시키기
			deliveryService.updateDefault(d);
		}
		return "redirect:myDeliveryList";
	}
	
	// 배송지 수정용 메소드
	@PostMapping("update")
	public String updateAddress(@RequestParam("addressDetail")String addressDetail 
											  ,DeliveryAddress d ,HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		
		d.setAddressName(XssDefencePolicy.defence(d.getAddressName()));
		d.setReceiverName(XssDefencePolicy.defence(d.getReceiverName()));
		d.setReceiverPhone(XssDefencePolicy.defence(d.getReceiverPhone()));
		d.setAddressOther(XssDefencePolicy.defence(d.getAddressOther()));
		addressDetail = XssDefencePolicy.defence(addressDetail);
		
		if(loginUser != null) {
			
			String fulladd = d.getAddressOther() + " + "+ addressDetail ;
			// 합친거 객체에넣기
			d.setAddressOther(fulladd);
			
			int result = deliveryService.updateAddress(d);
			
				System.out.println(d);
			if(result > 0) {
				
				session.setAttribute("alertMsg", "배송지 변경 성공");
			
				return "redirect:myDeliveryList";
				
			} else {
				
				session.setAttribute("alertMsg", "배송지 변경 실패");
				
				return "redirect:myDeliveryList";
			}	
			
		} else {
			
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			
			return "member/loginPage";
		}
		
		
	}
	
	// 배송지 삭제용 메소드
	@PostMapping("delete")
	public String deleteAddress(DeliveryAddress d ,HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		System.out.println(d);
		
		if(loginUser != null) {
			int result = deliveryService.deleteAddress(d);
			
			if(result > 0) {
				
				session.setAttribute("alertMsg", "삭제 성공");
				
				return "redirect:myDeliveryList";
				
			} else {
				
				session.setAttribute("alertMsg", "삭제 실패");
				
				return "redirect:myDeliveryList";
			}
			
			
		} else {
			
			session.setAttribute("alertMsg", "로그인 후 이용해주세요.");
			
			return "member/loginPage";
		}
		
	}
	
	
	
}
