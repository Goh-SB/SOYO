package com.kh.soyo.cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.soyo.cart.model.service.CartService;
import com.kh.soyo.cart.model.vo.Cart;
import com.kh.soyo.cart.model.vo.Delivery;
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

	    model.addAttribute("cartList", cartList);
	    return "cart/cart";
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int updateCart(Cart cart,			
						  HttpSession session,
						  Model model) {
		
		
		 Member loginUser = (Member) session.getAttribute("loginUser");
		    if (loginUser == null) {
		    	model.addAttribute("fail","로그인 후 이용바랍니다");
		        // return "로그인후 이용바랍니다."; // 로그인 안 된 경우
		    }

		    String memberId = loginUser.getMemberId();

		    // 장바구니 수량 업데이트
		    int result=  cartService.updateCartCount(loginUser.getMemberId(),cart.getProductNo(),cart.getProductCount());
		    
		    Cart c = cartService.updateCart(memberId,cart.getProductNo(),cart.getProductCount());

		    
		    
		    model.addAttribute("c",c);
		    //System.out.println(c.getProductCount());
		    return c.getProductCount();
		   
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public String deleteselected(@RequestParam List<Integer> productNoList,
							  HttpSession session) {
		  Member loginUser = (Member) session.getAttribute("loginUser");
		    if (loginUser == null) return "실패";

	    String memberId = loginUser.getMemberId();
	    int result = cartService.deleteSelected(memberId, productNoList);

	    return result > 0 ? "성공" : "실패";
		
	}
	
	@GetMapping("/paymentCheck")
	public String paymentCheck(@RequestParam("productNoList") List<Integer> productNoList, Model model,
											  HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) return "실패";

	    String memberId = loginUser.getMemberId();
	   
	    //System.out.println(productNoList);
	    
	    List<Cart> selectedProducts=cartService.selectedProducts(memberId,productNoList);
	    
	    int totalPrice = 0;
	    
	    for(Cart c : selectedProducts) {
	    	
	    	if (c != null) {
	    	    totalPrice += c.getProductPrice() * c.getProductCount();
	    	}
	    }
	    
	    model.addAttribute("selectedProducts", selectedProducts);
	    model.addAttribute("totalPrice", totalPrice);

	    return "cart/paymentCheck"; // 이동할 JSP 경로
	}
	
	@PostMapping("/insertOrder")
	@ResponseBody
	public int insertOrder(@RequestBody Delivery delivery) {
		System.out.println(delivery);	
	    return cartService.deliveryInfo(delivery); 
	}
		
}














