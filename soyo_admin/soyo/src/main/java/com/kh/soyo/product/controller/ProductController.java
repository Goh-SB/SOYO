package com.kh.soyo.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.FileRenamePolicy;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.ProductData;

import jakarta.servlet.http.HttpSession;

@RestController
@CrossOrigin(origins="http://localhost:5173")
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public HashMap<String, Object> productList(@RequestParam(value="cpage") int currentPage) {
		
		int listCount = productService.productListCount();
		int pageLimit = 16;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		
		ArrayList<Member> list = productService.productList(pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return hm;
	}
	
	@PostMapping("fileUpload")
	public ResponseEntity<Map<String, Object>> productFileUpload(
				@RequestParam("file") MultipartFile file,
				HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// System.out.println(file);
		
		if(file != null) {
			String filePath = "C:/SOYO/soyo_admin/soyo/src/main/resources/product_upfile/";
			String originName = file.getOriginalFilename();
			String changeName = FileRenamePolicy.saveFile(file, session, filePath);
			
			String fileUrl = "http://localhost:8100/resources/product_upfile/" + changeName;
					
			result.put("success", true);
			result.put("url", fileUrl);
		}
		return ResponseEntity.ok(result);
		
	}
	
	@PostMapping("enrollForm")
	public ResponseEntity<Map<String, Object>> productEnrollFrom(@RequestBody ProductData data) {
	
		Map<String, Object> result = new HashMap<>();
		
		// System.out.println(data);
		// System.out.println(data.getContent());
		// System.out.println(data.getSubject());
		// System.out.println(data.getImgList());
		
		
		
		result.put("success", true);
		return ResponseEntity.ok(result);
		
		
	}
	
}
