package com.kh.soyo.product.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.common.template.FileRenamePolicy;
import com.kh.soyo.common.template.Pagination;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.notice.model.service.NoticeServiceImpl;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@CrossOrigin(origins="http://localhost:5173")
@RequestMapping("product")
@Slf4j
public class ProductController {

    private final NoticeServiceImpl noticeServiceImpl;

	@Autowired
	private ProductService productService;

    ProductController(NoticeServiceImpl noticeServiceImpl) {
        this.noticeServiceImpl = noticeServiceImpl;
    }
	
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
			
			String fileUrl = "http://localhost:8100/soyo/resources/product_upfile/" + changeName;
					
			result.put("success", true);
			result.put("url", fileUrl);
		}
		return ResponseEntity.ok(result);
		
	}
	
	@PostMapping("enrollForm")
	public String enrollForm(
	       @ModelAttribute Product product,
	        @RequestParam(value="thumbnail") MultipartFile thumbnail,
	        @RequestParam(value="subThumbnail") MultipartFile subThumbnail,
	        @RequestParam(value="productSubTag") List<String> productSubTag,
	        HttpSession session) {

//	  System.out.println(product);
//	  System.out.println(thumbnail);
//	  System.out.println(subThumbnail);
//	  System.out.println(productSubTag);
	  
	  int result = 0;
	  
	  if(thumbnail != null && subThumbnail != null) {
		  String filePath = "C:/SOYO/soyo_admin/soyo/src/main/webapp/resources/product_upfile/";
		  String originName = thumbnail.getOriginalFilename();
		  String changeName = FileRenamePolicy.saveFile(thumbnail, filePath);
		  
		  String subOrinName = subThumbnail.getOriginalFilename();
		  String subChangeName = FileRenamePolicy.saveFile(subThumbnail, filePath);
		//  String fileUrl = "http://localhost:8100/soyo/resources/product_upfile/" + changeName;
		product.setProductOrigin(originName);
		product.setProductChange(changeName);
		product.setProductSubOrigin(subOrinName);
		product.setProductSubChange(subChangeName);

		// System.out.println(product);
		result = productService.enrollForm(product, productSubTag);
		
		
		
	  }
	  
	    return (result > 0) ? "상품 등록에 성공했습니다." : "상품 등록에 실패했습니다." ;  
	    	
	}
	
	@GetMapping("search")
	public HashMap<String, Object> search(@RequestParam(value="cpage") int currentPage,
						String keyword) {
		
		// System.out.println(currentPage);
		// System.out.println(keyword);
		int listCount = productService.searchCount(keyword);
		int pageLimit = 12;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = productService.search(keyword, pi);
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("list", list);
		hm.put("pi", pi);
		
		return hm;
		
	}
	
	@GetMapping("filtering")
	public  HashMap<String, Object> filter(String cate,
						@RequestParam(value="cpage") int currentPage) {
		
		int listCount = productService.filterCount(cate);
		int pageLimit = 12;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = productService.filter(cate, pi);
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("list", list);
		map.put("pi", pi);
		
		return map;
		
	}
	
	@GetMapping("detail/{productNo}")
	public Product detail(@PathVariable int productNo,
						String productSize) {
		// System.out.println(productNo);
		// System.out.println(productSize);
		
		Product p = new Product();
		p.setProductNo(productNo);
	
		Product result = productService.detail(p);
		
		// System.out.println(result);
		return result;
	}
	
	
	@GetMapping("detail/size")
	public Product detailSize(int productNo,
							String productSize) {
		// System.out.println(productSize);
		// System.out.println(productNo);
		
		Product p = new Product();
		p.setProductNo(productNo);
		p.setProductSize(productSize);
		
		Product result = productService.detailSize(p);
		return result;
	}
	
	/**
	 * 상품 수정용 메소드
	 * @param p 기존의 상품정보
	 * @param thumbnail 기존의 썸네일 (null 이면 썸네일 수정 x)
	 * @param imageList 이미지 업로드 리스트
	 */
	@PostMapping("update")
	public String update (@ModelAttribute Product p,
						@RequestParam(value="thumbnail", required = false) MultipartFile thumbnail,
						@RequestParam(value="imageList", required = false) List<String> imageList) {
		// System.out.println(p);
		// System.out.println(thumbnail);
		
		int result = 0;
		
		int StockCount = productService.productStock(p);
		// > 상품에 해당하는 사이즈의 재고 여부 파악
		
		if(StockCount == 0) {
			result = productService.updateInsert(p);
			// > 재고가 없다면 수정 시 재고 먼저 insert
		}
		
		if(thumbnail != null) {
			
			String filePath = "C:/SOYO/soyo_admin/soyo/src/main/webapp/resources/product_upfile/";
			String originName = thumbnail.getOriginalFilename();
			String changeName = FileRenamePolicy.saveFile(thumbnail, filePath);
			  
			// String fileUrl = "http://localhost:8100/soyo/resources/product_upfile/" + changeName;
			p.setProductOrigin(originName);
			p.setProductChange(changeName);
			
			result = productService.updateThumbnail(p);
			// > 썸네일 있을떄 수정폼
			
			return (result > 0) ? "상품 수정 성공" : "상품 수정 실패";
			
		} else {
			result = productService.update(p);
			// > 썸네일 없을떄 수정 폼
			
			return (result > 0) ? "상품 수정 성공" : "상품 수정 실패";
		}
	}
}