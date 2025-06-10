package com.kh.soyo.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.soyo.delivery.model.service.DeliveryService;
import com.kh.soyo.delivery.model.vo.Delivery;
import com.kh.soyo.product.model.vo.Product;

@RestController
@CrossOrigin(origins="http://localhost:5173")
@RequestMapping("/delivery")
public class DeliveryController {
	
	@Autowired
    private DeliveryService deliveryService;

	@GetMapping("/list")
	public List<Delivery> deliveryList(){
		
		return deliveryService.deliveryList();
	}
	
	@GetMapping("info/{orderNo}")
	public Delivery deliveryDetail(@PathVariable int orderNo) {
		
		Delivery d = deliveryService.deliveryDetail(orderNo);
		
		return d;
	}
	@GetMapping("product/{orderNo}")
	public List<Product> deliveryProduct(@PathVariable int orderNo) {
		
		return deliveryService.deliveryProduct(orderNo);
				
	}
}
