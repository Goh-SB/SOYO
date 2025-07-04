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
import com.kh.soyo.common.template.XssDefencePolicy;
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

	    //System.out.println(cartList);
	    model.addAttribute("cartList", cartList);
	    return "cart/cart";
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int updateCart(Cart cart,			
						  HttpSession session,
						  Model model) {
		
		System.out.println(cart);
		 Member loginUser = (Member) session.getAttribute("loginUser");
		    if (loginUser == null) {
		    	model.addAttribute("fail","로그인 후 이용바랍니다");
		        // return "로그인후 이용바랍니다."; // 로그인 안 된 경우
		    }

		    String memberId = loginUser.getMemberId();

		    // 장바구니 수량 업데이트
		    int result=  cartService.updateCartCount(cart);
		    
		    Cart c = cartService.updateCart(memberId,cart.getProductNo(),cart.getProductCount());
	  
		    cart.setMemberId(loginUser.getMemberId());
    
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
		int result1 = 0;
		int result2 = 1;
		// 장바구니 정보 불러오기
		delivery.setReceiverName(XssDefencePolicy.defence(delivery.getReceiverName()));
		delivery.setReceiverPhone(XssDefencePolicy.defence(delivery.getReceiverPhone()));
		delivery.setAddressOther(XssDefencePolicy.defence(delivery.getAddressOther()));
		delivery.setRequestMsg(XssDefencePolicy.defence(delivery.getRequestMsg()));
		delivery.setAddressAlias(XssDefencePolicy.defence(delivery.getAddressAlias()));
		
		for(int i=0; i<delivery.getSelectedProductList().size(); i++) {
			
			delivery.setProductNo(delivery.getSelectedProductList().get(i)); 
			delivery.setProductSize(delivery.getSelectedProductSizeList().get(i));
			delivery.setProductCount(delivery.getSelectedProductCountList().get(i));
			
//			Cart c = cartService.loadInfo(delivery);
			
			
			// 2. 결제 테이블 저장 (단순화: 반복 insert 아님)
			result2 *= cartService.insertPayment(delivery);
		}
		
		// 1. 배송 + 주문 정보 저장
		result1 = cartService.deliveryInfo(delivery); // insertOrder + insertAddress
	    
		int result3 = 1;
		
		// 3. 결제 후 장바구니 삭제
		for(int i =0; i < delivery.getSelectedProductList().size(); i ++) {
			
			delivery.setProductNo(delivery.getSelectedProductList().get(i)); 
			delivery.setProductSize(delivery.getSelectedProductSizeList().get(i));
//			System.out.println(delivery.getProductNo());
//			System.out.println(delivery.getProductSize());
			result3 *= cartService.deleteCartProduct(delivery);
		}
//	    System.out.println( "1 번" + result1);
//	    System.out.println(" 2번 "+ result2);
//	    System.out.println("3번"+result3);

	    return (result1 * result2 * result3) >= 1 ? 1 : 0;
	}
	
	
	@PostMapping("/insert")
	@ResponseBody
	public String insertCart(@RequestBody Cart cart, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "notLogin";
	    }

	    cart.setMemberId(loginUser.getMemberId());

	    int result = cartService.insertCart(cart);
	    return result > 0 ? "success" : "fail";
	}
	
	
	// 장바구니 담기 취소 시 한 개 삭제용
	@PostMapping("/remove")
	@ResponseBody
	public String removeSingleCartItem(@RequestBody Cart cartItem, HttpSession session) {
	    Member loginUser = (Member) session.getAttribute("loginUser");
	    if (loginUser == null) return "notLogin";

	    String memberId = loginUser.getMemberId();

	    int result = cartService.removeSingleItem(memberId, cartItem.getProductNo(), cartItem.getProductSize());

	    return result > 0 ? "success" : "fail";
	}

	@PostMapping("changeStock")
	@ResponseBody
	public int changeStock(Delivery delivery) {
		
		int result = cartService.changeStock(delivery);
		System.out.println(result);
		System.out.println(delivery);
		return result;
	}
	
		
}














