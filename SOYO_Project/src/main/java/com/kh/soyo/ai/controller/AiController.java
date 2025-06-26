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
	public Map<String, Object> recommendProducts(@RequestParam("tags") List<String> tags) {
		Product product = aiService.getBestProductByTags(tags);
		Map<String, Object> result = new HashMap<>();
		result.put("product", product);
		return result;
	}
	
}
