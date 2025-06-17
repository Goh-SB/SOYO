package com.kh.soyo.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.soyo.cart.model.service.CartService;
import com.kh.soyo.cart.model.vo.Cart;
import com.kh.soyo.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	// 의존성 주입
	@Autowired
	private CartService cartService;
	
	@GetMapping("/cart")
	public String showCartPage(Model model, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "redirect:/member/login";
	    }

	    String memberId = loginUser.getMemberId();
	    List<Cart> cartList = cartService.cartList(memberId);

	    System.out.println("cartList size: " + cartList.size());

	    model.addAttribute("cartList", cartList);
	    return "cart/cart";
	}
		
}