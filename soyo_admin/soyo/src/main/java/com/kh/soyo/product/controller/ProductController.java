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
import com.kh.soyo.common.template.XssDefencePolicy;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.notice.model.service.NoticeServiceImpl;
import com.kh.soyo.product.model.service.ProductService;
import com.kh.soyo.product.model.vo.Product;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@CrossOrigin(origins="http://192.168.40.32:5173")
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
			
			String fileUrl = "http://192.168.40.32:8100/soyo/resources/product_upfile/" + changeName;
					
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
		//  String fileUrl = "http://192.168.40.32:8100/soyo/resources/product_upfile/" + changeName;
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
	public HashMap<String, Object> detail(@PathVariable int productNo,
						String productSize) {
		// System.out.println(productNo);
		// System.out.println(productSize);
		
		Product p = new Product();
		p.setProductNo(productNo);
	
		Product result = productService.detail(p);
		List<String> list = productService.detailSubTag(p);
		
		HashMap<String, Object> hm = new HashMap<>();
		
		hm.put("result", result);
		hm.put("list", list);
		// System.out.println(hm);
		return hm;
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
						@RequestParam(value="productSubTag", required=false) List<String> productSubTag,
						@RequestParam(value="thumbnail", required=false) MultipartFile thumbnail,
						@RequestParam(value="subThumbnail", required=false) MultipartFile subThumbnail) {
		
		// System.out.println(p);
		// System.out.println(thumbnail);
		// System.out.println(subThumbnail);
		// System.out.println(productSubTag);
		 
		
		int result = 0;
		
		int StockCount = productService.productStock(p);
		// > 상품에 해당하는 사이즈의 재고 여부 파악
		
		if(StockCount == 0) {
			result = productService.updateInsert(p);
			// > 재고가 없다면 수정 시 재고 먼저 insert
		}
		
		String filePath = "C:/SOYO/soyo_admin/soyo/src/main/webapp/resources/product_upfile/";
		
		if(thumbnail != null) {
			
			
			String originName = thumbnail.getOriginalFilename();
			String changeName = FileRenamePolicy.saveFile(thumbnail, filePath);
			  
			// String fileUrl = "http://192.168.40.32:8100/soyo/resources/product_upfile/" + changeName;
			p.setProductOrigin(originName);
			p.setProductChange(changeName);
			
			if(subThumbnail != null) {
				// 썸네일도 있고 서브 썸네일 있을떄
				String subOriginName = subThumbnail.getOriginalFilename(); 
				String subChangeName = FileRenamePolicy.saveFile(subThumbnail, filePath);
				
				p.setProductSubOrigin(subOriginName);
				p.setProductSubChange(subChangeName);
				result = productService.updateThumbnail(p);
			} else {
				// 썸네일은 있고 서브 썸네일 없을때
				result = productService.updateThumbnailNoSub(p);
				
			}
			// > 썸네일 있을떄 수정폼
			
		} else {
			
			if(subThumbnail != null) {
				// 썸네일은 없고 서브 썸네일만 있을떄
				String subOriginName = subThumbnail.getOriginalFilename(); 
				String subChangeName = FileRenamePolicy.saveFile(subThumbnail, filePath);
				
				p.setProductSubOrigin(subOriginName);
				p.setProductSubChange(subChangeName);
				result = productService.updateSubTumbnail(p);
			} else {
				// 썸네일도 없고 서브 썸네일도 없을떄
				result = productService.updateProduct(p);
				// > 썸네일 없을떄 수정 폼
			}
			
			result *= productService.updateSize(p);
			if(productSubTag != null && !productSubTag.isEmpty() ) {
				result *= productService.updateSubTag(p, productSubTag);
			}
			
			
			
		}
		
		return (result > 0) ? "상품 수정 성공" : "상품 수정 실패";
		
		
		
	}
}