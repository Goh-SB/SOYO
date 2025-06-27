package com.kh.soyo.ai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.ai.model.service.AiService;
import java.util.List;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;
import java.util.Arrays;
import java.util.ArrayList;

@Controller
@RequestMapping("/ai")
public class AiController {
	
	@Autowired
	private AiService aiService;
	
	@GetMapping("/recommend")
	public String showAiPage() {
		
		return "ai/recommend";
		
	}
	
	@PostMapping("/recommend")
	@ResponseBody
	public Map<String, Object> recommendProducts(@RequestParam(value = "tags", required = false) List<String> tags, 
	                                            @RequestParam(value = "inputText", required = false) String inputText) {
		// tags가 null이면 빈 리스트로 초기화
		if (tags == null) {
			tags = new ArrayList<>();
		}
		
		// 키워드 처리 로직 적용
		List<String> processedTags = aiService.processKeywords(tags, inputText);
		Product product = aiService.getBestProductByTags(processedTags);
		Map<String, Object> result = new HashMap<>();
		result.put("product", product);
		return result;
	}
	
	// 테스트용 엔드포인트
	@GetMapping("/test")
	@ResponseBody
	public Map<String, Object> testProducts() {
		List<Product> products = aiService.getAllProducts();
		Map<String, Object> result = new HashMap<>();
		result.put("products", products);
		result.put("count", products.size());
		return result;
	}
	
	// 간단한 테스트용 엔드포인트
	@GetMapping("/test-simple")
	@ResponseBody
	public Map<String, Object> testSimpleRecommend() {
		// 여성 카테고리로 테스트
		List<String> testTags = Arrays.asList("여성");
		Product product = aiService.getBestProductByTags(testTags);
		Map<String, Object> result = new HashMap<>();
		result.put("product", product);
		result.put("testTags", testTags);
		return result;
	}
	
}
