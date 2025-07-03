package com.kh.soyo.delivery.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.kh.soyo.auth.model.service.AuthServiceImpl;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.model.vo.Payment;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.delivery.model.service.DeliveryService;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.product.model.vo.Product;


@RestController
@CrossOrigin(origins={"http://192.168.40.32:5173", "http://192.168.40.23:5173", "http://192.168.40.17:5173"})
@RequestMapping("delivery")
public class DeliveryController {

    private final AuthServiceImpl authServiceImpl;
	
	@Autowired
    private DeliveryService deliveryService;

    DeliveryController(AuthServiceImpl authServiceImpl) {
        this.authServiceImpl = authServiceImpl;
    }

	@GetMapping("list")
	public HashMap<String, Object> deliveryList(@RequestParam(value="cpage") int currentPage){
		
		int listCount = deliveryService.deliveryListCount();

		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Delivery> list = deliveryService.deliveryList(pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
	
		return hm;
	}
	
	@GetMapping("info/{orderNo}")
	public Delivery deliveryDetail(@PathVariable int orderNo) {
		
		Delivery d = deliveryService.deliveryDetail(orderNo);
		return d;
	}
	
	@GetMapping("product/{orderNo}")
	public ArrayList<Delivery> deliveryProduct(@PathVariable int orderNo) {
		
		ArrayList<Delivery> list = deliveryService.paymentCount(orderNo);
		
		ArrayList<Delivery> result = new ArrayList<>();
		
		for(int i = 0; i < list.size(); i++) {
			Delivery d2 = new Delivery();
			d2.setProductNo(list.get(i).getProductNo());
			d2.setOrderImpNo(list.get(i).getOrderImpNo());
			
			Delivery d3 = deliveryService.paymentList(d2);
			
			result.add(d3);	
		}
		
		return result;		
	}
	
	@GetMapping("changeStatus")
	public String changeStatus(@RequestParam("orderNo") int orderNo,
								@RequestParam("orderStatus") String orderStatus) {
		
		int result=deliveryService.changeStatus(orderNo,orderStatus);
		return (result > 0) ? "수정 성공" : "수정 실패" ;
	}
	
	@GetMapping("payment")
	public HashMap<String, Object> paymentList(@RequestParam (value="cpage") int currentPage){
		
		int listCount = deliveryService.paymentListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		List<Payment> list = deliveryService.paymentList(pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("list", list);
		hm.put("pi", pi);
		
		return hm;

	}
	
	@GetMapping("searchMember")
	@ResponseBody
	public List<Payment> searchMember(@RequestParam("memberName") String memberName){
		
		return deliveryService.searchMember(memberName);
	}
	
	@GetMapping("memberInfo/{orderNo}")
	public Delivery memberInfo(@PathVariable int orderNo) {
		return deliveryService.memberInfo(orderNo);
	}
	
	@GetMapping("order/{orderNo}")
	public List<Payment> orderInfo(@PathVariable int orderNo){
		return deliveryService.orderInfo(orderNo);
	}
	
	@GetMapping("filter")
	public HashMap<String, Object> filter (Delivery delivery,
						@RequestParam(value="cpage") int currentPage) {
		
		// System.out.println(delivery.getOrderStatus());
		// System.out.println(currentPage);
		
		int listCount = deliveryService.filterListCount(delivery.getOrderStatus());
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Delivery> list = deliveryService.filterList(pi, delivery.getOrderStatus());
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return hm;
		
	
	}
}	


















