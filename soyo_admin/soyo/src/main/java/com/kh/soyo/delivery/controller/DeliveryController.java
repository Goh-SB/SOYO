package com.kh.soyo.delivery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.soyo.delivery.model.service.DeliveryService;
import com.kh.soyo.delivery.model.vo.Delivery;

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
}
