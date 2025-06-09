package com.kh.soyo.cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.soyo.cart.model.service.CartService;
import com.kh.soyo.cart.model.vo.Cart;
import jakarta.servlet.http.HttpSession;

public class CartController {
	// 의존성 주입
	@Autowired
	private CartService cartService;
	
	// 장바구니 추가용 컨트롤러
	@PostMapping("add")
	public String addCart(HttpSession session, @ModelAttribute Cart c) {
		// 세션에 memberId 변수가 존재하는지 확인
		String memberId = (String)session.getAttribute("memberId");
		
		// 로그인하지 않았다면 로그인 페이지로 이동
		if(memberId == null) {
			return "redirect:/member/login";
		}
		
		// 장바구니에 insert 처리 후 장바구니 목록으로 이동
		c.setMemberId(memberId);
		cartService.addCart(c);
		
		// 장바구니 목록으로 이동
		return "redirect:/cart/list";
	}
	
	// 장바구니 목록 조회용 컨트롤러
	@GetMapping("list")
	public ModelAndView cartList(HttpSession session, ModelAndView mav) {
		Map<String, Object> map = new HashMap<>();
		// 세션에 memberId 변수가 존재하는지 확인
		String memberId = (String)session.getAttribute("memberId");
		
		// 로그인했을 경우에만 이용 가능
		if(memberId != null) {
			ArrayList<Cart> list = cartService.cartList(memberId);
			
			// 장바구니 총액 계산
			int sumMoney = cartService.sumMoney(memberId);
			
			map.put("sumMoney", sumMoney);	// 장바구니 합계 금액
			map.put("list", list); 			// 맵에 자료 추가
			map.put("count", list.size());	// 개수
            
			// 포워딩 및 데이터 전달
			mav.setViewName("list"); 
			mav.addObject("map", map); 
            
			return mav;
			
		// 로그인하지 않았다면 로그인 페이지로 이동
		} else {
 			return new ModelAndView("member/login", "", null);
		}
	}
	
	// 장바구니 상품 개별 삭제용 컨트롤러
	@PostMapping("delete")
	public String deleteCart(@RequestParam int cartNo, HttpSession session) {
		// 로그인했을 경우에만 이용 가능
		if(session.getAttribute("memberId") != null)  {
			cartService.deleteCart(cartNo);
		}
		
		// 장바구니 목록으로 이동
		return "redirect:/cart/list";
	}
	
	// 장바구니 비우기용 컨트롤러
	@PostMapping("deleteAll")
	public String deleteAllCart(HttpSession session) {
		// 세션에 memberId 변수가 존재하는지 확인
		String memberId = (String)session.getAttribute("memberId");

		// 로그인했다면 장바구니를 비움
		if(memberId != null) {
			cartService.deleteAllCart(memberId);
		}
		
		// 장바구니 목록으로 이동
		return "redirect:/cart/list";
	}
	
	// 장바구니 갱신용 컨트롤러
	@PostMapping("modify")
	public String modifyCart(@RequestParam int[] cartNo,
							@RequestParam int[] productCount,
							HttpSession session) {
		// 세션에 memberId 변수가 존재하는지 확인
		String memberId = (String)session.getAttribute("memberId");
		
		if(memberId != null) {
			for(int i=0; i < cartNo.length; i++) {
				// 수량이 0이라면 기록 삭제
				if(productCount[i] == 0) {
					cartService.deleteCart(cartNo[i]);
					
				// 수량이 0이 아니라면 수정
				} else {
					Cart c = new Cart();
					c.setMemberId(memberId);
					c.setCartNo(cartNo[i]);
					c.setProductCount(productCount[i]);
					
					cartService.modifyCart(c);
				}
			}
		}
		
		// 장바구니 목록으로 이동
		return "redirect:/cart/list";
	}
}