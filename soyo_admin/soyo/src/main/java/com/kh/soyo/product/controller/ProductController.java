package com.kh.soyo.product.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.FileRenamePolicy;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.extern.slf4j.Slf4j;

@RestController
@CrossOrigin(origins="http://localhost:5173")
@RequestMapping("product")
@Slf4j
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public HashMap<String, Object> productList(@RequestParam(value="cpage") int currentPage) {
		
		int listCount = productService.productListCount();
		int pageLimit = 12;
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
				@RequestParam("file") MultipartFile file) {
		
		Map<String, Object> result = new HashMap<>();
		
		//System.out.println(file);
		
		if(file != null) {
			String filePath = "C:/SOYO/soyo_admin/soyo/src/main/webapp/resources/product_upfile/";
			String originName = file.getOriginalFilename();
			String changeName = FileRenamePolicy.saveFile(file, filePath);
			
			String fileUrl = "http://localhost:8100/resources/product_upfile/" + changeName;
					
			result.put("success", true);
			result.put("url", fileUrl);
		}
		return ResponseEntity.ok(result);
		
	}
	
	@PostMapping("enrollForm")
	public String enrollForm(
	       @ModelAttribute Product product,
	        @RequestParam(value="thumbnail") MultipartFile thumbnail,
	        @RequestParam(value="imageList") List<String> imageList,
	        HttpSession session) {

	  System.out.println(product);
	  System.out.println(thumbnail);
	  System.out.println(imageList);
	  
	  int result = 0;
	  
	  if(thumbnail != null) {
		  String filePath = "C:/SOYO/soyo_admin/soyo/src/main/webapp/resources/product_upfile/";
		  String originName = thumbnail.getOriginalFilename();
		  String changeName = FileRenamePolicy.saveFile(thumbnail, filePath);
		  
		  String fileUrl = "http://localhost:8100/resources/product_upfile/" + changeName;
		product.setProductOrigin(originName);
		product.setProductChange(changeName);
		
		System.out.println(product);
		result = productService.enrollForm(product);
	  }
	  
	    return (result > 0) ? "상품 등록에 성공했습니다." : "상품 등록에 실패했습니다." ;  
	    	
	}
	
	
}